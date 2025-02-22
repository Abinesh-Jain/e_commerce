import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    this.height,
    this.color,
    this.icon,
    this.logo,
    required this.child,
  });

  final double? height;

  final Color? color;

  final String? icon;

  final Widget child;

  final Widget? logo;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minHeight: height ?? 36),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) logo ?? SvgPicture.asset(icon!),
            const SizedBox(width: 4),
            child,
          ],
        ),
      ),
    );
  }
}
