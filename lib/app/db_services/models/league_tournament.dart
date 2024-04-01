import 'package:isar/isar.dart';

import '../collections/fixtures_db_model.dart';
import '../collections/player_db_model.dart';
import '../collections/tournament_db_model.dart';

part 'league_tournament.g.dart';

@embedded
class LeagueTournament {
  @Enumerated(EnumType.name)
  LeagueType? leagueType;

  List<Fixture> generateLeagueFixtures(
      List<Player> players, Tournament tournament) {
    List<Fixture> fixtures = [];

    players.shuffle();

    if (players.length.isOdd) {
      players.add(Player()..gamerTag = 'Bye-Bye');
    }

    int numPlayers = players.length;

    for (int round = 0; round < numPlayers - 1; round++) {
      for (int match = 0; match < numPlayers / 2; match++) {
        Player playerOne = players[match];
        Player playerTwo = players[numPlayers - match - 1];

        if (playerOne.gamerTag != "Bye-Bye" &&
            playerTwo.gamerTag != "Bye-Bye") {
          Fixture fixture = Fixture()
            ..playerOne.value = playerOne
            ..playerTwo.value = playerTwo
            ..tournament.value = tournament
            ..fixtureRoundName = "Round ${round + 1}"
            ..matchRound = round + 1;
          fixtures.add(fixture);
        }
      }
      players.insert(1, players.removeLast());
    }

    if (tournament.leagueTournament?.leagueType == LeagueType.doubleLeg) {
      List<Fixture> roundTwoFixtures =
          fixtures.map((fixture) => fixture.reverseFixture()).toList();
      fixtures.addAll(roundTwoFixtures);
    }

    return fixtures;
  }
}

enum LeagueType { singleLeg, doubleLeg }
