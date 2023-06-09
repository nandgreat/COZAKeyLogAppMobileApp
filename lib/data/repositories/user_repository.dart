import 'dart:io';

import 'package:coza_app/utils/endpoints.dart';
import 'package:coza_app/utils/helpers.dart';
import 'package:get/get.dart';

import '../../models/change_password/ChangePassword.dart';
import '../api/api_client.dart';

class UserRepository extends GetxService {
  ApiClient apiClient = ApiClient(appbaseurl: Endpoints.BASE_URL);

  Future<Response> uploadImage(dynamic data) async {
    String url = Endpoints.UPLOAD_IMAGE;

    var convertedFiled = fileToBytes(data);
    return apiClient.postUploadRequest(url: url, image: convertedFiled);
  }


  Future<Response> changePassword(ChangePasswordRequest changePasswordRequest) async {
    String url = Endpoints.CHANGE_PASSWORD;
    return apiClient.putRequest(url: url, data: changePasswordRequest.toJson());
  }

  Future<Response> updateProfile(dynamic data) async {
    String url = Endpoints.UPDATE_PROFILE;

    logItem("YYYYYYYYYYYYYYYYYYYYYYYYYYY");
    logItem(data);
    return apiClient.putRequest(url: url, data: data.toJson());
  }

  List<int> fileToBytes(dynamic data) {
    if (data is File) {
      return data.readAsBytesSync();
    } else if (data is String) {
      if (File(data).existsSync()) {
        return File(data).readAsBytesSync();
      } else {
        throw 'File $data not exists';
      }
    } else if (data is List<int>) {
      return data;
    } else {
      throw const FormatException(
          'File is not "File" or "String" or "List<int>"');
    }
  }
}
