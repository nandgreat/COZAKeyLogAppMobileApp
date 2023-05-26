import 'package:coza_app/data/repositories/auth.dart';
import 'package:coza_app/models/login/LoginRequest.dart';
import 'package:coza_app/models/login/LoginResponse.dart';
import 'package:coza_app/modules/login/login_screen.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:get/get.dart';

import '../../models/login/User.dart';
import '../../utils/local_storage_helper.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  Rx<User?> user = User().obs;
  bool isLoading = false;
  LocalStorageHelper localStorageHelper = LocalStorageHelper();

  Future<void> getUser() async {
    user.value = await localStorageHelper.getUser();
    logItem("±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±");
    logItem(user.value!.profilePicture);
  }

  Future<void> logout() async {
    await localStorageHelper.clearAll();
    Get.offAll(const LoginScreen());
  }
}
