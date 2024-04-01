import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:isar/isar.dart';

part 'generated/fixtures_db_model.g.dart';

@collection
class Fixture {
  Id fixtureId = Isar.autoIncrement;

  final playerOne = IsarLink<Player>();

  final playerTwo = IsarLink<Player>();

  final fixtureWinner = IsarLink<Player>();

  @Index()
  int? playerOneScore;

  @Index()
  int? playerTwoScore;

  final tournament = IsarLink<Tournament>();

  @Index()
  int? matchRound;

  late String fixtureRoundName;

  Fixture reverseFixture() {
    Fixture reversedFixture = Fixture()
      ..playerOne.value = playerTwo.value
      ..playerTwo.value = playerOne.value
      ..tournament.value = tournament.value;
    return reversedFixture;
  }

  Fixture copyWith({
    Id? fixtureId,
    Player? playerOne,
    Player? playerTwo,
    Player? fixtureWinner,
    int? playerOneScore,
    int? playerTwoScore,
    Tournament? tournament,
    int? matchRound,
    String? fixtureRoundName,
  }) {
    return Fixture()
      ..playerOne.value = playerOne ?? this.playerOne.value
      ..fixtureId = fixtureId ?? this.fixtureId
      ..fixtureWinner.value = fixtureWinner ?? this.fixtureWinner.value
      ..playerOneScore = playerOneScore ?? this.playerOneScore
      ..playerTwoScore = playerTwoScore ?? this.playerTwoScore
      ..tournament.value = tournament ?? this.tournament.value
      ..matchRound = matchRound ?? this.matchRound
      ..fixtureRoundName = fixtureRoundName ?? this.fixtureRoundName
      ..playerTwo.value = playerTwo ?? this.playerTwo.value;
  }
}

@collection
class Winners {
  Id winnerId = Isar.autoIncrement;

  final winner = IsarLink<Player>();

  final fixture = IsarLink<Fixture>();

  int round = 0;
}
