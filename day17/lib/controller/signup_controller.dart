import 'package:day17/controller/auth_controller.dart';
import 'package:day17/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var pwController = TextEditingController();
  var pw2Controller = TextEditingController();

  signup() async {
    Get.find<AuthController>().signup(
      emailController.text,
      pwController.text,
      pw2Controller.text,
      usernameController.text,
    );
  }
}
