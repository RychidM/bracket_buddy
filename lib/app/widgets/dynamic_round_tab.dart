import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../data/constants/app_colors.dart';
import '../data/theme/app_theme.dart';
import '../db_services/collections/fixtures_db_model.dart';
import 'dart:math' as math;

import '../modules/fixtures/controllers/fixtures_controller.dart';

class DynamicFixtureRoundTap extends GetView<FixturesController> {
  final List<Fixture> fixtures;
  final Function(int) onTapSelected;

  const DynamicFixtureRoundTap({
    super.key,
    required this.fixtures, required this.onTapSelected
  });

  int getNumberRounds(int players) {
    return math.log(players) ~/ math.ln2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 35.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primaryGreenLight,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: getNumberRounds(fixtures.length * 2),
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: const BuddyBodyText(
                text: "  >>  ", fontSize: 9, textColor: AppColors.whiteColor),
          );
        },
        itemBuilder: (context, tabIndex) {
          return InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              onTapSelected.call(tabIndex + 1);
            },
            child: Obx(() {
              return Container(
                padding: AppTheme.bPadding5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: controller.fixtureState.currentStage == tabIndex + 1
                        ? AppColors.whiteColor.withOpacity(.7)
                        : Colors.transparent
                ),
                child: BuddyBodyText(
                  text: _getCurrentRoundName(tabIndex+1),
                  fontSize: 11,
                  textColor: controller.fixtureState.currentStage ==
                      tabIndex + 1 ? AppColors.primaryTextColor : AppColors
                      .whiteColor,
                ),
              );
            }),
          );
        },
      ),
    );
  }

  _getCurrentRoundName(int tabIndex) {
    switch(tabIndex){
      case 1:
        return "Round of 16";
      case 2:
        return "Quarter Finals";
      case 3:
        return "Semi Finals";
      case 4:
        return "Final";
      default:
        return "Round $tabIndex";
    }
  }
}
