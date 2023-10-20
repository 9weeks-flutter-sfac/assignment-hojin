import 'package:day17/controller/auth_controller.dart';
import 'package:day17/controller/upload_controller.dart';
import 'package:day17/view/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});

  static const route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('비밀쓰기'),
          TextField(
            controller: controller.inputController,
            maxLines: 10,
            minLines: 8,
          ),
          ElevatedButton(onPressed: controller.upload, child: Text('업로드')),
        ],
      )
    );
  }
}
