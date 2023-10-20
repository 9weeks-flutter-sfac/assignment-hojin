import 'package:day17/view/page/secret_page.dart';
import 'package:day17/view/page/setting_page.dart';
import 'package:day17/view/page/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('비밀듣는 고양이'),
        ListTile(
          title: const Text('비밀보기'),
          onTap: () => Get.toNamed(SecretPage.route),
        ),
        ListTile(
          title: const Text('비밀쓰기'),
          onTap: () => Get.toNamed(UploadPage.route)
        ),
        ListTile(
          title: const Text('앱 설정'),
          onTap: () => Get.toNamed(SettingPage.route),
        ),
      ],
    ));
  }
}
