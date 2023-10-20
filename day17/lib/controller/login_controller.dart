import 'package:day17/controller/auth_controller.dart';
import 'package:day17/view/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}