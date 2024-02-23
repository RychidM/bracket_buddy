import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:bracket_buddy/app/repository/db_service_Adaptor.dart';
import 'package:isar/isar.dart';

import '../db_services/collections/player_db_model.dart';

class PlayerRepository extends DbServiceAdaptor<Player> {
  late Isar isar;
  final IsarDbService _dbService = IsarDbService();
  @override
  Future<List<Player?>> createMultiRecords(List<Player> records) async {
    isar = await _dbService.tournamentDb;
    List<int> ids = await isar.writeTxn(() => isar.players.putAll(records));
    return await getRecordsByIds(ids);
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
  Future<void> updateRecord(Player record) async {
    isar = await _dbService.tournamentDb;
    final player = await isar.players.get(record.playerId);

    if (player != null) {
      await isar.writeTxn(() => isar.players.put(record));
    }
  }

  Future<List<Player>> getPlayersForTournament(int tournamentId) async {
    isar = await _dbService.tournamentDb;
    return await isar.players
        .filter()
        .tournaments((q) => q.tournamentIdEqualTo(tournamentId))
        .findAll();
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

    return await isar.players.where().sortByPoints().findAll();
  }

  Future<List<Player>> getPlayerByEliminationStatus() async {
    isar = await _dbService.tournamentDb;
    return await isar.players.where().eliminationStatusEqualTo(false).findAll();
  }
}
