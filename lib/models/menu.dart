import 'package:flutter/material.dart';

class Menu {
  final String title;
  final String svg;
  final IconData icon;
  final String? badge;

  const Menu({
    required this.title,
    required this.icon,
    required this.svg,
    this.badge,
  });
}
