import 'package:coza_app/modules/splashscreen/splash_screen.dart';
import 'package:coza_app/res/color_palette.dart';
import 'package:coza_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/home/home_bindings.dart';
import 'modules/landing/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData(
      fontFamily: 'Poppins',
      primaryColor: primaryColor,
      selectedRowColor: secondaryColor,
    );

    var defaultDurationTransition;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COZA App',
      theme: themeData,
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
      home: const LandingScreen(),
    );
  }
}

