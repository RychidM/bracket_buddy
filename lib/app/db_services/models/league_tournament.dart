import 'package:isar/isar.dart';

part 'league_tournament.g.dart';

@embedded
class LeagueTournament {
  @Enumerated(EnumType.name)
  LeagueType? leagueType;
}

enum LeagueType { singleLeg, doubleLeg }
