import 'package:coza_app/models/forgot_password/PasswordRequest.dart';
import 'package:coza_app/models/login/LoginRequest.dart';
import 'package:coza_app/models/signup/SignupRequest.dart';
import 'package:coza_app/utils/endpoints.dart';
import 'package:get/get.dart';

import '../../models/reset_password/ResetPasswordRequest.dart';
import '../api/api_client.dart';

class AuthRepository extends GetxService {
  ApiClient apiClient = ApiClient(appbaseurl: Endpoints.BASE_URL);

  Future<Response> login(LoginRequest body) async {
    String url = Endpoints.LOGIN;
    return apiClient.postRequest(url: url, data: body.toJson());
  }
  Future<Response> signup(SignupRequest body) async {
    String url = Endpoints.REGISTER;
    return apiClient.postRequest(url: url, data: body.toJson());
  }
  Future<Response> verifyOtp(String otp) async {
    String url = Endpoints.VERIFY_OTP;
    return apiClient.get("$url$otp");
  }
  Future<Response> forgotPassword(PasswordRequest passwordRequest) async {
    String url = Endpoints.PASSWORD_REQUEST;
    return apiClient.postRequest(url: url, data: passwordRequest.toJson());
  }
  Future<Response> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    String url = Endpoints.RESET_PASSWORD;
    return apiClient.putRequest(url: url, data: resetPasswordRequest.toJson());
  }
}
