import 'package:bracket_buddy/app/db_services/models/league_tournament.dart';
import 'package:isar/isar.dart';

import '../models/knockout_tournament.dart';

part 'generated/tournament_db_model.g.dart';

@collection
class Tournament {
  Id tournamentId = Isar.autoIncrement;

  late String tournamentName;

  @Enumerated(EnumType.name)
  TournamentType? tournamentType;

  LeagueTournament? leagueTournament;

  KnockoutTournament? knockoutTournament;

  Tournament copyWith({
    Id? tournamentId,
    String? tournamentName,
    TournamentType? tournamentType,
    LeagueTournament? leagueTournament,
    KnockoutTournament? knockoutTournament,
  }) {
    return Tournament()
      ..tournamentId = tournamentId ?? this.tournamentId
      ..tournamentType = tournamentType ?? this.tournamentType
      ..leagueTournament = leagueTournament ?? this.leagueTournament
      ..knockoutTournament = knockoutTournament ?? this.knockoutTournament
      ..tournamentName = tournamentName ?? this.tournamentName;
  }
}

enum TournamentType {
  league,
  knockout,
}
