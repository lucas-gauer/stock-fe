import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';
import '../../repositories/products.dart';
import '../list_products/controller.dart';

class ProductController extends GetxController {
  ProductController(this.product);

  final Product product;

  TextEditingController stockController = TextEditingController();

  @override
  void onInit() {
    stockController.text = product.stock.toString();
    super.onInit();
  }

  void updateProduct() {
    final product_ = Product(
      productId: product.productId,
      name: product.name,
      stock: int.parse(stockController.text),
    );
    ProductsRepository.update(product_);

    Get.snackbar("Stock Updated", "New stock is ${product_.stock}");

    Get.find<ListProductsController>().loadProducts();
  }

  void deleteProduct() {
    ProductsRepository.delete(product.productId);

    Get.find<ListProductsController>().loadProducts();

    Get.back();
  }
}
