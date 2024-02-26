import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/modules/tournament/bindings/tournament_binding.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/screen_template.dart';
import '../../../widgets/select_player_count_view.dart';
import '../../../widgets/tournament_setup_view_one.dart';
import '../controllers/tournament_controller.dart';
import 'widgets/select_players.dart';

class TournamentView extends GetView<TournamentController> {
  const TournamentView({super.key});

  @override
  Widget build(BuildContext context) {
    TournamentBinding binding = TournamentBinding();
    binding.dependencies();
    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      body: Obx(() => BuddyScreenTemplate(
            mainChild: const CreateTournamentViewSelector(),
            isHintVisible: controller.tournamentState.currentTournamentStep ==
                CreateTournamentStep.stepOne,
          )),
    );
  }
}

class CreateTournamentViewSelector extends StatelessWidget {
  const CreateTournamentViewSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TournamentController>(
      init: TournamentController(),
      initState: (_) {},
      builder: (tournamentController) {
        switch (tournamentController.tournamentState.currentTournamentStep) {
          case CreateTournamentStep.stepOne:
            return const TournamentSetupViewOne();
          case CreateTournamentStep.stepTwo:
            return const SelectPlayerCountView();
          case CreateTournamentStep.stepThree:
            return const SelectPlayersView();
        }
      },
    );
  }
}
