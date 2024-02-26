import 'package:get/get.dart';

import '../controllers/fixtures_controller.dart';

class FixturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FixturesController>(
      () => FixturesController(),
    );
  }
}
