import 'package:day17/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.idController,
              ),TextField(
                controller: controller.pwController,
              ),
              ElevatedButton(onPressed: controller.login, child: const Text('Login')),
              TextButton(onPressed: () => Get.toNamed('/signup'), child: const Text('회원가입')),
            ],
          ),
        )
      ),
    );
  }
}
