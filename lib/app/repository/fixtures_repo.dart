import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:bracket_buddy/app/repository/db_service_Adaptor.dart';
import 'package:isar/isar.dart';

class FixturesRepository extends DbServiceAdaptor<Fixtures> {
  late Isar isar;
  final IsarDbService _dbService = IsarDbService();

  @override
  Future<void> createMultiRecords(List<Fixtures> records) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.fixtures.putAll(records));
  }

  @override
  Future<void> createRecord(Fixtures record) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.fixtures.put(record));
  }

  @override
  Future<void> deleteMultiRecords(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.fixtures.deleteAll(ids));
  }

  @override
  Future<void> deleteRecord(int id) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.fixtures.delete(id));
  }

  @override
  Future<List<Fixtures>> getAllRecords() async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.where().findAll();
  }

  @override
  Future<Fixtures?> getRecordById(int id) async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.get(id);
  }

  @override
  Future<List<Fixtures?>> getRecordsByIds(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.getAll(ids);
  }

  @override
  Future<void> updateRecord(Fixtures record) async {
    isar = await _dbService.tournamentDb;
    final fixture = await isar.fixtures.get(record.fixtureId);
    if (fixture != null) {
      await isar.fixtures.put(record);
    }
  }
  
}
