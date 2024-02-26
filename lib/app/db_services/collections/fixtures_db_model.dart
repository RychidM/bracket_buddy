import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:isar/isar.dart';

part 'generated/fixtures_db_model.g.dart';

@collection
class Fixtures {
  Id fixtureId = Isar.autoIncrement;

  final playerOne = IsarLink<Player>();

  final playerTwo = IsarLink<Player>();

  @Index()
  int? playerOneScore;

  @Index()
  int? playerTwoScore;

  final tournament = IsarLink<Tournament>();

  @Index()
  int? matchRound;

  Fixtures reverseFixture() {
    Fixtures reversedFixture = Fixtures()
      ..playerOne.value = playerTwo.value
      ..playerTwo.value = playerOne.value
      ..tournament.value = tournament.value;
    return reversedFixture;
  }
}
