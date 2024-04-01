import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';
import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:bracket_buddy/app/repository/db_service_Adaptor.dart';
import 'package:isar/isar.dart';

class FixturesRepository extends DbServiceAdaptor<Fixture> {
  late Isar isar;
  final IsarDbService _dbService = IsarDbService();

  @override
  Future<List<Fixture>> createMultiRecords(List<Fixture> records) async {
    try {
      isar = await _dbService.tournamentDb;
      List<int> ids = await isar.writeTxn(() async {
        var returnedIds = await isar.fixtures.putAll(records);
        for (var element in records) {
          await isar.players.put(element.playerOne.value!);
          await isar.players.put(element.playerTwo.value!);
          await isar.tournaments.put(element.tournament.value!);
          await element.playerOne.save();
          await element.playerTwo.save();
          await element.tournament.save();
        }
        return returnedIds;
      });
      var returnedFixtures = await isar.fixtures.getAll(ids);
      return returnedFixtures.whereType<Fixture>().toList();
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<Fixture?> createRecord(Fixture record) async {
    isar = await _dbService.tournamentDb;
    int id = await isar.writeTxn(() => isar.fixtures.put(record));
    return await isar.fixtures.get(id);
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
  Future<List<Fixture>> getAllRecords() async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.where().findAll();
  }

  @override
  Future<Fixture?> getRecordById(int id) async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.get(id);
  }

  @override
  Future<List<Fixture?>> getRecordsByIds(List<int> ids) async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures.getAll(ids);
  }

  @override
  Future<void> updateRecord(Fixture record) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() async {
      final fixture = await isar.fixtures.get(record.fixtureId);
      if (fixture != null) {
        await isar.fixtures.put(record);
        if (record.fixtureWinner.value != null) {
          await isar.players.put(record.fixtureWinner.value!);
          await record.fixtureWinner.save();
        }
      }
    });
  }

  Future<List<Fixture>> getRoundFixtures(int tournamentId, int round) async {
    isar = await _dbService.tournamentDb;
    return await isar.fixtures
        .where()
        .matchRoundEqualTo(round)
        .filter()
        .tournament((q) => q.tournamentIdEqualTo(tournamentId))
        .findAll();
  }

  Future<Map<int, List<Fixture>>> getFixturesByTournament(
      int tournamentId) async {
    try {
      Map<int, List<Fixture>> fixturesMap = {};
      isar = await _dbService.tournamentDb;

      List<Fixture> fixtures = await isar.fixtures
          .where()
          .filter()
          .tournament((q) => q.tournamentIdEqualTo(tournamentId))
          .findAll();

      if (fixtures.isNotEmpty) {
        for (Fixture fixture in fixtures) {
          fixturesMap.putIfAbsent(
              fixture.matchRound!,
              () => fixtures
                  .where((e) => fixture.matchRound == e.matchRound)
                  .toList());
        }
      }
      return fixturesMap;
    } on Exception {
      rethrow;
    }
  }

  Future<bool> allFixturesPlayed(int tournamentId) async {
    isar = await _dbService.tournamentDb;
    List<Fixture> fixtures = await isar.fixtures
        .where()
        .filter()
        .tournament((q) => q.tournamentIdEqualTo(tournamentId))
        .and()
        .fixtureWinnerIsNull()
        .findAll();
    
    return fixtures.isEmpty;
  }

  Future<void> deleteFixtureAssociatedWithTournament(int tournamentId) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() => isar.fixtures
        .where()
        .filter()
        .tournament((q) => q.tournamentIdEqualTo(tournamentId))
        .deleteAll());
  }

  Future<List<Fixture>> getFixturesByPlayer(int playerId) async {
    isar = await _dbService.tournamentDb;
    List<Fixture> fixtures = [];
    fixtures = await isar.fixtures
        .where()
        .filter()
        .playerOne((player) => player.playerIdEqualTo(playerId))
        .findAll();
    return fixtures;
  }

  @override
  Future<void> updateMultiRecords(List<Fixture> records) async {
    isar = await _dbService.tournamentDb;
    await isar.writeTxn(() async {
      for (var record in records) {
        final fixture = await isar.fixtures.get(record.fixtureId);
        if (fixture != null) {
          await isar.fixtures.put(record);
          if (record.fixtureWinner.value != null) {
            await isar.players.put(record.fixtureWinner.value!);
            await record.fixtureWinner.save();
          }
        }
      }
    });
  }
}
