import 'package:get/get.dart';
import 'package:patterns_getx/controllers/main_controller.dart';

import '../controllers/update_controller.dart';

class DIService {
  static Future<void> init() async {
    //Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
  }
}
