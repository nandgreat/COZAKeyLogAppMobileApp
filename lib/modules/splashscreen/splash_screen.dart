import 'package:coza_app/res/images.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(SPLASH_SCREEN_BG), fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}
