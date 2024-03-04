import 'package:get/get.dart';

import '../controllers/fixture_info_controller.dart';

class FixtureInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FixtureInfoController>(
      () => FixtureInfoController(),
    );
  }
}
