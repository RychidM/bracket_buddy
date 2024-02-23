import 'dart:math';

import 'package:bracket_buddy/app/modules/tournament/controllers/tournament_state.dart';
import 'package:bracket_buddy/app/modules/tournament/data/tournament_dummy_data.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/player_db_model.dart';

class TournamentController extends GetxController {
  TournamentState tournamentState = TournamentState();

  @override
  void onInit() {
    tournamentState.tournamentName = generateWordPairs().take(1).toList().first.asSnakeCase;
    super.onInit();
  }

  void updateTournamentType(TournamentType tournamentType) {
    tournamentState.tournamentType = tournamentType;
    debugPrint(tournamentType.desc);
  }

  void updateCurrentTournamentStep(CreateTournamentStep step) {
    tournamentState.currentTournamentStep = step;
  }

  void numberOfPlayersSelected(int numberOfPlayers) {
    tournamentState.numberOfPlayers = numberOfPlayers;
  }

  void onTournamentNameChanged(String tournamentName) {
    tournamentState.tournamentName = tournamentName;
  }

  void generatePlayerNames() {
    int numberOfPlayers = tournamentState.numberOfPlayers;
    final List<WordPair> wordPairs =
        generateWordPairs().take(numberOfPlayers).toList();

    final List<String> avatars = playerAvatars;
    avatars.shuffle();
    final random = Random();
    List<Player> players = [];

    for (int i = 0; i < numberOfPlayers; i++) {
      String playerAvatar = avatars[i % playerAvatars.length];
      String wordPair = wordPairs[i % playerAvatars.length].asSnakeCase;
      int number = random.nextInt(9000) + 1;

      String gamerTag = "$wordPair-$number";

      final player = Player()
        ..gamerTag = gamerTag
        ..tournaments.value = tournamentState.tournament
        ..avatar = playerAvatar;

      players.add(player);
    }

    tournamentState.players = players;
  }

  updatePlayerSelectedStatus(int index, Player player) {
    List<Player> players = tournamentState.players;
    players[index].isSelected = !players[index].isSelected;
    tournamentState.players = players;
  }

  Color getAccentColor(int index) {
    int correctColorIndex = index % Colors.primaries.length;
    List<MaterialColor> shuffledColors = Colors.primaries.toList();
    shuffledColors.shuffle();
    return shuffledColors[correctColorIndex];
  }

  createMatches() {
    List<Player> players = tournamentState.players;

    players.shuffle();

    for (int i = 0; i < players.length; i += 2) {
      
    }
  }
}
