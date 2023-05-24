import 'package:coza_app/models/login/User.dart';
import 'package:coza_app/utils/helpers.dart';

/// status : "success"
/// message : "Account verification successful"
/// data : {"user":{"device_token":["slkdljskjflsf"],"roles":[{"_id":"644c3688e04292a45c0e6d48","name":"member","__v":0,"createdAt":"2023-04-28T21:11:36.464Z","updatedAt":"2023-04-28T21:11:36.464Z"}],"isActive":true,"isSuspended":false,"isDeleted":false,"_id":"644dc8115edae00014ddd6e6","firstName":"Efemena","lastName":"Alex","country":"Nigeria","email":"paulflexy@yahoo.com","phone":"9029962906","username":"efemena","activation_code":null,"activation_expires_in":null,"createdAt":"2023-04-30T01:44:49.049Z","updatedAt":"2023-04-30T02:06:07.339Z","id":"644dc8115edae00014ddd6e6"},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NGRjODExNWVkYWUwMDAxNGRkZDZlNiIsImVtYWlsIjoicGF1bGZsZXh5QHlhaG9vLmNvbSIsInJvbGVzIjpbeyJfaWQiOiI2NDRjMzY4OGUwNDI5MmE0NWMwZTZkNDgiLCJuYW1lIjoibWVtYmVyIiwiY3JlYXRlZEF0IjoiMjAyMy0wNC0yOFQyMToxMTozNi40NjRaIiwidXBkYXRlZEF0IjoiMjAyMy0wNC0yOFQyMToxMTozNi40NjRaIn1dLCJpYXQiOjE2ODI4MjAzNjcsImV4cCI6MTY4NTQxMjM2N30.MELnjODAk0F4zzqvu_uIqJywWI1uEW_u1OdQaCmaAIQ","expires_in":2592000}

class LoginResponse {
  LoginResponse({
    String? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  LoginResponse.fromJson(dynamic json) {
    logItem("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
    logItem(json['status']);
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _status;
  String? _message;
  Data? _data;

  LoginResponse copyWith({
    String? status,
    String? message,
    Data? data,
  }) =>
      LoginResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// user : {"device_token":["slkdljskjflsf"],"roles":[{"_id":"644c3688e04292a45c0e6d48","name":"member","__v":0,"createdAt":"2023-04-28T21:11:36.464Z","updatedAt":"2023-04-28T21:11:36.464Z"}],"isActive":true,"isSuspended":false,"isDeleted":false,"_id":"644dc8115edae00014ddd6e6","firstName":"Efemena","lastName":"Alex","country":"Nigeria","email":"paulflexy@yahoo.com","phone":"9029962906","username":"efemena","activation_code":null,"activation_expires_in":null,"createdAt":"2023-04-30T01:44:49.049Z","updatedAt":"2023-04-30T02:06:07.339Z","id":"644dc8115edae00014ddd6e6"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NGRjODExNWVkYWUwMDAxNGRkZDZlNiIsImVtYWlsIjoicGF1bGZsZXh5QHlhaG9vLmNvbSIsInJvbGVzIjpbeyJfaWQiOiI2NDRjMzY4OGUwNDI5MmE0NWMwZTZkNDgiLCJuYW1lIjoibWVtYmVyIiwiY3JlYXRlZEF0IjoiMjAyMy0wNC0yOFQyMToxMTozNi40NjRaIiwidXBkYXRlZEF0IjoiMjAyMy0wNC0yOFQyMToxMTozNi40NjRaIn1dLCJpYXQiOjE2ODI4MjAzNjcsImV4cCI6MTY4NTQxMjM2N30.MELnjODAk0F4zzqvu_uIqJywWI1uEW_u1OdQaCmaAIQ"
/// expires_in : 2592000

class Data {
  Data({
    User? user,
    String? token,
    num? expiresIn,}) {
    _user = user;
    _token = token;
    _expiresIn = expiresIn;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _expiresIn = json['expires_in'];
  }

  User? _user;
  String? _token;
  num? _expiresIn;

  Data copyWith({ User? user,
    String? token,
    num? expiresIn,
  }) =>
      Data(user: user ?? _user,
        token: token ?? _token,
        expiresIn: expiresIn ?? _expiresIn,
      );

  User? get user => _user;

  String? get token => _token;

  num? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['expires_in'] = _expiresIn;
    return map;
  }

}