import 'package:bracket_buddy/app/modules/tournament/data/models/player_model.dart';

class MatchModel {
  Player playerOne;
  Player playerTwo;
  Player? matchWinner;
  int? matchRound;

  MatchModel({
    required this.playerOne,
    required this.playerTwo,
    this.matchWinner,
    this.matchRound,
  });

  MatchModel copyWith({
    Player? playerOne,
    Player? playerTwo,
    Player? matchWinner,
    int? matchRound,
  }) {
    return MatchModel(
      playerOne: playerOne ?? this.playerOne,
      playerTwo: playerTwo ?? this.playerTwo,
      matchRound: matchRound ?? this.matchRound,
      matchWinner: matchWinner ?? this.matchWinner,
    );
  }
}
