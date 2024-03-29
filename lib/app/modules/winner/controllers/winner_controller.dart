import 'package:audioplayers/audioplayers.dart';
import 'package:bracket_buddy/app/modules/home/controllers/home_controller.dart';
import 'package:bracket_buddy/app/repository/fixtures_repo.dart';
import 'package:bracket_buddy/app/repository/player_repo.dart';
import 'package:bracket_buddy/app/repository/tournament_repo.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/player_db_model.dart';

class WinnerController extends GetxController {
  final _homeController = Get.find<HomeController>();

  @override
  void onInit() {
    winner = Get.arguments as Player;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      HapticFeedback.vibrate();

      var player = AudioPlayer();
      await player.setSourceAsset(Assets.audioFireworks);
      await player.resume();
    });
    super.onInit();
  }

  late Player winner;

  void finishAndCloseTournament() async {
    _homeController.deleteTournament(winner.tournament.value!.tournamentId);

    Get.offNamedUntil(
        Routes.HOME, (route) => route.settings.name == Routes.HOME);
  }
}
