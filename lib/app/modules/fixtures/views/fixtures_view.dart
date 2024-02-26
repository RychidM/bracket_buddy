import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/data/utils.dart';
import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
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
        isHintVisible: false,
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
                  child: BuddyHeadyWidget(
                    headerTitle: "${controller.tournamentName} Tournament",
                  ),
                ),
              ],
            ),
            Gap(10.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.fixturesState.fixtures.length,
                itemBuilder: (context, index) {
                  Color avatarBgColor = BuddyUtils.getAccentColor(index);
                  Color avatarBgColor2 = BuddyUtils.getAccentColor(index + 1);
                  Fixtures fixture = controller.fixturesState.fixtures[index];
                  return Container(
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
                        ),
                        const BuddyBodyText(
                          text: "VS",
                          textColor: AppColors.primaryGreenLight,
                          fontSize: 14,
                        ),
                        PlayerAvatarWidget(
                          avatarBgColor: avatarBgColor2,
                          gamerTag: fixture.playerTwo.value?.gamerTag ?? "",
                          imgString: fixture.playerTwo.value?.avatar ?? "",
                        ),
                      ],
                    ),
                  );
                },
              ),
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
  });

  final Color avatarBgColor;
  final String imgString;
  final String gamerTag;
  final bool reverseOder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: reverseOder
          ? [
              PlayerAvatarContainer(
                  avatarBgColor: avatarBgColor, imgString: imgString),
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
                  avatarBgColor: avatarBgColor, imgString: imgString),
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
  });

  final Color avatarBgColor;
  final String imgString;
  final bool isWinner;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
