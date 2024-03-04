import 'package:get/get.dart';

import '../modules/fixture_info/bindings/fixture_info_binding.dart';
import '../modules/fixture_info/views/fixture_info_view.dart';
import '../modules/fixtures/bindings/fixtures_binding.dart';
import '../modules/fixtures/views/fixtures_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/tournament/bindings/tournament_binding.dart';
import '../modules/tournament/views/tournament_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TOURNAMENT,
      page: () => const TournamentView(),
      binding: TournamentBinding(),
    ),
    GetPage(
      name: _Paths.FIXTURES,
      page: () => const FixturesView(),
      binding: FixturesBinding(),
    ),
    GetPage(
      name: _Paths.FIXTURE_INFO,
      page: () => const FixtureInfoView(),
      binding: FixtureInfoBinding(),
    ),
  ];
}
