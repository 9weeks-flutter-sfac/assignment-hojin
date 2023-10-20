import 'package:day17/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  var inputController = TextEditingController();
  Dio dio = Dio();

  upload() async {
    if (inputController.text.isEmpty) return;
    var res = await dio.post(ApiRoutes.upload, data: {'secret': inputController.text});
  }

}