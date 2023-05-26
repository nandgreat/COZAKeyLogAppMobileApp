import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

showSnackBar({required title, required message, required type}) {
  var color = type == "error"
      ? Colors.red
      : (type == "success" ? Colors.green : Colors.blue);
  Get.snackbar(title, message, backgroundColor: color, colorText: Colors.white);
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

String replaceCharAt(String oldString, int index, String newChar) {
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}

logItem(item) {
  if (kDebugMode) {
    print(item);
  }
}


String? validateEmailInput(String email) {

  if(email.isEmpty) return "Email is required";

  if(!isEmailValid(email)) {
    return "Enter a valid email address";
  }
  return null;
}

bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

showNoInternetSnackBar() {
  showSnackBar(
      title: "Network Error", message: "No Internet Connection", type: 'error');
}
