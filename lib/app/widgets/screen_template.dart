import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import 'buddy_hint_container.dart';
import 'buddy_screen_body.dart';

class BuddyScreenTemplate extends StatelessWidget {
  const BuddyScreenTemplate({
    super.key,
    this.isHintVisible = true,
    required this.mainChild,
    this.bottomWidget,
  });
  final bool isHintVisible;
  final Widget mainChild;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.imagesBgSt,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 70.h,
          left: 0,
          right: 0,
          child: BuddyScreenBody(
            child: mainChild,
          ),
        ),
        Positioned(
          bottom: 30.h,
          left: 50.w,
          right: 50.w,
          child: bottomWidget ?? BuddyHintContainer(
            isHintVisible: isHintVisible,
          ),
        )
      ],
    );
  }
}
