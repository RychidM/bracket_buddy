import 'package:bracket_buddy/app/db_services/collections/fixtures_db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/player_db_model.dart';
import '../../../db_services/collections/tournament_db_model.dart';

class TournamentState {
  /// [_tournamentSelectorController] controllers which tournament type is selected
  final PageController _tournamentSelectorController = PageController();
  PageController get tournamentSelectorController =>
      _tournamentSelectorController;

  final Rx<Tournament> _tournament = Tournament().obs;
  Tournament get tournament => _tournament.value;
  set tournament(Tournament tournament) => _tournament.value = tournament;

  final TextEditingController _tournamentNameController =
      TextEditingController();
  TextEditingController get tournamentNameController =>
      _tournamentNameController;

  /// [_tournamentType] holds the current value of selected tournament type in
  /// the state.
  final Rx<TournamentType> _tournamentType =
      Rx<TournamentType>(TournamentType.knockOut);
  TournamentType get tournamentType => _tournamentType.value;
  set tournamentType(TournamentType type) => _tournamentType.value = type;

  /// [_currentTournamentStep] keeps track of the tournament creation steps
  final Rx<CreateTournamentStep> _currentTournamentStep =
      Rx<CreateTournamentStep>(CreateTournamentStep.stepOne);
  CreateTournamentStep get currentTournamentStep =>
      _currentTournamentStep.value;
  set currentTournamentStep(CreateTournamentStep step) =>
      _currentTournamentStep.value = step;

  /// [_numberOfPlayers] holds the value of the selected number of players
  /// to enter the tournament
  final RxInt _numberOfPlayers = 0.obs;
  int get numberOfPlayers => _numberOfPlayers.value;
  set numberOfPlayers(int value) => _numberOfPlayers.value = value;

  /// holds the value of the entered name by the user
  final RxString _tournamentName = ''.obs;
  String get tournamentName => _tournamentName.value;
  set tournamentName(String name) => _tournamentName.value = name;

  /// [_players] holds the list of players
  final RxList<Player> _players = <Player>[].obs;
  List<Player> get players => _players;
  set players(List<Player> players) => _players.value = players;

  final RxList<Fixtures> _matches = <Fixtures>[].obs;
  List<Fixtures> get matches => _matches;
  set matches(List<Fixtures> matches) => _matches.value = matches;
}

enum TournamentType {
  knockOut("Knock Out", "KO"),
  league("League", "LG");

  const TournamentType(this.code, this.desc);

  final String desc;
  final String code;
}

enum CreateTournamentStep { stepOne, stepTwo, stepThree }
