import 'package:day17/controller/auth_controller.dart';
import 'package:day17/controller/login_controller.dart';
import 'package:day17/controller/secret_controller.dart';
import 'package:day17/controller/signup_controller.dart';
import 'package:day17/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'util/paegs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SecretCat',
      theme: ThemeData(useMaterial3: true),
      getPages: AppRoutes.pages,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.put(SecretController(), permanent: true);
        Get.lazyPut(() => SignupController());
        Get.put(UploadController(), permanent: true);
      }),
      initialRoute: '/login',
    );
  }
}
