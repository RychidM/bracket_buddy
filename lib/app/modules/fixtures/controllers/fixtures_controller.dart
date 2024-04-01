import 'dart:ffi';

import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_state.dart';
import 'package:bracket_buddy/app/modules/fixtures/views/fixture_details_view.dart';
import 'package:bracket_buddy/app/repository/fixtures_repo.dart';
import 'package:bracket_buddy/app/repository/tournament_repo.dart';
import 'package:get/get.dart';

import '../../../repository/player_repo.dart';

class FixturesController extends GetxController {
  FixtureState fixtureState = FixtureState();
  final _fixturesRepo = FixturesRepository();
  final _playerRepo = PlayerRepository();
  Map<int, List<Fixture>> stateAllFixtures = {};
  String tournamentName = "";

  @override
  void onInit() {
    Map<int, List<Fixture>> incomingFixtures =
        Get.arguments as Map<int, List<Fixture>>;
    fixtureState.fixtures = incomingFixtures[1] ?? [];
    stateAllFixtures = incomingFixtures;
    fixtureState.allFixtures = stateAllFixtures;
    fixtureState.currentStage = 1;

    tournamentName =
        incomingFixtures[1]?.first.tournament.value?.tournamentName ??
            tournamentName;
    super.onInit();
  }

  void updateStateFixture(Fixture fixture) {
    fixtureState.selectedFixture = fixture;
  }

  void generateNextFixtures() async {
    try {
      Tournament? tournament = await TournamentRepository().getRecordById(
          fixtureState.fixtures.first.tournament.value!.tournamentId);

      if (tournament != null) {
        List<Fixture> nextFixtures = await _fixturesRepo.getRoundFixtures(
            tournament.tournamentId,
            fixtureState.fixtures.first.matchRound! + 1);

        if (nextFixtures.isEmpty) {
          List<Player> winners =
              await _playerRepo.getCurrentRoundPlayersByWinStatus(
                  tournament.tournamentId,
                  tournament.knockoutTournament!.currentRound);

          nextFixtures = tournament.knockoutTournament
                  ?.generateNextSetOfMatches(winners, tournament) ??
              [];

          nextFixtures = await _fixturesRepo.createMultiRecords(nextFixtures);

          final updatedTournament = tournament.copyWith()
            ..knockoutTournament!.currentRound =
                tournament.knockoutTournament!.currentRound + 1;
          fixtureState.nextFixtures = nextFixtures;

          await TournamentRepository().updateRecord(updatedTournament);
        }

        for (var fixture in nextFixtures) {
          if (fixture.playerOne.value!.winStatus == true) {
            fixture.playerOne.value!.winStatus = false;
          }
          if (fixture.playerTwo.value!.winStatus == true) {
            fixture.playerTwo.value!.winStatus = false;
          }
        }
        stateAllFixtures[nextFixtures.first.matchRound ?? 0] = nextFixtures;
        fixtureState.allFixtures = stateAllFixtures;
        fixtureState.currentStage = nextFixtures.first.matchRound ?? 0;
        fixtureState.currentStage =
            nextFixtures.first.matchRound ?? fixtureState.currentStage;
        updateCurrentStage(nextFixtures.first.matchRound);
      }
    } on Exception {
      Get.snackbar("Error", "Error generating fixtures");
    }
  }

  static String getCurrentRoundName(int playersLength) {
    // int playersLeft = players.length ~/ pow(2, currentRound);

    switch (playersLength) {
      case 16:
        return "Round of 16";
      case 8:
        return "Quarter Finals";
      case 4:
        return "Semi Finals";
      case 2:
        return "Final";
      default:
        return "Round $playersLength";
    }
  }

  Future<bool> fixturesHasWinner() async {
    // for (var fixture in fixtureState.fixtures) {
    //   if (fixture.playerOne.value?.winStatus != true &&
    //       fixture.playerTwo.value?.winStatus != true) {
    //     return false;
    //   }
    // }
    return await _fixturesRepo.allFixturesPlayed(
        fixtureState.fixtures.first.tournament.value?.tournamentId ?? 0);
  }

