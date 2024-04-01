import 'package:get/get.dart';

import '../../../db_services/collections/tournament_db_model.dart';

class HomeState {

  final Rx<List<Tournament>> _tournaments = Rx<List<Tournament>>([]);
  List<Tournament> get tournaments => _tournaments.value;
  set tournaments(List<Tournament> value) => _tournaments.value = value;
}