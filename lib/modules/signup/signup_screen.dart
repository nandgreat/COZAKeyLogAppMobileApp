import 'package:coza_app/components/alternate_login.dart';
import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/login/login_screen.dart';
import 'package:coza_app/modules/signup/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/helpers.dart';

import '../../components/custom_text_input.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormState>();

  final SignupController _signupController = Get.put(SignupController());

  handleSignup() {
    hideKeyboard(context);
    if (_signupFormKey.currentState!.validate()) {
      _signupController.signup();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          title: "Sign up",
          child: SingleChildScrollView(
            child: Form(
              key: _signupFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SizedBox(
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Username',
                        label: "Username",
                        controller: _signupController.usernameController,
                        prefixIcon: const Icon(CupertinoIcons.person),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomTextField(
                              hintText: 'First Name',
                              label: "First Name",
                              controller: _signupController.firstNameController,
                              prefixIcon: const Icon(CupertinoIcons.person),
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomTextField(
                              hintText: 'Last Name',
                              label: "Last Name",
                              controller: _signupController.lastNameController,
                              prefixIcon: const Icon(CupertinoIcons.person),
                            ),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        hintText: 'Email Address',
                        label: "Email Address",
                        functionValidate: validateEmailInput,
                        controller: _signupController.emailController,
                        prefixIcon: const Icon(CupertinoIcons.mail),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        hintText: 'Phone Number',
                        label: "Phone Number",
                        textInputType: TextInputType.phone,
                        controller: _signupController.phoneController,
                        prefixIcon: const Icon(CupertinoIcons.phone),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        hintText: 'Password',
                        label: "Password",
                        controller: _signupController.passwordController,
                        obscureText: true,
                        prefixIcon: const Icon(CupertinoIcons.lock),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const ContinueWith(),
                      Obx(() => CustomButton(
                          label: "Continue",
                          isLoading: _signupController.isLoading.value,
                          onPressed: handleSignup)),
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
      ),
    );
  }
}
