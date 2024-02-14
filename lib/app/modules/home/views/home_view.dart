import 'package:bracket_buddy/app/data/constants/app_colors.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/app/widgets/button_widgets/buddy_button.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreenLight,
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesBgImg,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            child: Image.asset(
              Assets.imagesBracketBuddyLogo,
              height: 120.h,
            ),
          ),
          Positioned(
              left: 80.w,
              right: 80.w,
              bottom: 100.h,
              child: BuddyButton(
                btnColor: AppColors.whiteColor,
                labelColor: AppColors.primaryTextColor,
                label: 'START PLAYING',
                onTap: () => Get.offNamed(Routes.TOURNAMENT),
              )),
        ],
      ),
    );
  }
}
