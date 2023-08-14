import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Name:"),
            TextField(controller: controller.nameController),
            const Text("Password:"),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () => controller.register(),
      ),
    );
  }
}
