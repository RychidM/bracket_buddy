import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_state.dart';
import 'package:bracket_buddy/app/modules/fixtures/views/fixture_details_view.dart';
import 'package:bracket_buddy/app/repository/fixtures_repo.dart';
import 'package:bracket_buddy/app/repository/tournament_repo.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../repository/player_repo.dart';

class FixturesController extends GetxController {
  FixturesState fixturesState = FixturesState();
  final _fixturesRepo = FixturesRepository();
  final _playerRepo = PlayerRepository();
  String tournamentName = "";

  @override
  void onInit() {
    List<Fixture> incomingFixtures = Get.arguments as List<Fixture>;
    fixturesState.fixtures = incomingFixtures;
    tournamentName = incomingFixtures.first.tournament.value?.tournamentName ??
        tournamentName;
    super.onInit();
  }

  void updateStateFixture(Fixture fixture) {
    fixturesState.selectedFixture = fixture;
  }

  void generateNextFixtures() async {
    try {
      Tournament? tournament = await TournamentRepository().getRecordById(
          fixturesState.fixtures.first.tournament.value!.tournamentId);

      if (tournament != null) {
        List<Fixture> nextFixtures = await _fixturesRepo.getRoundFixtures(
            tournament.tournamentId,
            tournament.knockoutTournament!.currentRound + 1);

        if (nextFixtures.isEmpty) {
          List<Player> winners =
              await _playerRepo.getCurrentRoundPlayersByWinStatus(
                  tournament.tournamentId,
                  tournament.knockoutTournament!.currentRound);

          nextFixtures = tournament.knockoutTournament
                  ?.generateNextSetOfMatches(winners, tournament) ??
              [];

          nextFixtures = await _fixturesRepo.createMultiRecords(nextFixtures);
        }

        for (var fixture in nextFixtures) {
          if (fixture.playerOne.value!.winStatus == true) {
            fixture.playerOne.value!.winStatus = false;
          }
          if (fixture.playerTwo.value!.winStatus == true) {
            fixture.playerTwo.value!.winStatus = false;
          }
        }
        fixturesState.nextFixtures = nextFixtures;
        Get.toNamed(Routes.FIXTURE_INFO, arguments: nextFixtures);
      }
    } on Exception catch (e) {
      Get.snackbar("Error", "Error generating fixtures");
      print(e);
    }
  }

  static String getCurrentRoundName(List<Player> players, int currentRound) {
    // int playersLeft = players.length ~/ pow(2, currentRound);

    switch (players.length) {
      case 16:
        return "Round of 16";
      case 8:
        return "Quarter Finals";
      case 4:
        return "Semi Finals";
      case 2:
        return "Final";
      default:
        return "Round $currentRound";
    }
  }

  bool fixturesHasWinner() {
    for (var fixture in fixturesState.fixtures) {
      if (fixture.playerOne.value?.winStatus != true &&
          fixture.playerTwo.value?.winStatus != true) {
        return false;
      }
    }
    return true;
  }

  void getPlayerFixtures(Fixture fixture) async {
    int playerOneId = fixture.playerOne.value!.playerId;
    int playerTwoId = fixture.playerTwo.value!.playerId;
    fixturesState.p1Fixtures =
        await _fixturesRepo.getFixturesByPlayer(playerOneId);
    fixturesState.p2Fixtures =
        await _fixturesRepo.getFixturesByPlayer(playerTwoId);
    fixturesState.showFixtureDetails = !fixturesState.showFixtureDetails;
    fixturesState.selectedFixture = fixture;
    Get.to(() => const FixtureDetailsPage());
  }

  /// update player elimination status in selected fixture and update the fixture list.
  void updatePlayerEliminationStatusInKO(Player player, Fixture fixture) async {
    List<Fixture> stateFixtures = fixturesState.fixtures;
    int indexOf = stateFixtures.indexOf(fixture);

    // check if the fixture is in the list, if yes, update the fixture and the list.

    if (indexOf >= 0) {
      //
      if (fixture.playerOne.value?.playerId == player.playerId) {
        fixture.playerOne.value?.winStatus =
            !fixture.playerOne.value!.winStatus;
        fixture.playerTwo.value?.winStatus = false;
      } else if (fixture.playerTwo.value?.playerId == player.playerId) {
        fixture.playerTwo.value?.winStatus =
            !fixture.playerTwo.value!.winStatus;
        fixture.playerOne.value?.winStatus = false;
      }

      final updatedFixture = fixture.copyWith()..fixtureWinner.value = player;

      await _fixturesRepo.updateRecord(updatedFixture);

      await _playerRepo.updateMultiRecords(
          [fixture.playerOne.value!, fixture.playerTwo.value!]);
      stateFixtures[indexOf] = fixture;
    }
  }

  /// update player score in selected fixture and update fixture list.
  void updatePlayerScoreInLeague(Player player, Fixture fixture) async {
    if (fixture.playerOne.value?.playerId == player.playerId) {
      fixture.playerOneScore = (fixture.playerOneScore ?? 0) + 3;
      fixture.playerTwoScore = (fixture.playerTwoScore ?? 0) + 0;
    } else if (fixture.playerTwo.value?.playerId == player.playerId) {
      fixture.playerTwoScore = (fixture.playerTwoScore ?? 0) + 3;
      fixture.playerOneScore = (fixture.playerOneScore ?? 0) + 0;
    }

    await _fixturesRepo.updateRecord(fixture);
    fixturesState.selectedFixture = fixture;
  }
}
