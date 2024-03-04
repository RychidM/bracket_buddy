import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';
import '../../../db_services/collections/player_db_model.dart';

class FixturesState {
  /// Holds the current value of fixtures
  final RxList<Fixtures> _fixtures = <Fixtures>[].obs;
  List<Fixtures> get fixtures => _fixtures;
  set fixtures(List<Fixtures> fixtures) => _fixtures.value = fixtures;

  final RxList<Fixtures> _p1Fixtures = <Fixtures>[].obs;
  List<Fixtures> get p1Fixtures => _p1Fixtures;
  set p1Fixtures(List<Fixtures> value) => _p1Fixtures.value = value;

  final RxList<Fixtures> _p2Fixtures = <Fixtures>[].obs;
  List<Fixtures> get p2Fixtures => _p2Fixtures;
  set p2Fixtures(List<Fixtures> value) => _p2Fixtures.value = value;

  final RxBool _showFixtureDetails = false.obs;
  bool get showFixtureDetails => _showFixtureDetails.value;
  set showFixtureDetails(bool value) => _showFixtureDetails.value = value;

  final RxList<Player> _playerStandings = <Player>[].obs;
  List<Player> get playerStandings => _playerStandings;
  set playerStandings(List<Player> value) => _playerStandings.value = value;

  final Rx<Fixtures> _selectedFixture = Fixtures().obs;
  Fixtures get selectedFixture => _selectedFixture.value;
  set selectedFixture(Fixtures fixture) => _selectedFixture.value = fixture;
}
