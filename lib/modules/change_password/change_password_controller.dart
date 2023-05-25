
import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/data/repositories/user_repository.dart';
import 'package:coza_app/data/repositories/user_repository.dart';
import 'package:coza_app/models/change_password/ChangePasswordResponse.dart';
import 'package:coza_app/models/change_password/ChangePasswordResponse.dart';
import 'package:coza_app/modules/bottom_nav/bottom_dart.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/change_password/ChangePassword.dart';
import '../login/login_screen.dart';


class ChangePasswordController extends GetxController {
  final UserRepository _userRepository = UserRepository();
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

    ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
        oldPassword: resetTokenController.text.trim(),
        newPassword: passwordController.text.trim());

    print(changePasswordRequest);

    try {
      Response response =
          await _userRepository.changePassword(changePasswordRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var message = ChangePasswordResponse.fromJson(response.body).message;

        resetTokenController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        isLoading.value = false;

        showSnackBar(
            title: "Password Changed Successful",
            message: message,
            type: 'success');
        Get.offAll(BottomNav());

        update();
      } else {
        isLoading.value = false;
        var message =
            ChangePasswordResponse.fromJson(response.body).message.toString();

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
