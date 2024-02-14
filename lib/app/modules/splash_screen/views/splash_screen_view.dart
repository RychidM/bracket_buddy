import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bracket_buddy/app/modules/home/views/home_view.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        nextRoute: Routes.HOME,
        nextScreen: const HomeView(),
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: const Color(0xFF35B32A),
        splash: Image.asset(Assets.imagesBracketBuddyLogo),
      ),
    );
  }
}
