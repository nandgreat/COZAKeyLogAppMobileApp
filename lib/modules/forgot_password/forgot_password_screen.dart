import 'package:coza_app/components/app_bar.dart';
import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/reset_password/reset_password_screen.dart';
import 'package:coza_app/modules/verify_otp/verify_otp.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/custom_text_input.dart';
import '../../res/color_palette.dart';
import '../../res/images.dart';
import '../signup/signup_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: 300.0,
                    height: 300.0,
                    child: Image.asset(
                      FORGOT_PASSWORD_ILLUSTRATION,
                      height: 300.0,
                      width: 300.0,
                    )),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Forgot\nPassword?",
                        style: TextStyle(
                            height: 1,
                            fontSize: 28.0,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        child: Text(
                          "Don’t worry! it happens. Please enter the email address associated with your account.",
                          style: TextStyle(height: 1.3),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const CustomTextField(
                  hintText: 'Email Address',
                  label: "Email Address",
                  prefixIcon: Icon(CupertinoIcons.mail),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                    label: "Submit",
                    onPressed: () {
                      Get.to(const VerifyOtpScreen());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
