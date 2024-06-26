import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenRouteFunction(
        screenRouteFunction: () async => Routes.HOME,
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: const Color(0xFF35B32A),
        splash: Image.asset(Assets.imagesBracketBuddyLogo),
      ),
    );
  }
}
