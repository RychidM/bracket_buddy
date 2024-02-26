import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/app/widgets/create_tournament_header.dart';
import 'package:bracket_buddy/app/widgets/screen_template.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      body: Obx(
        () => controller.homeState.tournaments.isEmpty
            ? Stack(
                children: [
                  Image.asset(
                    Assets.imagesBgImg,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Align(
                    child: Image.asset(
                      Assets.imagesBracketBuddyLogo,
                      height: 120.h,
                    ),
                  ),
                  Positioned(
                      left: 80.w,
                      right: 80.w,
                      bottom: 100.h,
                      child: BuddyButton(
                        btnColor: AppColors.whiteColor,
                        labelColor: AppColors.primaryTextColor,
                        label: 'START PLAYING',
                        onTap: () => Get.toNamed(Routes.TOURNAMENT)?.then(
                            (value) async =>
                                await controller.fetchTournaments()),
                      )),
                ],
              )
            : BuddyScreenTemplate(
                isHintVisible: false,
                mainChild: Column(
                  children: [
                    const BuddyHeadyWidget(
                      headerTitle: "Continue where you left off",
                    ),
                    Gap(10.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.homeState.tournaments.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.redColor,
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: AppColors.borderGrey),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BuddyBodyText(
                                  text: "D  E  L  E  T  E    ",
                                  textColor: AppColors.whiteColor,
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (direction) =>
                              controller.deleteTournament(controller
                                  .homeState.tournaments[index].tournamentId),
                          child: Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: 10.h),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(7.r),
                              border: Border.all(color: AppColors.borderGrey),
                            ),
                            child: ListTile(
                              onTap: () => {
                                controller.tournamentSelected(controller
                                    .homeState.tournaments[index].tournamentId),
                                HapticFeedback.lightImpact(),
                              },
                              title: BuddyBodyText(
                                  text:
                                      "${controller.homeState.tournaments[index].tournamentName} Tournament"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                bottomWidget: BuddyButton(
                  btnColor: AppColors.whiteColor,
                  labelColor: AppColors.primaryTextColor,
                  label: 'New Game',
                  onTap: () => Get.toNamed(Routes.TOURNAMENT)?.then(
                      (value) async => await controller.fetchTournaments()),
                ),
              ),
      ),
    );
  }
}
