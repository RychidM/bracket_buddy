import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _ = IsarDbService();
  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bracket Buddy",
        initialRoute: AppPages.initial,
        theme: AppTheme.buddyThemeData,
        getPages: AppPages.routes,
      ),
    ),
  );
}
