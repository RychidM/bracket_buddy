import 'package:bracket_buddy/app/modules/tournament/data/models/match_model.dart';
import 'package:bracket_buddy/app/modules/tournament/data/models/player_model.dart';

abstract class Tournament {
  String id;
  List<Player> players;
  List<MatchModel> matches;

  Tournament({
    required this.id,
    required this.players,
    required this.matches,
  });
}

class KnockOutTournament extends Tournament {
  int currentRound = 1;
  int totalRounds;
  KnockOutTournament(
      {required super.id,
      required super.players,
      required super.matches,
      required this.totalRounds});

  List<MatchModel> generateKnockOutMatches(List<Player> players) {
    List<MatchModel> matches = [];
    int numberOfPlayers = players.length;
    int numberOfMatches = numberOfPlayers ~/ 2;
    players.shuffle();

    for (int i = 0; i < numberOfMatches; i++) {
      matches.add(MatchModel(
        playerOne: players[i],
        playerTwo: players[numberOfPlayers - i - 1],
        matchRound: currentRound,
      ));
    }
    currentRound++;
    return matches;
  }

  List<MatchModel> generateNextSetOfMatched(List<Player> winners) {
    List<MatchModel> nextRoundMatches = [];
    if (winners.isEmpty) {
      return nextRoundMatches;
    }

    for (int i = 0; i < winners.length; i += 2) {
      Player playerOne = winners[i];
      Player playerTwo = winners[i + 1];

      nextRoundMatches.add(MatchModel(
          playerOne: playerOne,
          playerTwo: playerTwo,
          matchRound: currentRound));
    }

    currentRound++;
    return nextRoundMatches;
  }
}

class RoundRobinTournament extends Tournament {
  RoundRobinTournament(
      {required super.id, required super.players, required super.matches});

  List<MatchModel> createRoundRobinMatches(List<Player> players) {
    players.shuffle();
    return [];
  }
}
