
import 'match_db_model.dart';
import 'player_db_model.dart';
import 'tournament_db_model.dart';

class KnockoutTournament extends DbTournament {
  int currentRound = 1;
  int totalRounds = 0;



  List<Fixtures> generateKnockOutMatches(List<DbPlayer> players) {
    List<Fixtures> matches = [];
    int numberOfPlayers = players.length;
    int numberOfMatches = numberOfPlayers ~/ 2;
    players.shuffle();

    for (int i = 0; i < numberOfMatches; i++) {
      matches.add(Fixtures(
        playerOne: players[i],
        playerTwo: players[numberOfPlayers - i - 1],
        matchRound: currentRound,
      ));
    }
    currentRound++;
    return matches;
  }

  List<Fixtures> generateNextSetOfMatched(List<DbPlayer> winners) {
    List<Fixtures> nextRoundMatches = [];
    if (winners.isEmpty || winners.length.isOdd) {
      return nextRoundMatches;
    }

    for (int i = 0; i < winners.length; i += 2) {
      DbPlayer playerOne = winners[i];
      DbPlayer playerTwo = winners[i + 1];

      nextRoundMatches.add(Fixtures(
          playerOne: playerOne,
          playerTwo: playerTwo,
          matchRound: currentRound));
    }

    currentRound++;
    return nextRoundMatches;
  }

}