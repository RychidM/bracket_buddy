import 'package:bracket_buddy/app/modules/home/controllers/home_state.dart';
import 'package:bracket_buddy/app/repository/player_repo.dart';
import 'package:bracket_buddy/app/repository/tournament_repo.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';
import '../../../db_services/collections/tournament_db_model.dart';
import '../../../repository/fixtures_repo.dart';

class HomeController extends GetxController {
  final _tournamentRepo = TournamentRepository();
  final _fixtureRepo = FixturesRepository();
  final _playerRepo = PlayerRepository();
  final homeState = HomeState();

  @override
  void onInit() async {
    super.onInit();
    await fetchTournaments();
  }

  Future<void> fetchTournaments() async {
    await _tournamentRepo.getAllRecords().then((List<Tournament> tournaments) {
      homeState.tournaments = tournaments;
    });
  }

  void tournamentSelected(int id) async {
    Map<int, List<Fixture>> fixtures = await _fixtureRepo.getFixturesByTournament(id);
    Get.toNamed(Routes.FIXTURES, arguments: fixtures);
  }

  void deleteTournament(int id) async {
    await _playerRepo.deletePlayersAssociatedWithTournament(id);
    await _fixtureRepo.deleteFixtureAssociatedWithTournament(id);
    await _tournamentRepo.deleteRecord(id);
  }

  void clearDb() async {
    await _playerRepo.clearDb();
    var stateTournaments = homeState.tournaments;
    stateTournaments = [];
    homeState.tournaments = stateTournaments;
  }
}
