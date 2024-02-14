import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class BuddyHintContainer extends StatelessWidget {
  final String title;
  final String message;
  final bool isHintVisible;
  const BuddyHintContainer({
    super.key,
    this.title = "HINT",
    this.isHintVisible = true,
    this.message =
        "If no tournament name is provided, the name entered in the text field will be used.",
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isHintVisible,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        // height: 48.h,
        width: double.maxFinite,
        decoration: ShapeDecoration(
            color: AppColors.primaryTextColor.withOpacity(0.31),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r))),
        child: Row(
          children: [
            Container(
              width: 18.h,
              height: 18.h,
              decoration: ShapeDecoration(
                color: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(54.r),
                ),
              ),
              child: Center(
                child: BuddyBodyText(
                  text: 'i',
                  textStyle:
                      GoogleFonts.overpass(color: AppColors.primaryGreenLight),
                ),
              ),
            ),
            Gap(20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuddyBodyText(
                  text: title,
                  fontSize: 12,
                  textColor: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 204.w,
                  child: BuddyBodyText(
                    fontSize: 12,
                    text: message,
                    textColor: AppColors.whiteColor,
                    height: 0,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
