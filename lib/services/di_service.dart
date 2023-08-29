import 'package:get/get.dart';
import 'package:patterns_getx/controllers/create2_controller.dart';
import 'package:patterns_getx/controllers/main_controller.dart';
import 'package:patterns_getx/controllers/splash_controller.dart';
import 'package:patterns_getx/controllers/starter_controller.dart';

import '../controllers/update2_controller.dart';
import '../controllers/update_controller.dart';

class DIService {
  static Future<void> init() async {
    //Get.put<MainController>(MainController());
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<StarterController>(() => StarterController(), fenix: true);
    Get.lazyPut<CController>(() => CController(), fenix: true);
    Get.lazyPut<UController>(() => UController(), fenix: true);
  }
}
