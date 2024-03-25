import 'dart:ui';

import 'package:bracket_buddy/app/data/theme/app_theme.dart';
import 'package:bracket_buddy/app/db_services/isar_db_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     ).then((value) {
       FlutterError.onError = (errorDetails) {
         FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
       };
       PlatformDispatcher.instance.onError = (error, stack) {
         FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
         return true;
       };
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
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
