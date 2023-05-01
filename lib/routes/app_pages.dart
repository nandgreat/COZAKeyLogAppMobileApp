import 'package:coza_app/modules/home/home_screen.dart';
import 'package:coza_app/modules/login/login_screen.dart';
import 'package:coza_app/modules/signup/signup_screen.dart';
import 'package:get/get.dart';

import '../controllers/controller_binding.dart';
import '../modules/home/home_bindings.dart';
import '../modules/login/login_bindings.dart';
import '../modules/signup/signup_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
  ];
}
