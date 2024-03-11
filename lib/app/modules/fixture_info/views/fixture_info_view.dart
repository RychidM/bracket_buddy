import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/widgets/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/utils.dart';
import '../../../widgets/create_tournament_header.dart';
import '../../../widgets/text_widgets/body_text.dart';
import '../../../widgets/text_widgets/heading_text.dart';
import '../../fixtures/views/fixtures_view.dart';
import '../controllers/fixture_info_controller.dart';

class FixtureInfoView extends GetView<FixtureInfoController> {
  const FixtureInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuddyScreenTemplate(
          mainChild: Column(
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
                child: Column(
                  children: [
                    BuddyHeadyWidget(
                      headerTitle:
                          "${controller.inComingFixtures.first.tournament.value?.tournamentName} Tournament",
                    ),
                    BuddyBodyText(
                        text:
                            controller.inComingFixtures.first.fixtureRoundName),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.inComingFixtures.length,
              itemBuilder: (context, index) {
              Color avatarBgColor = BuddyUtils.getAccentColor(index);
              Color avatarBgColor2 = BuddyUtils.getAccentColor(index + 1);
              Fixture fixture = controller.inComingFixtures[index];
              return FixturesWidget(
                avatarBgColor: avatarBgColor,
                fixture: fixture,
                avatarBgColor2: avatarBgColor2,
                p1OnTap: () {},
                p2OnTap: () {},
                onTap: () {},
              );
            }),
          )
        ],
      )),
    );
  }
}
