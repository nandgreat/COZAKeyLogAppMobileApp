import 'dart:convert';

import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/models/login/LoginRequest.dart';
import 'package:coza_app/models/login/LoginResponse.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:coza_app/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/signup/SignupRequest.dart';
import '../../models/signup/SignupResponse.dart';
import '../home/home_screen.dart';
import '../verify_otp/verify_otp.dart';

class VerifyOtpController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var isLoading = false.obs;

  var otpController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> verifyOtp(String otp) async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    try {
      Response response = await _authRepository.verifyOtp(otp);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var user = LoginResponse
            .fromJson(response.body)
            .data
            ?.user;
        var message = LoginResponse
            .fromJson(response.body)
            .message;
        String userString = jsonEncode(user);

        LocalStorageHelper localStorageHelper = LocalStorageHelper();
        await localStorageHelper.storeItem(key: "user", value: userString);

        otpController.clear();
        print(user);
        isLoading.value = false;
        showSnackBar(
            title: "Verification Success", message: message, type: 'success');

        Get.to(HomeScreen());

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

  void validateInput() {}
}
