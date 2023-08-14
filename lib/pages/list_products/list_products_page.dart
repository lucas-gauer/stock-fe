import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../../services/api.dart';
import '../create_product/create_product_page.dart';
import '../login/login_page.dart';
import '../product/product_page.dart';
import 'controller.dart';

class ListProductsPage extends StatelessWidget {
  ListProductsPage({super.key});

  final controller = Get.put(ListProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products"), actions: [
        IconButton(
          onPressed: () {
            api.logout();
            Get.offAll(LoginPage());
          },
          icon: const Icon(Icons.logout),
        )
      ]),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => controller.loadProducts(),
            child: const Text("Refresh"),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ProductsList(controller.products),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(CreateProductPage()),
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList(this.products, {super.key});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductTile(products[index]);
      },
    );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(product.name),
        trailing: Text(product.stock.toString()),
        onTap: () => Get.to(ProductPage(product)),
      ),
    );
  }
}
