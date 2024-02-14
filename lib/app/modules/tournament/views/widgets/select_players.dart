import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:scrollable/exports.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../widgets/create_tournament_header.dart';
import '../../../../widgets/text_widgets/heading_text.dart';
import '../../controllers/tournament_controller.dart';
import '../../controllers/tournament_state.dart';
import '../../data/models/player_model.dart';

class SelectPlayersView extends StatelessWidget {
  const SelectPlayersView({super.key});

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
                    .updateCurrentTournamentStep(CreateTournamentStep.stepTwo);
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
                headerTitle: "Select Your Players",
              ),
            ),
          ],
        ),
        Gap(10.h),
        Expanded(
          child: ScrollHaptics(
            child: GetX<TournamentController>(
              init: TournamentController(),
              initState: (_) {},
              builder: (tournamentController) {
                List<Player> players =
                    tournamentController.tournamentState.players;
                return ListView.builder(
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      Color avatarBgColor =
                          tournamentController.getAccentColor(index);
                      return Container(
                        padding: AppTheme.bPadding5,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(54.r),
                            side: BorderSide(
                                color: AppColors.borderGrey, width: 0.80.w),
                          ),
                        ),
                        child: Row(
                          children: [
                            BuddyBodyText(text: "  ${index + 1}"),
                            Gap(10.w),
                            Container(
                              height: 40.h,
                              width: 40.h,
                              padding: EdgeInsets.all(2.r),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: avatarBgColor.withOpacity(0.15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.asset(
                                  players[index].avatar,
                                  fit: BoxFit.cover,
                                  height: 35.h,
                                  width: 35.h,
                                ),
                              ),
                            ),
                            Gap(10.w),
                            Expanded(
                                child:
                                    BuddyBodyText(text: players[index].name)),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ),
        Gap(10.h),
        BuddyButton(
          onTap: () {},
          label: "Start Pairing",
        )
      ],
    );
  }
}
