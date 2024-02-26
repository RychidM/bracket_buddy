import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';

class FixturesState {
  /// Holds the current value of fixtures
  final RxList<Fixtures> _fixtures = <Fixtures>[].obs;
  List<Fixtures> get fixtures => _fixtures;
  set fixtures(List<Fixtures> fixtures) => _fixtures.value = fixtures;
  
}
