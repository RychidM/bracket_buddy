import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/app_colors.dart';

class BuddyBodyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextStyle? textStyle;
  final int maxLines;
  final TextOverflow overflow;
  final double? height;
  const BuddyBodyText({
    super.key,
    required this.text,
    this.fontSize = 18.0,
    this.textColor = AppColors.primaryTextColor,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ??
          GoogleFonts.julee(
            fontSize: fontSize.sp,
            color: textColor,
            fontWeight: fontWeight,
            height: height,
          ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
