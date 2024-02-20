// import 'package:bracket_buddy/app/db_collections/match_db_model.dart';
// import 'package:bracket_buddy/app/modules/tournament/data/models/match_model.dart';
// import 'package:bracket_buddy/app/modules/tournament/data/models/player_model.dart';


// abstract class Tournament {
//   String id;
//   List<Player> players;
//   List<MatchModel> matches;

//   Tournament({
//     required this.id,
//     required this.players,
//     required this.matches,
//   });
// }

// class KnockOutTournament extends Tournament {
//   int currentRound = 1;
//   int totalRounds;
//   KnockOutTournament(
//       {required super.id,
//       required super.players,
//       required super.matches,
//       required this.totalRounds});

// }

// class RoundRobinTournament extends Tournament {
//   RoundRobinTournament(
//       {required super.id, required super.players, required super.matches});

//   List<Fixtures> createRoundRobinMatches(List<Player> players) {
//     players.shuffle();
//     return [];
//   }
// }
