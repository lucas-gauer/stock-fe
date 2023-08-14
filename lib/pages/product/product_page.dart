import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import 'controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage(this.product, {super.key})
      : controller = Get.put(ProductController(product),
            tag: product.productId.toString());

  final Product product;

  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Stock:"),
            TextField(
              controller: controller.stockController,
            ),
            ElevatedButton(
              child: const Text("Delete product"),
              onPressed: () => controller.deleteProduct(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () => controller.updateProduct(),
      ),
    );
  }
}
