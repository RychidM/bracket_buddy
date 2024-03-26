import 'package:bracket_buddy/app/widgets/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../data/constants/app_colors.dart';
import '../../../widgets/create_tournament_header.dart';
import '../../../widgets/text_widgets/body_text.dart';
import '../../../widgets/text_widgets/heading_text.dart';
import '../controllers/winner_controller.dart';

class WinnerView extends GetView<WinnerController> {
  const WinnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BuddyScreenTemplate(
          isHintVisible: true,
          hintMessage: "fuck off",
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
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        BuddyHeadyWidget(
                          headerTitle: "Tournament",
                        ),
                        BuddyBodyText(
                            text:
                                "controller.inComingFixtures.first.fixtureRoundName"),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container();
                    }),
              )
            ],
          )),
    );
  }
}
