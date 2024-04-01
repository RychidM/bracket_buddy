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
  int points = 0;

  final tournament = IsarLink<Tournament>();

  @Index()
  bool winStatus = false;

  Player copyWith({
    Id? playerId,
    String? avatar,
    String? gamerTag,
    bool? isSelected,
    int? points,
    Tournament? tournament,
    bool? winStatus,
  }) {
    return Player()
      ..playerId = playerId ?? this.playerId
      ..avatar = avatar ?? this.avatar
      ..gamerTag = gamerTag ?? this.gamerTag
      ..isSelected = isSelected ?? this.isSelected
      ..points = points ?? this.points
      ..tournament.value = tournament ?? this.tournament.value
      ..winStatus = winStatus ?? this.winStatus
    ;
  }
}
