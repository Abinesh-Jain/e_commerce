import 'package:flutter/material.dart';

import 'routes.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: Routes.routes,
    );
  }
}