  Future<Player> getHighestPointPlayer() async {
    List<Player> players = await _playerRepo.getPlayerByScore(
        fixtureState.fixtures.first.tournament.value?.tournamentId ?? 0);
    return players.last;
  }

  void getPlayerFixtures(Fixture fixture) async {
    int playerOneId = fixture.playerOne.value!.playerId;
    int playerTwoId = fixture.playerTwo.value!.playerId;
    fixtureState.p1Fixtures =
        await _fixturesRepo.getFixturesByPlayer(playerOneId);
    fixtureState.p2Fixtures =
        await _fixturesRepo.getFixturesByPlayer(playerTwoId);
    fixtureState.showFixtureDetails = !fixtureState.showFixtureDetails;
    fixtureState.selectedFixture = fixture;
    Get.to(() => const FixtureDetailsPage());
  }

  /// update player elimination status in selected fixture and update the fixture list.
  void updateFixtureWinner(Player player, Fixture fixture) async {
    List<Fixture> stateFixtures = fixtureState.fixtures;
    int indexOf = stateFixtures.indexOf(fixture);
    late Fixture fixtureToUpdate;
    // check if the fixture is in the list, if yes, update the fixture and the list.

    if (indexOf >= 0) {
      //
      switch (fixture.tournament.value?.tournamentType) {
        case TournamentType.knockout:
          fixtureToUpdate = await _updateFixtureWinnerInKO(fixture, player);
          break;
        case TournamentType.league:
          fixtureToUpdate = await updatePlayerScoreInLeague(player, fixture);
        default:
          break;
      }

      stateFixtures[indexOf] = fixtureToUpdate;
    }
  }

  Future<Fixture> _updateFixtureWinnerInKO(
      Fixture fixture, Player player) async {
    if (fixture.playerOne.value?.playerId == player.playerId) {
      fixture.playerOne.value?.winStatus = !fixture.playerOne.value!.winStatus;
      fixture.fixtureWinner.value = fixture.playerOne.value;
      fixture.playerTwo.value?.winStatus = false;
    } else if (fixture.playerTwo.value?.playerId == player.playerId) {
      fixture.playerTwo.value?.winStatus = !fixture.playerTwo.value!.winStatus;
      fixture.fixtureWinner.value = fixture.playerTwo.value;
      fixture.playerOne.value?.winStatus = false;
    }

    final updatedFixture = fixture.copyWith()..fixtureWinner.value = player;

    await _fixturesRepo.updateRecord(updatedFixture);

    await _playerRepo.updateMultiRecords(
        [fixture.playerOne.value!, fixture.playerTwo.value!]);
    return fixture;
  }

  Future<Fixture> updatePlayerScoreInLeague(
      Player winner, Fixture fixture) async {
    if (fixture.fixtureWinner.value != null &&
        winner.playerId == fixture.fixtureWinner.value?.playerId) {
      return fixture;
    }

    if (winner.playerId == fixture.playerOne.value?.playerId) {
      fixture.playerOne.value?.points += 3;

      if ((fixture.playerTwo.value?.points ?? 3) >= 3) {
        fixture.playerTwo.value?.points -= 3;
      }
    } else if (fixture.playerTwo.value?.playerId == winner.playerId) {
      fixture.playerTwo.value?.points += 3;

      if ((fixture.playerOne.value?.points ?? 3) >= 3) {
        fixture.playerOne.value?.points -= 3;
      }
    }

    fixture.fixtureWinner.value = winner;
    await _fixturesRepo.updateRecord(fixture);
    await _playerRepo.updateMultiRecords(
        [fixture.playerOne.value!, fixture.playerTwo.value!]);

    return fixture;
  }


  void updateCurrentStage(currentStage) {
    fixtureState.currentStage = currentStage;
    fixtureState.fixtures = fixtureState.allFixtures[currentStage] ?? [];
  }
}
