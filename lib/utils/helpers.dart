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

logItem(item) {
  if (kDebugMode) {
    print(item);
  }
}

showNoInternetSnackBar() {
  showSnackBar(
      title: "Network Error", message: "No Internet Connection", type: 'error');
}
