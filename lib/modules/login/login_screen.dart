import 'package:coza_app/components/alternate_login.dart';
import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/login/controller/login_controller.dart';
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
                    controller: loginController.passwordController,
                    obscureText: true,
                    prefixIcon: const Icon(CupertinoIcons.lock),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const FloatRightText(text: "Forgot Password"),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Obx(() {
                    return CustomButton(
                        label: "Continue",
                        isLoading: loginController.isLoading.value,
                        onPressed: handleLogin);
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const ContinueWith(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
