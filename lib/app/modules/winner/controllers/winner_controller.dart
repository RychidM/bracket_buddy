import 'package:get/get.dart';

import '../../../db_services/collections/player_db_model.dart';

class WinnerController extends GetxController {
  @override
  void onInit() {
    winner = Get.arguments as Player;
    super.onInit();
  }

  late Player winner;
}
