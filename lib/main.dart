import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bracket Buddy",
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    ),
  );
}
