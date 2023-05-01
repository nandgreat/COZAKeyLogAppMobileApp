import 'package:coza_app/components/alternate_login.dart';
import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/helpers.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/custom_text_input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseScreen(
          title: "Sign up",
          child: SingleChildScrollView(
            child: SizedBox(
              width: deviceWidth(context) - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextField(
                    hintText: 'Username',
                    label: "Username",
                    prefixIcon: Icon(CupertinoIcons.person),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: CustomTextField(
                              hintText: 'First Name',
                              label: "First Name",
                              prefixIcon: Icon(CupertinoIcons.person),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: CustomTextField(
                              hintText: 'Last Name',
                              label: "Last Name",
                              prefixIcon: Icon(CupertinoIcons.person),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const CustomTextField(
                    hintText: 'Email Address',
                    label: "Email Address",
                    prefixIcon: Icon(CupertinoIcons.mail),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const CustomTextField(
                    hintText: 'Password',
                    label: "Password",
                    obscureText: true,
                    prefixIcon: Icon(CupertinoIcons.lock),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const ContinueWith(),
                  CustomButton(
                      label: "Continue",
                      onPressed: () => Get.to(const LoginScreen())),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "By continuing you agree to the ? ",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      "Terms and Conditions and Privacy Policy",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
