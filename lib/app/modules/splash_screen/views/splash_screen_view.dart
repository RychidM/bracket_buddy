import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bracket_buddy/app/repository/fixtures_repo.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:bracket_buddy/generated/assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenRouteFunction(
        // nextRoute: Routes.HOME,
        screenRouteFunction: () async {
          FixturesRepository fixtureRepo = FixturesRepository();
          await fixtureRepo.getAllRecords().then((List<Fixtures> fixtures) {
            if (fixtures.isNotEmpty) {
              return Get.offNamed(Routes.FIXTURES, arguments: fixtures,);
            }
          });
          return Routes.HOME;
        },
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: const Color(0xFF35B32A),
        splash: Image.asset(Assets.imagesBracketBuddyLogo),
      ),
    );
  }
}
