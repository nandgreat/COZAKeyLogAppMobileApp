import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/models/forgot_password/PasswordRequest.dart';
import 'package:coza_app/models/forgot_password/PasswordResponse.dart';
import 'package:coza_app/modules/verify_otp/verify_otp.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reset_password/reset_password_screen.dart';


class ForgotPasswordController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  var emailController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> passwordRequest() async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    PasswordRequest passwordRequest = PasswordRequest( email: emailController.text.trim());

    try {
      Response response = await _authRepository.forgotPassword(passwordRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var message = PasswordResponse.fromJson(response.body).message;

        isLoading.value = false;

        emailController.clear();
        showSnackBar(title: "Success", message: message, type: 'success');

        Get.to(const ResetPasswordScreen());

      } else {
        isLoading.value = false;
        var message = PasswordResponse.fromJson(response.body).message.toString();

        showSnackBar(title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  void validateInput() {}
}
