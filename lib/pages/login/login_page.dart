import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/register_page.dart';
import 'controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("No account?"),
                ),
                ElevatedButton(
                  child: const Text("Register"),
                  onPressed: () => Get.to(RegisterPage()),
                ),
              ],
            ),
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
        onPressed: () => controller.login(),
      ),
    );
  }
}
