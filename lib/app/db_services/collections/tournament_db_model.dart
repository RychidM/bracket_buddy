import 'package:bracket_buddy/app/db_services/models/league_tournament.dart';
import 'package:isar/isar.dart';

import '../models/knockout_tournament.dart';

part 'generated/tournament_db_model.g.dart';

@collection
class Tournament {

  Id tournamentId = Isar.autoIncrement;

  String? tournamentName;

  @Enumerated(EnumType.name)
  TournamentType? tournamentType;

  LeagueTournament? leagueTournament;

  KnockoutTournament? knockoutTournament;
}

enum TournamentType {
  league,
  knockout,
}
