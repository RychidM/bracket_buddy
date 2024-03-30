import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/app/widgets/screen_template.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/create_tournament_header.dart';
import '../../../widgets/text_widgets/body_text.dart';
import '../controllers/winner_controller.dart';

class WinnerView extends GetView<WinnerController> {
  const WinnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuddyScreenTemplate(
          isHintVisible: true,
          hintMessage:
              "Deleting tournaments upon completion helps save storage.",
          mainChild: Column(
            children: [
              Stack(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     HapticFeedback.lightImpact();
                  //     Get.back();
                  //   },
                  //   child: const BuddyHeadingText(
                  //     text: "<",
                  //     fontSize: 58,
                  //     textColor: AppColors.primaryGreenLight,
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        BuddyHeadyWidget(
                          headerTitle:
                              "Winner of ${controller.winner.tournament.value?.tournamentName} Tournament",
                        ),
                        Gap(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BuddyBodyText(text: controller.winner.gamerTag),
                            Gap(10.w),
                            SizedBox(
                                height: 25.h,
                                child: Image.asset(controller.winner.avatar)),
                          ],
                        ),
                        Gap(40.h),
                        Stack(
                          children: [
                            Positioned(
                                top: -50.h,
                                left: 0,
                                right: 0,
                                child: Lottie.asset(
                                    Assets.animationFireworksAnimation)),
                            Positioned(
                                child: Lottie.asset(
                                    Assets.animationWinnerAnimation)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(60.h),
              BuddyButton(
                  label: "Finish Tournament",
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Get.offNamedUntil(Routes.HOME,
                        (route) => route.settings.name == Routes.HOME);
                  }),
              // Gap(10.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       height: 1.h,
              //       width: 140.w,
              //       color: Colors.grey.shade200,
              //     ),
              //     const BuddyBodyText(
              //       text: "OR",
              //       fontSize: 14,
              //     ),
              //     Container(
              //       height: 1.h,
              //       width: 140.w,
              //       color: Colors.grey.shade200,
              //     ),
              //   ],
              // ),
              // Gap(10.h),
              // InkWell(
              //   onTap: () {
              //     HapticFeedback.lightImpact();
              //     controller.finishAndCloseTournament();
              //   },
              //   child: const BuddyBodyText(
              //     text: "Finish and Delete Tournament",
              //     fontSize: 14,
              //     textColor: AppColors.primaryGreenLight,
              //   ),
              // ),
            ],
          )),
    );
  }
}
