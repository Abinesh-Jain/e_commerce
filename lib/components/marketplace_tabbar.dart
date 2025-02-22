import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class MarketplaceTabbar extends StatelessWidget {
  const MarketplaceTabbar({
    super.key,
    this.tabs = const [],
    this.selectedIndex = 0,
    this.onTabTapped,
  });

  final int selectedIndex;

  final List<String> tabs;

  final ValueChanged<int>? onTabTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        itemCount: tabs.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onTabTapped?.call(index),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: selectedIndex == index
                    ? AppColors.coralRed
                    : AppColors.mercury,
              ),
            ),
            child: Text(
              tabs[index],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => const SizedBox(width: 8),
      ),
    );
  }
}
