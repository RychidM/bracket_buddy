import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/models/knockout_tournament.dart';
import 'package:bracket_buddy/app/db_services/models/league_tournament.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';

void main() {
  group('generateNextSetOfMatched', () {
    test('returns an empty list when winners list is empty', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      List<Player> winners = [];
      final nextRoundMatches =
          tournament.generateNextSetOfMatched(winners, tour);

      expect(nextRoundMatches, isEmpty);
    });

    test('returns correct matches for an even number of winners', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      final winners = [
        Player()..gamerTag = 'Player  1',
        Player()..gamerTag = 'Player  2',
        Player()..gamerTag = 'Player  3',
        Player()..gamerTag = 'Player  4',
      ];
      final nextRoundMatches =
          tournament.generateNextSetOfMatched(winners, tour);

      expect(nextRoundMatches.length, 2);
      expect(nextRoundMatches[0].playerOne.value?.gamerTag, 'Player  1');
      expect(nextRoundMatches[0].playerTwo.value?.gamerTag, 'Player  2');
      expect(nextRoundMatches[1].playerOne.value?.gamerTag, 'Player  3');
      expect(nextRoundMatches[1].playerTwo.value?.gamerTag, 'Player  4');
    });

    test('returns an empty list when there is an odd number of winners', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      final winners = [
        Player()..gamerTag = 'Player  1',
        Player()..gamerTag = 'Player  2',
        Player()..gamerTag = 'Player  3',
      ];

      final nextRoundMatches =
          tournament.generateNextSetOfMatched(winners, tour);

      expect(nextRoundMatches.length, 0);
      expect(nextRoundMatches, []);
    });

    test('returns an empty list when there is one winner', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      final winners = [Player()..gamerTag = 'Player  1'];
      final nextRoundMatches =
          tournament.generateNextSetOfMatched(winners, tour);

      expect(nextRoundMatches, isEmpty);
    });

    test('returns correct matches for a large number of winners', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      final winners = List<Player>.generate(
        100,
        (index) => Player()..gamerTag = 'Player  $index',
      );
      final nextRoundMatches =
          tournament.generateNextSetOfMatched(winners, tour);

      expect(nextRoundMatches.length,
          50); //  100 winners should result in  50 matches
      expect(nextRoundMatches[0].playerOne.value?.gamerTag, 'Player  1');
      expect(nextRoundMatches[0].playerTwo.value?.gamerTag, 'Player  2');
      // ... additional checks for the last match ...
    });
  });


// league tournament fixtures generation tests
  group('Create league fixtures', () {
    test("generateLeagueFixtures returns empty list for no players", () {
      List<Player> players = [];
      final tournament = Tournament();

      var fixtures =
          LeagueTournament().generateLeagueFixtures(players, tournament);

      expect(fixtures, isEmpty);
    });


  test("generateLeagueFixtures generates correct fixtures for odd number", () {
    List<Player> players =
        List.generate(3, (index) => Player()..gamerTag = "$index");

    final tournament = Tournament();

    final fixtures =
        LeagueTournament().generateLeagueFixtures(players, tournament);

    expect(fixtures.length, 3);
  });

  test(
      "generateLeagueFixtures generates the correct number of fixtures for even number if players",
      () {
    final players = List<Player>.generate(
        6, (index) => Player()..gamerTag = "${index + 1}");

    final tournament = Tournament();

    var fixtures =
        LeagueTournament().generateLeagueFixtures(players, tournament);

    expect(fixtures.length, 15);
  });

 test(
      "generateLeagueFixtures generates the correct number of fixtures for double league tournament",
      () {
    final players = List<Player>.generate(
        6, (index) => Player()..gamerTag = "${index + 1}");

    final tournament = Tournament();
    tournament.leagueTournament = LeagueTournament();
    tournament.leagueTournament!.leagueType = LeagueType.doubleLeg;

    final fixtures =
        LeagueTournament().generateLeagueFixtures(players, tournament);

    expect(fixtures.length, 30);
  });

  test(
      "generatesLeaguesFixtures ads a 'Bye-Bye' player to the list of players if the number of players is odd",
      () {
    final players = List<Player>.generate(
        3, (index) => Player()..gamerTag = "${index + 1}");

    final tournament = Tournament();

    LeagueTournament().generateLeagueFixtures(players, tournament);

    expect(players.length, 4);
    expect(players.any((element) => element.gamerTag == "Bye-Bye"), isTrue);
  });

  });

 
}

// 0bqq4bmj70