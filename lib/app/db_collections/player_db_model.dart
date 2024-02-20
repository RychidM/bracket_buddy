import 'package:bracket_buddy/app/db_collections/tournament_db_model.dart';
import 'package:isar/isar.dart';

part 'player_db_model.g.dart';

@embedded
class DbPlayer {
  String? gamerTag;

  String? avatar;

  bool isSelected;

  int? points;

  DbTournament? tournament;

  bool eliminationStatus;

  DbPlayer({
    this.gamerTag,
    this.avatar,
    this.isSelected = false,
    this.points,
    this.tournament,
    this.eliminationStatus = false,
  });
}
