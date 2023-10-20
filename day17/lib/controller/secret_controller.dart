import 'package:day17/model/secret.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../util/api_routes.dart';

class SecretController extends GetxController {
  RxList<Secret> _secrets = <Secret>[].obs;

  Dio dio = Dio();

  List<Secret> get secrets => _secrets;

  fetchSecrets() async {
    var res = await dio.get(ApiRoutes.secrets);
    var items = List<Map<String, dynamic>>.from(res.data['items']);
    _secrets(items.map((e) => Secret.fromMap(e)).toList());
  }

  @override
  void onInit() {
    super.onInit();
    fetchSecrets();
  }
}
