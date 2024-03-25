import 'package:bracket_buddy/app/modules/fixtures/controllers/fixtures_controller.dart';
import 'package:isar/isar.dart';

import '../collections/fixtures_db_model.dart';
import '../collections/player_db_model.dart';
import '../collections/tournament_db_model.dart';

part 'knockout_tournament.g.dart';

@embedded
class KnockoutTournament {
  late int currentRound;

    List<Fixture> generateKnockOutMatches(
      List<Player> players, Tournament tournament) {
    List<Fixture> fixtures = [];
    int numberOfPlayers = players.length;
    int numberOfMatches = numberOfPlayers ~/ 2;
    players.shuffle();

    for (int i = 0; i < numberOfMatches; i++) {
      Fixture fixture = Fixture()
        ..playerOne.value = players[i]
        ..playerTwo.value = players[numberOfPlayers - i - 1]
        ..tournament.value = tournament
        ..fixtureRoundName = FixturesController.getCurrentRoundName(players)
        ..matchRound = 1;
      fixtures.add(fixture);
    }
    // tournament.knockoutTournament?.currentRound++;
    return fixtures;
  }

  List<Fixture> generateNextSetOfMatches(
      List<Player> winners, Tournament tournament) {
    List<Fixture> nextRoundMatches = [];
    if (winners.isEmpty || winners.length.isOdd) {
      return nextRoundMatches;
    }

    for (int i = 0; i < winners.length; i += 2) {
      Player playerOne = winners[i];
      Player playerTwo = winners[i + 1];

      nextRoundMatches.add(Fixture()
        ..playerOne.value = playerOne
        ..playerTwo.value = playerTwo
        ..tournament.value = tournament
        ..fixtureRoundName = FixturesController.getCurrentRoundName(
            winners)
        ..matchRound = (tournament.knockoutTournament!.currentRound +1));
    }

    // tournament.knockoutTournament?.currentRound++;
    return nextRoundMatches;
  }

}
