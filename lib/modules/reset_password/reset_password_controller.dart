
import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/models/reset_password/ResetPasswordRequest.dart';
import 'package:coza_app/models/reset_password/ResetPasswordResponse.dart';
import 'package:coza_app/modules/bottom_nav/bottom_dart.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_screen.dart';


class ResetPasswordController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  var resetTokenController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> resetPassword() async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    logItem("HHHHHHHHHHHHHHHHHHHHHHHHHH");
    logItem(formKey.currentState!.validate());
    if (!formKey.currentState!.validate()) return;

    logItem("HHHHHHHHHHHHHHHHHHHHHHHHHH");

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(
        token: resetTokenController.text.trim(),
        password: passwordController.text.trim());

    print(resetPasswordRequest);

    try {
      Response response =
          await _authRepository.resetPassword(resetPasswordRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var message = ResetPasswordResponse.fromJson(response.body).message;

        resetTokenController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        isLoading.value = false;

        showSnackBar(
            title: "Password Reset Successful",
            message: message,
            type: 'success');
        Get.offAll(const LoginScreen());

        update();
      } else {
        isLoading.value = false;
        var message =
            ResetPasswordResponse.fromJson(response.body).message.toString();

        showSnackBar(title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  String? validatePassword(String confirmPassword) {

    if(confirmPassword.isEmpty) return "Confirm Password is required";

    if(passwordController.text.isNotEmpty && confirmPassword != passwordController.text) {
      return "Confirm Password does not match";
    }
    return null;
  }
}
