import 'package:bracket_buddy/app/repository/fixtures_repo.dart';
import 'package:bracket_buddy/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../db_services/collections/fixtures_db_model.dart';

class HomeController extends GetxController {
  final _fixtureRepo = FixturesRepository();

  @override
  void onInit() async{
   await _fixtureRepo.getAllRecords().then((List<Fixtures> fixtures) {
      if (fixtures.isNotEmpty) {
        Get.offNamed(Routes.FIXTURES, arguments: fixtures);
      }
    });
    super.onInit();
  }
}
