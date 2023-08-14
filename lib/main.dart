import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login/login_page.dart';

void main() {
  runApp(const StockManager());
}

class StockManager extends StatelessWidget {
  const StockManager({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Stock Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo[700]!),
      ),
      home: LoginPage(),
    );
  }
}
