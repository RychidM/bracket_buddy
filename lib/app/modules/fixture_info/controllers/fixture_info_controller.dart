import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';

class FixtureInfoController extends GetxController {
  @override
  void onInit() {
    inComingFixtures = Get.arguments as List<Fixture>;
    super.onInit();
  }

  late List<Fixture> inComingFixtures;
}
