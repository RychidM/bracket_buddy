import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/player_db_model.dart';

class IsarDbService {
  late Future<Isar> tournamentDb;

  IsarDbService() {
    tournamentDb = openTournamentDb();
  }

  Future<Isar> openTournamentDb() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([TournamentSchema, FixturesSchema, PlayerSchema],
          directory: dir.path, inspector: true, name: 'bracketBuddy');
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> closeTournamentDb() async {
    final isar = await tournamentDb;
    await isar.close();
  }

  Future<void> clearTournamentDb() async {
    final isar = await tournamentDb;

    isar.clear();
  }
}
