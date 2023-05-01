import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/helpers.dart';

import '../../components/custom_text_input.dart';
import '../../res/color_palette.dart';
import '../bottom_nav/bottom_dart.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                    )),
                Container(
                  width: deviceWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reset\nPassword?",
                        style: TextStyle(
                            height: 1,
                            fontSize: 28.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const CustomTextField(
                  hintText: 'New Password',
                  label: "New Password",
                  prefixIcon: Icon(CupertinoIcons.lock),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextField(
                  hintText: 'Confirm Password',
                  label: "Confirm Password",
                  prefixIcon: Icon(CupertinoIcons.lock),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomButton(
                    label: "Submit",
                    onPressed: () {
                      Get.to(BottomNav());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
