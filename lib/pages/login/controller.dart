import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/api.dart';
import '../list_products/list_products_page.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    await api.login(nameController.text, passwordController.text);

    if (api.isLogged) Get.off(ListProductsPage());
  }
}
