import 'package:coza_app/utils/endpoints.dart';
import 'package:get/get.dart';

import '../../utils/local_storage_helper.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token = Endpoints.BASE_URL;
  late String appbaseurl;
  late Map<String, String> _mainHeader;

  ApiClient({required String appbaseurl}) {
    baseUrl = appbaseurl;

    timeout = const Duration(seconds: 30);
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

// POST METHOD
  Future<Response> getRequest({
    required String url,
  }) async {
    try {
      Response response;
      // The below request is the same as above.
      response = await get(url);
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response> postRequest(
      {required String url, required Map<dynamic, dynamic> data}) async {
    try {
      Response response;
      // The below request is the same as above.
      print("--------------------------------------");
      print(data);
      response = await post(url, data);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response> postUploadRequest(
      {required String url, required List<int> image}) async {
    try {
      final form = FormData({
        'file': MultipartFile(image, filename: 'avatar.png'),
      });

      Response response;
      // The below request is the same as above.
      response = await post(url, form);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response> putRequest(
      {required String url, required Map<dynamic, dynamic> data}) async {
    try {
      Response response;
      // The below request is the same as above.
      LocalStorageHelper localStorageHelper = LocalStorageHelper();

      var token = await localStorageHelper.retrieveItem(key: "token");

      _mainHeader = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${token}",
      };

      print("--------------------------------------");
      print(baseUrl);
      print(url);
      print(_mainHeader);
      print(data);

      response = await put(url, data, headers: _mainHeader);
      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}

// // GET METHOD
// Future<Response> getRequest({
//   required String uri,
// }) async {
//   try {
//     Response response = await get(uri);
//     return response;
//   } catch (e) {
//     print(e.toString());
//     return Response(statusCode: 1, statusText: e.toString());
//   }
// }
