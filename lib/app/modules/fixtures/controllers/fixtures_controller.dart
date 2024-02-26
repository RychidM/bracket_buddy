import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_state.dart';
import 'package:get/get.dart';

class FixturesController extends GetxController {
  FixturesState fixturesState = FixturesState();
  String tournamentName = "";

  final count = 0.obs;
  @override
  void onInit() {
    List<Fixtures> incomingFixtures = Get.arguments as List<Fixtures>;
    fixturesState.fixtures = incomingFixtures;
    tournamentName = incomingFixtures.first.tournament.value?.tournamentName ?? tournamentName;
    super.onInit();
  }

  void increment() => count.value++;
}
