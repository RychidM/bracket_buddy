import 'package:isar/isar.dart';

import '../collections/fixtures_db_model.dart';
import '../collections/player_db_model.dart';
import '../collections/tournament_db_model.dart';

part 'league_tournament.g.dart';

@embedded
class LeagueTournament {
  @Enumerated(EnumType.name)
  LeagueType? leagueType;


    List<Fixtures> generateLeagueFixtures(
      List<Player> players, Tournament tournament) {
    List<Fixtures> fixtures = [];

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
          Fixtures fixture = Fixtures()
            ..playerOne.value = playerOne
            ..playerTwo.value = playerTwo
            ..tournament.value = tournament
            ..matchRound = round + 1;
          fixtures.add(fixture);
        }
      }
      players.insert(1, players.removeLast());
    }

    if (tournament.leagueTournament?.leagueType == LeagueType.doubleLeg) {
      List<Fixtures> roundTwoFixtures =
          fixtures.map((fixture) => fixture.reverseFixture()).toList();
      fixtures.addAll(roundTwoFixtures);
    }

    return fixtures;
  }
}

enum LeagueType { singleLeg, doubleLeg }
