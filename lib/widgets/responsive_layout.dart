import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    required this.child,
  });

  final WidgetBuilder? mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return mobile?.call(context) ?? child;
        } else if (constraints.maxWidth < 1200) {
          return tablet?.call(context) ?? child;
        } else {
          return desktop?.call(context) ?? child;
        }
      },
    );
  }
}
