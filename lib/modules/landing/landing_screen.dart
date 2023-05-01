import 'package:coza_app/modules/home/home_screen.dart';
import 'package:coza_app/modules/splashscreen/splash_screen.dart';
import 'package:coza_app/res/color_palette.dart';
import 'package:coza_app/res/images.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/local_storage_helper.dart';
import '../signup/signup_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    getUserInfo();

    super.initState();
  }

  getUserInfo() async {
    LocalStorageHelper localStorageHelper = LocalStorageHelper();
    String? user = await localStorageHelper.retrieveItem(key: "user");

    logItem(user);

    if (user != null) {
      Get.to(HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: deviceHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(LANDING_CIRCLE_IMAGE),
                                  fit: BoxFit.fitHeight)),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: deviceWidth(context) - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Connect easily with \n God’s People in COZA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.3),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(SignupScreen());
                            },
                            child: Container(
                              width: 200,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: primaryColor,
                              ),
                              child: const Center(
                                  child: Text(
                                "Leg's get started",
                                style: TextStyle(color: Colors.white),
                              )),
                            )),
                        InkWell(
                          onTap: () => Get.toNamed(AppRoutes.login),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Already have an Account? ",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
