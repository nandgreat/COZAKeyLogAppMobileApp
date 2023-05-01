import 'package:coza_app/models/login/LoginRequest.dart';
import 'package:coza_app/utils/endpoints.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class AuthRepository extends GetxService {
  ApiClient apiClient = ApiClient(appbaseurl: Endpoints.BASE_URL);

  Future<Response> login(LoginRequest body) async {
    String url = Endpoints.LOGIN;
    return apiClient.postRequest(url: url, data: body.toJson());
  }
}
