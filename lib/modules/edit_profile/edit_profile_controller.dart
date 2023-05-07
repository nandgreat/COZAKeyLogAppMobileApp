import 'dart:convert';

import 'package:coza_app/controllers/connection_manager_controller.dart';
import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/models/login/LoginRequest.dart';
import 'package:coza_app/models/login/LoginResponse.dart';
import 'package:coza_app/modules/bottom_nav/bottom_dart.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:coza_app/utils/local_storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_screen.dart';

class EditProfileController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  Rx<User?> user = User().obs;
  LocalStorageHelper localStorageHelper = LocalStorageHelper();
  var isLoading = false.obs;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var occupationController = TextEditingController();
  var maritalStatusController = TextEditingController();
  var phoneController = TextEditingController();
  var genderController = TextEditingController();

  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  Future<void> getUser() async {
    user.value = await localStorageHelper.getUser();
    logItem("±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±");
    firstNameController.text = user.value!.firstName!;
    lastNameController.text = user.value!.lastName!;
    emailController.text = user.value!.email!;
    phoneController.text = user.value!.phone!;
    logItem(user.value!.firstName);
  }

  Future<void> login() async {
    RxInt idFromFirstController = connectionManagerController.connectionType;

    if (idFromFirstController.value == 0) {
      showNoInternetSnackBar();
      return;
    }

    isLoading.value = true;

    LoginRequest loginRequest = LoginRequest(
        id: emailController.text.trim(),
        password: firstNameController.text.trim());

    print(loginRequest);

    try {
      Response response = await _authRepository.login(loginRequest);

      // ignore: unrelated_type_equality_checks
      if (response.isOk) {
        var user = LoginResponse.fromJson(response.body).data?.user;
        String userString = jsonEncode(user);

        LocalStorageHelper localStorageHelper = LocalStorageHelper();
        await localStorageHelper.storeItem(key: "user", value: userString);

        emailController.clear();
        print(user);
        isLoading.value = false;

        Get.offAll(BottomNav());

        update();
      } else {
        isLoading.value = false;
        var message = LoginResponse.fromJson(response.body).message.toString();

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
