import 'package:get/get.dart';
import 'package:pro_z/src/store/store_index.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import 'services/services.dart';

class ProZ {
  static Future init() async {
    final preference = await StreamingSharedPreferences.instance;
    Get.put<StorageService>(StorageService(preference));
    Get.put<HttpSetting>(HttpSetting());
  }
}
