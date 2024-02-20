

import 'package:bracket_buddy/app/db_collections/tournament_db_model.dart';

import 'player_db_model.dart';

class LeagueTournament extends DbTournament{  

  LeagueType leagueType = LeagueType.singleLeg;
  List<DbPlayer>? standing;
}

enum LeagueType { singleLeg, doubleLeg }
