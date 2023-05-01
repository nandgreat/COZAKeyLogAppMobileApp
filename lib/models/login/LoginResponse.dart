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

/// device_token : ["lskdjjlskdfjlksjdfs"]
/// roles : [{"_id":"6439c5042ca98b2ddba21e40","name":"member"}]
/// isActive : true
/// isSuspended : false
/// isDeleted : false
/// _id : "6439c98c1cf54c3c8bd81c35"
/// firstName : "Darrin"
/// lastName : "Kling"
/// country : "Grenada"
/// email : "kwislawrencekwis@gmail.com"
/// phone : "7042380581"
/// username : "boris68"
/// activation_code : null
/// activation_expires_in : null
/// createdAt : "2023-04-14T21:45:48.476Z"
/// updatedAt : "2023-04-14T22:08:13.110Z"
/// id : "6439c98c1cf54c3c8bd81c35"

class User {
  User({
    List<String>? deviceToken,
    List<Roles>? roles,
    bool? isActive,
    bool? isSuspended,
    bool? isDeleted,
    String? id,
    String? firstName,
    String? lastName,
    String? country,
    String? email,
    String? phone,
    String? username,
    dynamic activationCode,
    dynamic activationExpiresIn,
    String? createdAt,
    String? updatedAt}) {
    _deviceToken = deviceToken;
    _roles = roles;
    _isActive = isActive;
    _isSuspended = isSuspended;
    _isDeleted = isDeleted;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _country = country;
    _email = email;
    _phone = phone;
    _username = username;
    _activationCode = activationCode;
    _activationExpiresIn = activationExpiresIn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _id = id;
  }

  User.fromJson(dynamic json) {
    logItem("*******************************************");
    logItem(json['isActive']);
    _deviceToken =
    json['deviceToken'] != null ? json['deviceToken'].cast<String>() : [];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles?.add(Roles.fromJson(v));
      });
    }
    _isActive = json['isActive'];
    _isSuspended = json['isSuspended'];
    _isDeleted = json['isDeleted'];
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _activationCode = json['activation_code'];
    _activationExpiresIn = json['activation_expires_in'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _id = json['id'];
  }

  List<String>? _deviceToken;
  List<Roles>? _roles;
  bool? _isActive;
  bool? _isSuspended;
  bool? _isDeleted;
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _country;
  String? _email;
  String? _phone;
  String? _username;
  dynamic _activationCode;
  dynamic _activationExpiresIn;
  String? _createdAt;
  String? _updatedAt;

  User copyWith({ List<String>? deviceToken,
    List<Roles>? roles,
    bool? isActive,
    bool? isSuspended,
    bool? isDeleted,
    String? id,
    String? firstName,
    String? lastName,
    String? country,
    String? email,
    String? phone,
    String? username,
    dynamic activationCode,
    dynamic activationExpiresIn,
    String? createdAt,
    String? updatedAt,
  }) =>
      User(
        deviceToken: deviceToken ?? _deviceToken,
        roles: roles ?? _roles,
        isActive: isActive ?? _isActive,
        isSuspended: isSuspended ?? _isSuspended,
        isDeleted: isDeleted ?? _isDeleted,
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        country: country ?? _country,
        email: email ?? _email,
        phone: phone ?? _phone,
        username: username ?? _username,
        activationCode: activationCode ?? _activationCode,
        activationExpiresIn: activationExpiresIn ?? _activationExpiresIn,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  List<String>? get deviceToken => _deviceToken;

  List<Roles>? get roles => _roles;

  bool? get isActive => _isActive;

  bool? get isSuspended => _isSuspended;

  bool? get isDeleted => _isDeleted;

  String? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get country => _country;

  String? get email => _email;

  String? get phone => _phone;

  String? get username => _username;

  dynamic get activationCode => _activationCode;

  dynamic get activationExpiresIn => _activationExpiresIn;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['device_token'] = _deviceToken;
    if (_roles != null) {
      map['roles'] = _roles?.map((v) => v.toJson()).toList();
    }
    map['isActive'] = _isActive;
    map['isSuspended'] = _isSuspended;
    map['isDeleted'] = _isDeleted;
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    map['username'] = _username;
    map['activation_code'] = _activationCode;
    map['activation_expires_in'] = _activationExpiresIn;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['id'] = _id;
    return map;
  }

}

/// _id : "6439c5042ca98b2ddba21e40"
/// name : "member"

class Roles {
  Roles({
    String? id,
    String? name,}) {
    _id = id;
    _name = name;
  }

  Roles.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
  }

  String? _id;
  String? _name;

  Roles copyWith({ String? id,
    String? name,
  }) =>
      Roles(id: id ?? _id,
        name: name ?? _name,
      );

  String? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    return map;
  }
}
