import 'package:bracket_buddy/app/db_collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_collections/tournament_db_model.dart';
import 'package:isar/isar.dart';

part 'match_db_model.g.dart';

@collection
class Fixtures {
  Id fixtureId = Isar.autoIncrement;

  DbPlayer? playerOne;

  DbPlayer? playerTwo;

  @Index()
  int? playerOneScore;

  @Index()
  int? playerTwoScore;

  DbTournament? tournament;

  @Index()
  int? matchRound;

  Fixtures({
    this.playerOne,
    this.playerTwo,
    this.matchRound,
    this.playerOneScore,
    this.playerTwoScore,
    this.tournament,
  });
}
