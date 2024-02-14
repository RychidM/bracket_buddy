import 'package:bracket_buddy/app/widgets/text_widgets/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/constants/app_colors.dart';

class BuddyButton extends StatelessWidget {
  final Widget? child;
  final String label;
  final double labelTextSize;
  final Color labelColor;
  final VoidCallback onTap;
  final Color btnColor;
  final double btnHeight;
  final double btnWidth;
  final double borderRadius;
  final double elevation;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final TextStyle? labelTextStyle;

  const BuddyButton({
    Key? key,
    this.child,
    this.label = 'Label',
    this.labelTextSize = 20.0,
    this.labelColor = AppColors.whiteColor,
    required this.onTap,
    this.btnColor = AppColors.primaryGreenLight,
    this.btnHeight = 45.0,
    this.btnWidth = 226.0,
    this.elevation = 0,
    this.borderRadius = 50,
    this.isLoading = false,
    this.shape,
    this.side,
    this.margin,
    this.labelTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight.h,
      width: btnWidth.w,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: btnColor,
          splashFactory: NoSplash.splashFactory,
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    borderRadius.r,
                  ),
                  side: side ?? BorderSide.none),
        ),
        onPressed: () {
          HapticFeedback.lightImpact();
          onTap.call();
        },
        child: child ??
            (isLoading
                ? SpinKitThreeBounce(size: 25.sp, color: AppColors.whiteColor)
                : BuddyBodyText(
                    text: label,
                    textColor: labelColor,
                    fontSize: labelTextSize,
                    textStyle: labelTextStyle,
                  )),
      ),
    );
  }
}
