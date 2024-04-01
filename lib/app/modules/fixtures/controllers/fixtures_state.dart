import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';
import '../../../db_services/collections/player_db_model.dart';

class FixtureState {
  /// Holds the current value of fixtures
  final RxList<Fixture> _fixtures = <Fixture>[].obs;
  List<Fixture> get fixtures => _fixtures;
  set fixtures(List<Fixture> fixtures) => _fixtures.value = fixtures;

  final RxList<Fixture> _p1Fixtures = <Fixture>[].obs;
  List<Fixture> get p1Fixtures => _p1Fixtures;
  set p1Fixtures(List<Fixture> value) => _p1Fixtures.value = value;

  final RxList<Fixture> _p2Fixtures = <Fixture>[].obs;
  List<Fixture> get p2Fixtures => _p2Fixtures;
  set p2Fixtures(List<Fixture> value) => _p2Fixtures.value = value;

  final RxBool _showFixtureDetails = false.obs;
  bool get showFixtureDetails => _showFixtureDetails.value;
  set showFixtureDetails(bool value) => _showFixtureDetails.value = value;

  final RxList<Player> _playerStandings = <Player>[].obs;
  List<Player> get playerStandings => _playerStandings;
  set playerStandings(List<Player> value) => _playerStandings.value = value;

  final Rx<Fixture> _selectedFixture = Fixture().obs;
  Fixture get selectedFixture => _selectedFixture.value;
  set selectedFixture(Fixture fixture) => _selectedFixture.value = fixture;

  final RxList<Fixture> _nextFixtures = <Fixture>[].obs;
  List<Fixture> get nextFixtures => _nextFixtures;
  set nextFixtures(List<Fixture> fixtures) => _nextFixtures.value = fixtures;

  final RxInt _currentStage = 1.obs;
  int get currentStage => _currentStage.value;
  set currentStage(int stage) => _currentStage.value = stage;

  final RxMap<int, List<Fixture>> _allFixtures = <int, List<Fixture>>{}.obs;
  Map<int, List<Fixture>> get allFixtures => _allFixtures;
  set allFixtures(Map<int, List<Fixture>> fixtures) => _allFixtures.value = fixtures;
}
