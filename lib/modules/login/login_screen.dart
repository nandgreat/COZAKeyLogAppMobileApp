import 'package:coza_app/components/alternate_login.dart';
import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/forgot_password/forgot_password_screen.dart';
import 'package:coza_app/modules/login/login_controller.dart';
import 'package:coza_app/modules/signup/signup_screen.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_text_input.dart';
import '../../components/float_right_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  handleLogin() {
    hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      loginController.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          title: "Login",
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SizedBox(
              height: deviceHeight(context),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Enter Email',
                    label: "Email",
                    controller: loginController.emailController,
                    prefixIcon: const Icon(CupertinoIcons.person),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomTextField(
                    hintText: 'Enter Password',
                    label: "Password",
                    togglePassword: true,
                    controller: loginController.passwordController,
                    obscureText: true,
                    prefixIcon: const Icon(CupertinoIcons.lock),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FloatRightText(text: "Forgot Password", onPress: () => Get.to(const ForgotPasswordScreen()),),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Obx(() {
                    return CustomButton(
                        label: "Continue",
                        isLoading: loginController.isLoading.value,
                        onPressed: handleLogin);
                  }),
                  InkWell(
                    onTap: () => Get.to(SignupScreen()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Don't have an Account? ",
                            style: TextStyle(fontSize: 12.0),
                          ),
                          Text(
                            "Sign up",
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
