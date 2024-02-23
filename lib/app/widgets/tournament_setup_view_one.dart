import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_controller.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/app/widgets/create_tournament_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../modules/tournament/controllers/tournament_state.dart';
import 'text_widgets/heading_text.dart';

class TournamentSetupViewOne extends StatelessWidget {
  const TournamentSetupViewOne({super.key});

  static const Duration _animationDuration = Duration(milliseconds: 350);

  @override
  Widget build(BuildContext context) {
    TournamentController tournamentController =
        Get.find<TournamentController>();
    return Column(
      children: [
        const CreateTournamentHeader(),
        Gap(50.h),
        Stack(
          children: [
            SizedBox(
              height: 300.h,
              child: PageView(
                controller: tournamentController
                    .tournamentState.tournamentSelectorController,
                onPageChanged: (int value) {
                  HapticFeedback.lightImpact();
                  tournamentController.updateTournamentType(value < 1
                      ? TournamentType.knockOut
                      : TournamentType.league);
                },
                children: [
                  Column(
                    children: [
                      const BuddyHeadingText(text: "KNOCK OUT"),
                      Image.asset(Assets.imagesKnockoutLogo, height: 230.h),
                    ],
                  ),
                  Column(
                    children: [
                      const BuddyHeadingText(text: "LEAGUE"),
                      Image.asset(
                        Assets.imagesLeagueLogo,
                        height: 230.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 150.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      tournamentController
                          .tournamentState.tournamentSelectorController
                          .previousPage(
                              duration: _animationDuration,
                              curve: Curves.linear);
                    },
                    child: SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: BuddyHeadingText(
                        text: "<",
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      tournamentController
                          .tournamentState.tournamentSelectorController
                          .nextPage(
                              duration: _animationDuration,
                              curve: Curves.linear);
                    },
                    child: SizedBox(
                      height: 50.h,
                      // width: 50.w,
                      child: BuddyHeadingText(
                        text: '>',
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        // Gap(20.h),
        TextFormField(
          textInputAction: TextInputAction.done,
          style: AppTheme.buddyFormTextStyle,
          controller: tournamentController.tournamentState.tournamentNameController,
          onChanged: (value) => tournamentController.onTournamentNameChanged(value.trim()),
          decoration: InputDecoration(
            hintText: "${tournamentController.tournamentState.tournamentName} tournament",
            hintStyle: AppTheme.buddyFormTextStyle,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            fillColor: AppColors.textFieldBgColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide.none,
            ),
            border: InputBorder.none,
          ),
        ),
        Gap(40.h),
        BuddyButton(
          btnHeight: 45,
          onTap: () {
            tournamentController
                .updateCurrentTournamentStep(CreateTournamentStep.stepTwo);
          },
          label: 'Next',
        )
      ],
    );
  }
}
