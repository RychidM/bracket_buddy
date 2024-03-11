import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/data/constants/app_strings.dart';
import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/data/utils.dart';
import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
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

import '../../../widgets/text_widgets/heading_text.dart';
import '../controllers/fixtures_controller.dart';

class FixturesView extends GetView<FixturesController> {
  const FixturesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuddyScreenTemplate(
        isHintVisible: true,
        bottomWidget: BuddyButton(
          onTap: () => controller.fixturesHasWinner()
              ? controller.generateNextFixtures()
              : Get.snackbar(AppStrings.bSelectWinnerErrTitle,
                  AppStrings.bSelectWinnerErrMsg,
                  backgroundColor:
                      AppColors.primaryGreenLight.withOpacity(.25)),
          btnColor: AppColors.whiteColor,
          label: AppStrings.bNextRound,
          labelColor: AppColors.primaryTextColor,
        ),
        mainChild: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Get.previousRoute == Routes.HOME
                        ? Get.back()
                        : Get.until(
                            (route) => route.settings.name == Routes.HOME);
                  },
                  child: const BuddyHeadingText(
                    text: "<",
                    fontSize: 58,
                    textColor: AppColors.primaryGreenLight,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      BuddyHeadyWidget(
                        headerTitle: "${controller.tournamentName} Tournament",
                      ),
                      BuddyBodyText(
                          text: controller
                              .fixturesState.fixtures.first.fixtureRoundName),
                    ],
                  ),
                ),
              ],
            ),
            Gap(10.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.fixturesState.fixtures.length,
                  itemBuilder: (context, index) {
                    Color avatarBgColor = BuddyUtils.getAccentColor(index);
                    Color avatarBgColor2 = BuddyUtils.getAccentColor(index + 1);
                    Fixture fixture = controller.fixturesState.fixtures[index];
                    return FixturesWidget(
                      avatarBgColor: avatarBgColor,
                      fixture: fixture,
                      avatarBgColor2: avatarBgColor2,
                      p1OnTap: () =>
                          controller.updatePlayerEliminationStatusInKO(
                              fixture.playerOne.value!, fixture),
                      p2OnTap: () =>
                          controller.updatePlayerEliminationStatusInKO(
                              fixture.playerTwo.value!, fixture),
                      onTap: () {
                        controller.getPlayerFixtures(fixture);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FixturesWidget extends StatelessWidget {
  const FixturesWidget({
    super.key,
    required this.avatarBgColor,
    required this.fixture,
    required this.avatarBgColor2,
    this.onTap,
    this.p1OnTap,
    this.p2OnTap,
  });

  final Color avatarBgColor;
  final Fixture fixture;
  final Color avatarBgColor2;
  final VoidCallback? onTap;
  final VoidCallback? p1OnTap;
  final VoidCallback? p2OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppTheme.bPadding5,
        width: double.maxFinite,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: AppTheme.bRoundedBorderNoSide,
          border: Border.all(color: AppColors.borderGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PlayerAvatarWidget(
              avatarBgColor: avatarBgColor,
              reverseOder: true,
              gamerTag: fixture.playerOne.value?.gamerTag ?? "",
              imgString: fixture.playerOne.value?.avatar ?? "",
              p1OnTap: p1OnTap,
              isWinner: fixture.playerOne.value?.winStatus == true,
            ),
            const BuddyBodyText(
              text: "VS",
              textColor: AppColors.primaryGreenLight,
              fontSize: 14,
            ),
            PlayerAvatarWidget(
              p1OnTap: p2OnTap,
              avatarBgColor: avatarBgColor2,
              gamerTag: fixture.playerTwo.value?.gamerTag ?? "",
              imgString: fixture.playerTwo.value?.avatar ?? "",
              isWinner: fixture.playerTwo.value?.winStatus == true,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerAvatarWidget extends StatelessWidget {
  const PlayerAvatarWidget({
    super.key,
    required this.avatarBgColor,
    this.imgString = Assets.avatarsAang,
    this.gamerTag = "Player 1",
    this.reverseOder = false,
    this.isWinner = false,
    this.p1OnTap,
  });

  final Color avatarBgColor;
  final String imgString;
  final String gamerTag;
  final bool reverseOder;
  final bool isWinner;
  final VoidCallback? p1OnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: reverseOder
          ? [
              PlayerAvatarContainer(
                playerOnTap: p1OnTap,
                avatarBgColor: avatarBgColor,
                imgString: imgString,
                isWinner: isWinner,
              ),
              Gap(6.w),
              BuddyBodyText(
                text: gamerTag,
                fontSize: 12,
              )
            ]
          : [
              BuddyBodyText(
                text: gamerTag,
                fontSize: 12,
              ),
              Gap(6.w),
              PlayerAvatarContainer(
                playerOnTap: p1OnTap,
                avatarBgColor: avatarBgColor,
                imgString: imgString,
                isWinner: isWinner,
              ),
            ],
    );
  }
}

class PlayerAvatarContainer extends StatelessWidget {
  const PlayerAvatarContainer({
    super.key,
    required this.avatarBgColor,
    required this.imgString,
    this.isWinner = false,
    this.playerOnTap,
  });

  final Color avatarBgColor;
  final String imgString;
  final bool isWinner;
  final VoidCallback? playerOnTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: playerOnTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isWinner
                  ? Border.all(width: 1.w, color: AppColors.promotionGreen)
                  : Border(
                      right: BorderSide(color: avatarBgColor, width: 1.w),
                    ),
            ),
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: AppTheme.bRoundedBorderNoSide,
                color: avatarBgColor.withOpacity(.15),
              ),
              child: ClipRRect(
                borderRadius: AppTheme.bRoundedBorderNoSide,
                child: Image.asset(
                  imgString,
                  height: 35.h,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isWinner,
          child: Positioned(
            top: -10.h,
            right: -15.w,
            child: Image.asset(
              Assets.iconsCrown,
              height: 30.h,
            ),
          ),
        ),
      ],
    );
  }
}
