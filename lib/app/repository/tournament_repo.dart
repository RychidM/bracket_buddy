import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:bracket_buddy/app/repository/db_service_Adaptor.dart';
import 'package:isar/isar.dart';

class TournamentRepository extends DbServiceAdaptor<Tournament> {
  late Isar isar;
  final IsarDbService _dbService = IsarDbService();

  @override
  Future<List<Tournament>> createMultiRecords(List<Tournament> records) async {
    isar = await _dbService.tournamentDb;
      final ids = await isar.writeTxn(() => isar.tournaments.putAll(records));
       await isar.tournaments.getAll(ids);
       return await isar.tournaments.where().findAll();
  }

  @override
  Future<Tournament?> createRecord(Tournament record) async {
    isar = await _dbService.tournamentDb;
      final id = await isar.writeTxn(() => isar.tournaments.put(record));
      return isar.tournaments.get(id);
  }

  @override
  Future<void> deleteMultiRecords(List<int> ids) async {
    isar = await _dbService.tournamentDb;

    await isar.writeTxn(() => isar.tournaments.deleteAll(ids));
  }

  @override
  Future<void> deleteRecord(int id) async {
    isar = await _dbService.tournamentDb;

    await isar.writeTxn(() => isar.tournaments.delete(id));
  }

  @override
  Future<List<Tournament>> getAllRecords() async {
    isar = await _dbService.tournamentDb;
    return await isar.tournaments.where().findAll();
  }

  @override
  Future<Tournament?> getRecordById(int id) async {
    isar = await _dbService.tournamentDb;
    return await isar.tournaments.get(id);
  }

  @override
  Future<List<Tournament?>> getRecordsByIds(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    return await isar.tournaments.getAll(ids);
  }

  @override
  Future<void> updateRecord(Tournament record) async {
    isar = await _dbService.tournamentDb;
    isar.writeTxn(() async {
      final tournament = await isar.tournaments.get(record.tournamentId);
      if (tournament != null) {
        await isar.tournaments.put(record);
      }
    });
  }
}
