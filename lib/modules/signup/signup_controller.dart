import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/signup/SignupRequest.dart';
import '../../models/signup/SignupResponse.dart';
import '../verify_otp/verify_otp.dart';

class SignupController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var countryController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> signup() async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    String phoneNumber = phoneController.text.toString().trim();

    String newPhone = phoneNumber.startsWith("0")
        ? phoneNumber.substring(1)
        : phoneNumber;

    SignupRequest signupRequest = SignupRequest(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username: usernameController.text.trim(),
        phone: int.parse(newPhone),
        email: emailController.text.trim(),
        country: countryController.text.trim(),
        password: passwordController.text.trim());

    logItem("WWWWWWWWWWWWWWWWWWWWWWWWW");
    logItem(newPhone);

    try {
      Response response = await _authRepository.signup(signupRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var message = SignupResponse.fromJson(response.body).message;

        firstNameController.clear();
        lastNameController.clear();
        usernameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();

        isLoading.value = false;

        showSnackBar(
            title: "Register Success", message: message, type: 'success');

        Get.to(() => const VerifyOtpScreen(), arguments: [
          {'phone_number': newPhone}
        ]);
      } else {
        isLoading.value = false;
        var message = SignupResponse.fromJson(response.body).message.toString();

        showSnackBar(title: "Error", message: message, type: 'error');
      }
    } catch (e) {
      isLoading.value = false;

      logItem(e);

      showSnackBar(
          title: "Error", message: "Unexpected Error occurred", type: 'error');
    }
  }

  void validateEmailInput() {}
}
