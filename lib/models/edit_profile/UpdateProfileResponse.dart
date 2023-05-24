import '../login/LoginResponse.dart';
import '../login/User.dart';

/// status : "success"
/// message : "Profile update successful"
/// data : {"user":{"country":"Anguilla","language":"Language","deviceToken":[],"roles":["644c3688e04292a45c0e6d48"],"isActive":true,"isMember":false,"isSuspended":false,"isDeleted":false,"notificationCounter":1,"profilePicture":"http://placeimg.com/640/480","_id":"6468d20bbbc1ac1090235176","firstName":"Madeline","lastName":"Leffler","email":"kwislawrencekwis@gmail.com","phone":"+234387-829-4181","username":"jayde.blanda93","activationCode":null,"activationExpiresIn":null,"createdAt":"2023-05-20T13:58:35.182Z","updatedAt":"2023-05-20T14:41:21.546Z","address":[],"id":"6468d20bbbc1ac1090235176"}}

class UpdateProfileResponse {
  UpdateProfileResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UpdateProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
UpdateProfileResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => UpdateProfileResponse(  status: status ?? _status,
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

/// user : {"country":"Anguilla","language":"Language","deviceToken":[],"roles":["644c3688e04292a45c0e6d48"],"isActive":true,"isMember":false,"isSuspended":false,"isDeleted":false,"notificationCounter":1,"profilePicture":"http://placeimg.com/640/480","_id":"6468d20bbbc1ac1090235176","firstName":"Madeline","lastName":"Leffler","email":"kwislawrencekwis@gmail.com","phone":"+234387-829-4181","username":"jayde.blanda93","activationCode":null,"activationExpiresIn":null,"createdAt":"2023-05-20T13:58:35.182Z","updatedAt":"2023-05-20T14:41:21.546Z","address":[],"id":"6468d20bbbc1ac1090235176"}

class Data {
  Data({
      User? user,}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
Data copyWith({  User? user,
}) => Data(  user: user ?? _user,
);
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// country : "Anguilla"
/// language : "Language"
/// deviceToken : []
/// roles : ["644c3688e04292a45c0e6d48"]
/// isActive : true
/// isMember : false
/// isSuspended : false
/// isDeleted : false
/// notificationCounter : 1
/// profilePicture : "http://placeimg.com/640/480"
/// _id : "6468d20bbbc1ac1090235176"
/// firstName : "Madeline"
/// lastName : "Leffler"
/// email : "kwislawrencekwis@gmail.com"
/// phone : "+234387-829-4181"
/// username : "jayde.blanda93"
/// activationCode : null
/// activationExpiresIn : null
/// createdAt : "2023-05-20T13:58:35.182Z"
/// updatedAt : "2023-05-20T14:41:21.546Z"
/// address : []
/// id : "6468d20bbbc1ac1090235176"
