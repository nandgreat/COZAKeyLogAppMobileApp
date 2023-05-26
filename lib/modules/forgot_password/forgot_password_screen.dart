import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/forgot_password/forgot_password_controller.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/custom_text_input.dart';
import '../../res/color_palette.dart';
import '../../res/images.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  final _formKey = GlobalKey<FormState>();

  handleForgotPassword() {
    if (_formKey.currentState!.validate()) {
      forgotPasswordController.passwordRequest();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              height: deviceHeight(context),
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
                  CustomTextField(
                    hintText: 'Email Address',
                    label: "Email Address",
                    controller: forgotPasswordController.emailController,
                    prefixIcon: const Icon(CupertinoIcons.mail),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(() => CustomButton(
                      label: "Submit",
                      isLoading: forgotPasswordController.isLoading.value,
                      onPressed: handleForgotPassword))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
