import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_controller.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';
import 'package:bracket_buddy/app/modules/tournament/data/tournament_dummy_data.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/app/widgets/create_tournament_header.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:scrollable/exports.dart';

class SelectPlayerCountView extends StatelessWidget {
  const SelectPlayerCountView({super.key});

  @override
  Widget build(BuildContext context) {
    TournamentController tournamentController =
        Get.find<TournamentController>();
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                tournamentController
                    .updateCurrentTournamentStep(CreateTournamentStep.stepOne);
              },
              child: const BuddyHeadingText(
                text: "<",
                fontSize: 58,
                textColor: AppColors.primaryGreenLight,
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: CreateTournamentHeader(
                headerTitle: "Select Number of Players",
              ),
            ),
          ],
        ),
        Gap(20.h),
        SizedBox(
          height: 390.h,
          width: double.maxFinite,
          child: GetX<TournamentController>(
            init: TournamentController(),
            initState: (_) {},
            builder: (tournamentController) {
              List<int> numberOfPlayers = getNumberOfPlayersList(
                  tournamentController.tournamentState.tournamentType ==
                      TournamentType.knockOut);
              return ScrollHaptics(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        tournamentController
                            .numberOfPlayersSelected(numberOfPlayers[index]);
                      },
                      child: GetX<TournamentController>(
                        init: TournamentController(),
                        initState: (_) {},
                        builder: (tournamentController) {
                          return Container(
                            height: 50.h,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.r),
                                side: BorderSide(
                                    color: tournamentController.tournamentState
                                                .numberOfPlayers ==
                                            numberOfPlayers[index]
                                        ? AppColors.primaryGreenLight
                                        : AppColors.borderGrey,
                                    width: 0.80.w),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BuddyBodyText(
                                    textColor: tournamentController
                                                .tournamentState
                                                .numberOfPlayers ==
                                            numberOfPlayers[index]
                                        ? AppColors.primaryGreenLight
                                        : AppColors.primaryTextColor,
                                    text: numberOfPlayers[index].toString()),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  itemCount: numberOfPlayers.length,
                ),
              );
            },
          ),
        ),
        Gap(20.h),
        BuddyButton(
          onTap: () {
            tournamentController
                .updateCurrentTournamentStep(CreateTournamentStep.stepThree);

            tournamentController.generatePlayerNames();
          },
          label: "Next",
          btnColor: AppColors.primaryGreenLight,
        )
      ],
    );
  }

  List<int> getNumberOfPlayersList(bool isKnockOutTournament) {
    List<int> numberOfPlayers =
        isKnockOutTournament ? knockoutNumberList : leagueNumberList;
    return numberOfPlayers;
  }
}
