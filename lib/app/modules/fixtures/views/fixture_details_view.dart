import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_controller.dart';
import 'package:bracket_buddy/app/modules/fixtures/views/fixtures_view.dart';
import 'package:bracket_buddy/app/widgets/screen_template.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/utils.dart';
import '../../../widgets/create_tournament_header.dart';
import '../../../widgets/text_widgets/heading_text.dart';

class FixtureDetailsPage extends StatelessWidget {
  const FixtureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<FixturesController>();
    return Scaffold(
      body: BuddyScreenTemplate(
        isHintVisible: true,
        hintMessage: "Tap on a player Avatar to select winner of fixture.",
        mainChild: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Get.back();
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
              GetX<FixturesController>(
                init: FixturesController(),
                initState: (_) {},
                builder: (_) {
                  return FixturesWidget(
                      p1OnTap: () => controller.updateFixtureWinner(
                          controller
                              .fixtureState.selectedFixture.playerOne.value!,
                          controller.fixtureState.selectedFixture),
                      p2OnTap: () => controller.updateFixtureWinner(
                          controller
                              .fixtureState.selectedFixture.playerTwo.value!,
                          controller.fixtureState.selectedFixture),
                      avatarBgColor: BuddyUtils.getAccentColor(2),
                      fixture: controller.fixtureState.selectedFixture,
                      avatarBgColor2: BuddyUtils.getAccentColor(1));
                },
              ),
              Gap(10.h),
              BuddyBodyText(
                  text:
                      "${controller.fixtureState.selectedFixture.playerOne.value?.gamerTag} Fixtures"),
              Gap(10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.fixtureState.p1Fixtures.length,
                itemBuilder: (context, index) {
                  var fixture = controller.fixtureState.p1Fixtures[index]
                      .reverseFixture();
                  Color avatarBgColor = BuddyUtils.getAccentColor(index);
                  Color avatarBgColor2 = BuddyUtils.getAccentColor(index + 1);
                  return FixturesWidget(
                      avatarBgColor: avatarBgColor,
                      fixture: fixture,
                      avatarBgColor2: avatarBgColor2);
                },
              ),
              Gap(10.h),
              Visibility(
                visible: controller.fixtureState.p2Fixtures.isNotEmpty,
                child: BuddyBodyText(
                    text:
                        "${controller.fixtureState.selectedFixture.playerTwo.value?.gamerTag} Fixtures"),
              ),
              Gap(10.h),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.fixtureState.p2Fixtures.length,
                itemBuilder: (context, index) {
                  var fixture = controller.fixtureState.p2Fixtures[index];
                  Color avatarBgColor = BuddyUtils.getAccentColor(index);
                  Color avatarBgColor2 = BuddyUtils.getAccentColor(index + 1);
                  return FixturesWidget(
                      avatarBgColor: avatarBgColor,
                      fixture: fixture,
                      avatarBgColor2: avatarBgColor2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
