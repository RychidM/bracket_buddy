import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle buddyFormTextStyle = GoogleFonts.julee(
    fontSize: 16.sp,
    color: AppColors.secondaryTextColor,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.3,
    height: 0.07,
  );

  static ThemeData buddyThemeData =
      ThemeData(scaffoldBackgroundColor: AppColors.primaryGreenLight);

  static EdgeInsets bPadding20 =
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h);

  static EdgeInsets bPadding10 =
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h);

  static EdgeInsets bPadding5 =
      EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w);

  static RoundedRectangleBorder bRoundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(54.r),
    side: BorderSide(color: AppColors.borderGrey, width: 0.80.w),
  );

  static BorderRadiusGeometry bRoundedBorderNoSide =
      BorderRadius.circular(54.r);
}
