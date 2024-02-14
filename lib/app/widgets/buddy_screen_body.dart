import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuddyScreenBody extends StatelessWidget {
  final Widget child;
  const BuddyScreenBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -25.h,
            left: 25.w,
            right: 25.w,
            child: Container(
                height: 300.h,
                width: double.maxFinite,
                decoration: ShapeDecoration(
                    color: const Color(0xFF5AC057),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ))),
          ),
          Positioned(
            bottom: -15.h,
            left: 15.w,
            right: 15.w,
            child: Container(
                height: 300.h,
                width: double.maxFinite,
                decoration: ShapeDecoration(
                    color: const Color(0xFFB7E3B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ))),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            width: double.maxFinite,
            height: 658.h,
            decoration: ShapeDecoration(
                color: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                )),
            child: child,
          ),
        ],
      ),
    );
  }
}
