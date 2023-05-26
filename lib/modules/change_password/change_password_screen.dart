import 'package:coza_app/components/base_screen.dart';
import 'package:coza_app/components/custom_button.dart';
import 'package:coza_app/modules/change_password/change_password_controller.dart';
import 'package:coza_app/modules/change_password/change_password_controller.dart';
import 'package:coza_app/modules/reset_password/reset_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../utils/helpers.dart';

import '../../components/custom_text_input.dart';
import '../../res/color_palette.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final ChangePasswordController _changePasswordController = Get.put(
      ChangePasswordController());

  handleResetPassword() {

  }

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
                key: _changePasswordController.formKey,
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
                        "Change\nPassword",
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
                  hintText: 'Enter Current Password',
                  label: "Current Password",
                  obscureText: true,
                  togglePassword: true,
                  controller: _changePasswordController.resetTokenController,
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
                  controller: _changePasswordController.passwordController,
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
                    controller: _changePasswordController.confirmPasswordController,
                    functionValidate: _changePasswordController.validatePassword,
                    prefixIcon: const Icon(CupertinoIcons.lock),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Obx(() => CustomButton(
                  label: "Submit", isLoading: _changePasswordController.isLoading.value,
                  onPressed: _changePasswordController.resetPassword))
              ],
            ),
          ),
        ),
      ),
    ),)
    ,
    );
  }
}
