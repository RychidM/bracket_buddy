import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/modules/tournament/bindings/tournament_binding.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';
import 'package:bracket_buddy/app/widgets/buddy_screen_body.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/buddy_hint_container.dart';
import '../../../widgets/select_player_count_view.dart';
import '../../../widgets/tournament_setup_view_one.dart';
import '../controllers/tournament_controller.dart';
import 'widgets/select_players.dart';

class TournamentView extends GetView<TournamentController> {
  const TournamentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TournamentBinding binding = TournamentBinding();
    binding.dependencies();
    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesBgSt,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 70.h,
            left: 0,
            right: 0,
            child: const BuddyScreenBody(
              child: CreateTournamentViewSelector(),
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 50.w,
            right: 50.w,
            child: Obx(() => BuddyHintContainer(
                  isHintVisible:
                      controller.tournamentState.currentTournamentStep ==
                          CreateTournamentStep.stepOne,
                )),
          )
        ],
      ),
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