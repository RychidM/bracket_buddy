import 'package:bracket_buddy/app/db_collections/knockout_tournament.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bracket_buddy/app/db_collections/player_db_model.dart';

void main() {
  group('generateNextSetOfMatched', () {
    test('returns an empty list when winners list is empty', () {
      final tournament = KnockoutTournament();

      List<DbPlayer> winners = [];
      final nextRoundMatches = tournament.generateNextSetOfMatched(winners);

      expect(nextRoundMatches, isEmpty);
    });

    test('returns correct matches for an even number of winners', () {
      final tournament = KnockoutTournament(
      );

      final winners = [
        DbPlayer(gamerTag: 'Player  1'),
        DbPlayer(gamerTag: 'Player  2'),
        DbPlayer(gamerTag: 'Player  3'),
        DbPlayer(gamerTag: 'Player  4'),
      ];
      final nextRoundMatches = tournament.generateNextSetOfMatched(winners);

      expect(nextRoundMatches.length, 2);
      expect(nextRoundMatches[0].playerOne?.gamerTag, 'Player  1');
      expect(nextRoundMatches[0].playerTwo?.gamerTag, 'Player  2');
      expect(nextRoundMatches[1].playerOne?.gamerTag, 'Player  3');
      expect(nextRoundMatches[1].playerTwo?.gamerTag, 'Player  4');
    });

  test('returns an empty list when there is an odd number of winners', () {
    final tournament = KnockoutTournament();

    final winners = [
      DbPlayer(gamerTag: 'Player  1'),
      DbPlayer(gamerTag: 'Player  2'),
      DbPlayer(gamerTag: 'Player  3'),
    ];

    final nextRoundMatches = tournament.generateNextSetOfMatched(winners);

    expect(nextRoundMatches.length, 0);
    expect(nextRoundMatches, []);
  });

  test('returns an empty list when there is one winner', () {
    final tournament = KnockoutTournament();

    final winners = [DbPlayer(gamerTag: 'Player   1')];
    final nextRoundMatches = tournament.generateNextSetOfMatched(winners);

    expect(nextRoundMatches, isEmpty);
  });

  test('returns correct matches for a large number of winners', () {
    final tournament = KnockoutTournament();

    final winners = List<DbPlayer>.generate(
      100,
      (index) => DbPlayer(gamerTag: 'Player  ${index + 1}'),
    );
    final nextRoundMatches = tournament.generateNextSetOfMatched(winners);

    expect(nextRoundMatches.length,
        50); //  100 winners should result in  50 matches
    expect(nextRoundMatches[0].playerOne?.gamerTag, 'Player  1');
    expect(nextRoundMatches[0].playerTwo?.gamerTag, 'Player  2');
    // ... additional checks for the last match ...
  });
  
  });

}
