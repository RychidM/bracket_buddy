import 'package:isar/isar.dart';

part 'tournament_db_model.g.dart';

@embedded
class DbTournament {

  String? tournamentName;

  @Enumerated(EnumType.name)
  TournamentType? tournamentType;
}

enum TournamentType {
  league,
  knockout,
}
