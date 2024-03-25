import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/constants/app_colors.dart';
import '../data/theme/app_theme.dart';
import '../db_services/collections/fixtures_db_model.dart';
import 'dart:math' as math;

import '../modules/fixtures/controllers/fixtures_controller.dart';

class DynamicFixtureRoundTap extends StatelessWidget {
  final List<Fixture> fixtures;
  final Function(int) onTapSelected;
  final bool tabSelected;

  const DynamicFixtureRoundTap({
    super.key,
    required this.fixtures, required this.onTapSelected, this.tabSelected = false,
  });

  int getNumberRounds(int players) {
    return math.log(players) ~/ math.ln2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 25.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
            padding: EdgeInsets.only(top: 2.h),
            child: const BuddyBodyText(
                text: "  >>  ", fontSize: 9, textColor: AppColors.whiteColor),
          );
        },
        itemBuilder: (context, tabIndex) {
          return InkWell(
            onTap: (){
              HapticFeedback.lightImpact();
              onTapSelected.call(tabIndex+1);
            },
            child: BuddyBodyText(
              text: FixturesController.getCurrentRoundName(fixtures.length * 2),
              fontSize: 11,
              textColor: tabSelected ? AppColors.whiteColor : AppColors.borderGrey,
            ),
          );
        },
      ),
    );
  }
}
