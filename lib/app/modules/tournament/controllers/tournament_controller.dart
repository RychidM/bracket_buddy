import 'dart:math';

import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/models/knockout_tournament.dart';
import 'package:bracket_buddy/app/db_services/models/league_tournament.dart';
import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';
import 'package:bracket_buddy/app/modules/tournament/data/tournament_dummy_data.dart';
import 'package:bracket_buddy/app/repository/player_repo.dart';
import 'package:bracket_buddy/app/repository/tournament_repo.dart';
import 'package:english_words/english_words.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/player_db_model.dart';
import '../../../repository/fixtures_repo.dart';
import '../../../routes/app_pages.dart';

class TournamentController extends GetxController {
  TournamentState tournamentState = TournamentState();

  final FixturesRepository _fixturesRepo = FixturesRepository();
  final _tournamentRepo = TournamentRepository();
  final _playerRepo = PlayerRepository();

  @override
  void onInit() async {
    tournamentState.tournamentName =
        generateWordPairs().take(1).toList().first.asSnakeCase.toLowerCase();
    super.onInit();
  }

  void updateTournamentType(TournamentType tournamentType) {
    tournamentState.tournamentType = tournamentType;
  }

  void updateCurrentTournamentStep(CreateTournamentStep step) {
    tournamentState.currentTournamentStep = step;
  }

  void numberOfPlayersSelected(int numberOfPlayers) {
    tournamentState.numberOfPlayers = numberOfPlayers;
  }

  void onTournamentNameChanged(String tournamentName) {
    tournamentState.tournamentName = tournamentName;
  }

  void generatePlayerNames() async {
    int numberOfPlayers = tournamentState.numberOfPlayers;
    final List<WordPair> wordPairs =
        generateWordPairs().take(numberOfPlayers).toList();

    final List<String> avatars = playerAvatars;
    avatars.shuffle();
    final random = Random();
    List<Player> players = [];

    for (int i = 0; i < numberOfPlayers; i++) {
      String playerAvatar = avatars[i % playerAvatars.length];
      String wordPair = wordPairs[i % playerAvatars.length].asSnakeCase;
      int number = random.nextInt(100) + 1;

      String gamerTag = "$wordPair-$number";

      final player = Player()
        ..gamerTag = gamerTag
        ..tournament.value = tournamentState.tournament
        ..avatar = playerAvatar;

      players.add(player);
    }

    // var genPlayers = await _playerRepo.createMultiRecords(players);
    // print(genPlayers.first?.gamerTag);
    tournamentState.players = players;
  }

  updatePlayerSelectedStatus(int index, Player player) {
    List<Player> players = tournamentState.players;
    players[index].isSelected = !players[index].isSelected;
    tournamentState.players = players;
  }

  saveTournamentInState() async {
    Tournament tournament = Tournament()
      ..tournamentName = tournamentState.tournamentName
      ..tournamentType = tournamentState.tournamentType;

    if (tournamentState.tournamentType == TournamentType.knockout) {
      tournament.knockoutTournament = KnockoutTournament()..currentRound = 1;
    } else {
      tournament.leagueTournament = LeagueTournament();
    }

    tournamentState.tournament = tournament;
  }

  setUpTournament() async {
    try {
      List<Fixture> fixtures = [];
      Tournament savedTournament =
          await _tournamentRepo.createRecord(tournamentState.tournament) ??
              tournamentState.tournament;

      List<Player> savedPlayers =
          await _playerRepo.createMultiRecords(tournamentState.players);
      tournamentState.tournament;

      if (tournamentState.tournamentType == TournamentType.knockout) {
        fixtures = tournamentState.tournament.knockoutTournament
                ?.generateKnockOutMatches(savedPlayers, savedTournament) ??
            [];
      } else {
        fixtures = tournamentState.tournament.leagueTournament
                ?.generateLeagueFixtures(savedPlayers, savedTournament) ??
            [];
      }
      var newFixtures = await _fixturesRepo.createMultiRecords(fixtures);

      // final updatedTournament = savedTournament.copyWith()
      //   ..knockoutTournament!.currentRound =
      //       savedTournament.knockoutTournament!.currentRound +1;
      //
      // await _tournamentRepo.updateRecord(updatedTournament);
      tournamentState.fixtures = newFixtures;
      Map<int, List<Fixture>> fixturesMap = {
        newFixtures.first.matchRound ?? 1: newFixtures
      };

      Get.offNamed(Routes.FIXTURES, arguments: fixturesMap);
    } on Exception {
      Get.snackbar("Error", "Error creating fixtures");
    }
  }
}
