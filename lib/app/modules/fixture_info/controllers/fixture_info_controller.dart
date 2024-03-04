import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';

class FixtureInfoController extends GetxController {
  @override
  void onInit() {
    inComingFixtures = Get.arguments as List<Fixtures>;
    super.onInit();
  }

  late List<Fixtures> inComingFixtures;
}
