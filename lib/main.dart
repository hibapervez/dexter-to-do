import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  // Wait for bindings
  WidgetsFlutterBinding.ensureInitialized();

  //Set portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    ScreenUtilInit(
      // xd art board size
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "Dexter ToDo",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context,widget) {
            return MediaQuery(
              // Prevent from scaling the fonts of the app
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          initialRoute: AppPages.INITIAL, // first screen to show when app is running
          getPages: AppPages.routes, // app screens
        );
      },
    ),
  );
}