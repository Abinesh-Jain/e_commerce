import 'dart:async';

import 'package:flutter/material.dart';

import '../utils/strings.dart';

class Paginator<T> extends StatefulWidget {
  const Paginator({
    super.key,
    required this.get,
    required this.itemBuilder,
    this.limit = 10,
  });

  final int limit;

  final FutureOr<List<T>> Function(int page) get;

  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  @override
  State<Paginator<T>> createState() => _PaginatorState<T>();
}

class _PaginatorState<T> extends State<Paginator<T>> {
  late final ScrollController _scrollController;
  final List<T> data = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    fetch();
    _scrollController.addListener(listener);
  }

  void listener() => _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent
      ? fetch()
      : null;

  void fetch() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    final pageData = await widget.get(page);
    data.addAll(pageData);
    page++;
    hasMore = pageData.length >= widget.limit;
    isLoading = false;
    setState(() {});
  }

  Future<void> refresh() async {
    page = 1;
    data.clear();
    hasMore = true;
    setState(() {});
    fetch();
  }

  void scrollToTop() => _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      if (isLoading) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
              SizedBox(height: 16),
              Text(Strings.loading),
            ],
          ),
        );
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.hourglass_empty,
                size: 100,
              ),
              const SizedBox(height: 16),
              const Text(Strings.noDataFound),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: refresh,
                icon: const Icon(Icons.refresh),
                label: const Text(Strings.refresh),
              ),
            ],
          ),
        );
      }
    }
    return RefreshIndicator.adaptive(
      onRefresh: refresh,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: data.length + 1,
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == data.length) {
            if (isLoading) {
              return const ListTile(
                title: Text(Strings.loading),
                leading: CircularProgressIndicator.adaptive(),
              );
            }
            if (!hasMore) {
              return ListTile(
                leading: const Icon(Icons.hourglass_empty),
                title: const Text(Strings.endOfList),
                trailing: IconButton(
                  onPressed: scrollToTop,
                  icon: const Icon(Icons.arrow_upward),
                ),
              );
            }
            return const ListTile(
              leading: Icon(Icons.hourglass_empty),
              title: Text(Strings.loading),
              trailing: Icon(Icons.arrow_upward),
            );
          }
          return widget.itemBuilder(context, index, data[index]);
        },
        separatorBuilder: (_, index) => const SizedBox(height: 16),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
