import 'package:bracket_buddy/app/db_services/collections/tournament_db_model.dart';
import 'package:bracket_buddy/app/db_services/models/knockout_tournament.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bracket_buddy/app/db_services/collections/player_db_model.dart';

void main() {
  group('generateNextSetOfMatched', () {
    test('returns an empty list when winners list is empty', () {
      final tournament = KnockoutTournament();
      final tour = Tournament();

      List<Player> winners = [];
      final nextRoundMatches = tournament.generateNextSetOfMatched(winners, tour);

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
      final nextRoundMatches = tournament.generateNextSetOfMatched(winners, tour);

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

    final nextRoundMatches = tournament.generateNextSetOfMatched(winners, tour);

    expect(nextRoundMatches.length, 0);
    expect(nextRoundMatches, []);
  });

  test('returns an empty list when there is one winner', () {
    final tournament = KnockoutTournament();
    final tour = Tournament();

    final winners = [Player()..gamerTag = 'Player  1'];
    final nextRoundMatches = tournament.generateNextSetOfMatched(winners, tour);

    expect(nextRoundMatches, isEmpty);
  });

  test('returns correct matches for a large number of winners', () {
    final tournament = KnockoutTournament();
    final tour = Tournament();

    final winners = List<Player>.generate(
      100,
      (index) => Player()..gamerTag = 'Player  $index',
    );
    final nextRoundMatches = tournament.generateNextSetOfMatched(winners, tour);

    expect(nextRoundMatches.length,
        50); //  100 winners should result in  50 matches
    expect(nextRoundMatches[0].playerOne.value?.gamerTag, 'Player  1');
    expect(nextRoundMatches[0].playerTwo.value?.gamerTag, 'Player  2');
    // ... additional checks for the last match ...
  });
  
  });

}
