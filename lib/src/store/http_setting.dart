import 'package:get/get.dart';

import '../services/services.dart';

class HttpSetting extends GetxController {
  static HttpSetting get to => Get.find();
  String get token => StorageService.to.getString('STORAGE_USER_TOKEN_KEY');
  String get baseUrl => StorageService.to.getString('HTTP_SETTING_BASE_URL');
  /// 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString('STORAGE_USER_TOKEN_KEY', value);
  }
  Future<void> setBaseUrl(String value) async {
    // _baseUrl.value = value;
    // _baseUrl.refresh();
    await StorageService.to.setString('HTTP_SETTING_BASE_URL', value);
  }
}
