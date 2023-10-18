import 'package:day16/controller/auth_controller.dart';
import 'package:day16/controller/login_controller.dart';
import 'package:day16/controller/main_controller.dart';
import 'package:day16/view/login_page.dart';
import 'package:day16/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
        GetPage(name: MainPage.routeName, page: () => const MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.routeName),
            child: const Text('Hello World'),
          ),
        ),
      ),
    ),
  );
}