import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:bracket_buddy/app/repository/db_service_Adaptor.dart';
import 'package:isar/isar.dart';

import '../db_services/collections/player_db_model.dart';

class PlayerRepository extends DbServiceAdaptor<Player> {
  late Isar isar;
  final IsarDbService _dbService = IsarDbService();

  @override
  Future<List<Player>> createMultiRecords(List<Player> records) async {
    try {
      isar = await _dbService.tournamentDb;
      List<int> ids = await isar.writeTxn(() async {
        var returnedIds = await isar.players.putAll(records);
        for (var record in records) {
          await isar.tournaments.put(record.tournaments.value!);
          await record.tournaments.save();
        }
        return returnedIds;
      });

      List<Player?> returnedPlayers = await isar.players.getAll(ids);
      return returnedPlayers.whereType<Player>().toList();
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> createRecord(Player record) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.players.put(record));
  }

  @override
  Future<void> deleteMultiRecords(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.players.deleteAll(ids));
  }

  @override
  Future<void> deleteRecord(int id) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.players.delete(id));
  }

  @override
  Future<List<Player>> getAllRecords() async {
    isar = await _dbService.tournamentDb;
    return await isar.players.where().findAll();
  }

  @override
  Future<Player?> getRecordById(int id) async {
    isar = await _dbService.tournamentDb;
    return await isar.players.get(id);
  }

  @override
  Future<List<Player?>> getRecordsByIds(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    return await isar.players.getAll(ids);
  }

  @override
  Future<Player?> updateRecord(Player record) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() async {
      final player = await isar.players.get(record.playerId);

      if (player != null) {
        isar.players.put(record);
      }
    });
    return getRecordById(record.playerId);
  }

  Future<List<Player>> getPlayersForTournament(int tournamentId) async {
    isar = await _dbService.tournamentDb;
    return await isar.players
        .filter()
        .tournaments((q) => q.tournamentIdEqualTo(tournamentId))
        .findAll();
  }

  Future<void> clearDb() async {
    isar = await _dbService.tournamentDb;

    await isar.writeTxn(() => isar.clear());
  }

  Future<List<Player>> getPlayersInTournamentType(TournamentType type) async {
    isar = await _dbService.tournamentDb;
    return await isar.players
        .filter()
        .tournaments((q) => q.tournamentTypeEqualTo(type))
        .findAll();
  }

  Future<List<Player>> getPlayerByScore() async {
    isar = await _dbService.tournamentDb;

    return await isar.players.where(sort: Sort.desc).sortByPoints().findAll();
  }

  Future<List<Player>> getPlayersByWinStatus(int id) async {
    isar = await _dbService.tournamentDb;
    List<Player> res = await isar.players
        .where()
        .winStatusEqualTo(true)
        .filter()
        .tournaments((q) => q.tournamentIdEqualTo(id))
        .findAll();

    print(res.map((e) => e.gamerTag).toList());
    return res;
  }

  Future<void> deletePlayersAssociatedWithTournament(int id) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.players
        .where()
        .filter()
        .tournaments((q) => q.tournamentIdEqualTo(id))
        .deleteAll());
  }

  @override
  Future<void> updateMultiRecords(List<Player> records) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() async {
      for (var record in records) {
        final player = await isar.players.get(record.playerId);
        if (player != null) {
          await isar.players.put(record);
        }
      }
    });
  }
}
