import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositories/products.dart';
import '../list_products/controller.dart';

class CreateProductController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  Future<void> createProduct() async {
    ProductsRepository.create(
      nameController.text,
      int.parse(stockController.text),
    );

    Get.find<ListProductsController>().loadProducts();

    Get.back();
  }
}
