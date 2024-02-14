import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/constants/app_colors.dart';

class BuddyHeadingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow overflow;
  const BuddyHeadingText({
    super.key,
    required this.text,
    this.fontSize = 36.63,
    this.textColor = AppColors.primaryTextColor,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.julee(
        fontSize: fontSize.sp,
        color: textColor,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
