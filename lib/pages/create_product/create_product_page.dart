import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CreateProductPage extends StatelessWidget {
  CreateProductPage({super.key});

  final controller = Get.put(CreateProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create a product")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name:"),
            TextField(controller: controller.nameController),
            const Text("Stock:"),
            TextField(controller: controller.stockController),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () => controller.createProduct(),
      ),
    );
  }
}
