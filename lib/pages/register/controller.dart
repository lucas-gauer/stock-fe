import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositories/user.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register() async {
    await UserRepository.create(
      nameController.text,
      passwordController.text,
    );

    Get.back();
  }
}
