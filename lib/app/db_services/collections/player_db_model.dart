import 'package:isar/isar.dart';

import 'tournament_db_model.dart';

part 'generated/player_db_model.g.dart';

@collection
class Player {

  Id playerId = Isar.autoIncrement;

  @Index()
  late String gamerTag;

  late String avatar;

  bool isSelected = false;

  @Index()
  int? points;

  final tournaments = IsarLink<Tournament>();

  @Index()
  bool eliminationStatus = false;

}
