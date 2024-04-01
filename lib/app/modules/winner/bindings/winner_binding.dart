import 'package:get/get.dart';

import '../controllers/winner_controller.dart';

class WinnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WinnerController>(
      () => WinnerController(),
    );
  }
}
