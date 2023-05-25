import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/reset_password/reset_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../utils/helpers.dart';

import '../../components/custom_text_input.dart';
import '../../res/color_palette.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ResetPasswordController _resetPasswordController =
      Get.put(ResetPasswordController());

  handleResetPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BaseScreen(
          child: SingleChildScrollView(
            child: SizedBox(
              height: deviceHeight(context),
              child: Form(
                key: _resetPasswordController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80.0,
                    ),
                    SizedBox(
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
                    CustomTextField(
                      hintText: 'Enter Reset Token',
                      label: "Reset Token",
                      controller: _resetPasswordController.resetTokenController,
                      textInputType: TextInputType.number,
                      prefixIcon: const Icon(CupertinoIcons.lock),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      hintText: 'New Password',
                      label: "New Password",
                      obscureText: true,
                      togglePassword: true,
                      controller: _resetPasswordController.passwordController,
                      prefixIcon: const Icon(CupertinoIcons.lock),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      label: "Confirm Password",
                      obscureText: true,
                      togglePassword: true,
                      controller:
                          _resetPasswordController.confirmPasswordController,
                      functionValidate:
                          _resetPasswordController.validatePassword,
                      prefixIcon: const Icon(CupertinoIcons.lock),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Obx(() => CustomButton(
                        label: "Submit",
                        isLoading: _resetPasswordController.isLoading.value,
                        onPressed: _resetPasswordController.resetPassword))
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
