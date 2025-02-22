import 'package:flutter/material.dart';

import '../utils/strings.dart';

class NoData extends StatelessWidget {
  const NoData({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (child != null) child!,
          const Text(Strings.noDataFound),
        ],
      ),
    );
  }
}
