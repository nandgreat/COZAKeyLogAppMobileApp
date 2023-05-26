/// status : "success"
/// message : "Profile update successful"
/// data : {"user":{"country":"Anguilla","language":"Language","deviceToken":[],"roles":["644c3688e04292a45c0e6d48"],"isActive":true,"isMember":false,"isSuspended":false,"isDeleted":false,"notificationCounter":1,"profilePicture":"http://placeimg.com/640/480","_id":"6468d20bbbc1ac1090235176","firstName":"Madeline","lastName":"Leffler","email":"kwislawrencekwis@gmail.com","phone":"+234387-829-4181","username":"jayde.blanda93","activationCode":null,"activationExpiresIn":null,"createdAt":"2023-05-20T13:58:35.182Z","updatedAt":"2023-05-20T14:41:21.546Z","address":[],"id":"6468d20bbbc1ac1090235176"}}

class UploadProfileResponse {
  UploadProfileResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UploadProfileResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
UploadProfileResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => UploadProfileResponse(  status: status ?? _status,
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

class User {
  User({
      String? country, 
      String? language, 
      List<dynamic>? deviceToken, 
      List<String>? roles, 
      bool? isActive, 
      bool? isMember, 
      bool? isSuspended, 
      bool? isDeleted, 
      num? notificationCounter, 
      String? profilePicture, 
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? username, 
      dynamic activationCode, 
      dynamic activationExpiresIn, 
      String? createdAt, 
      String? updatedAt, 
      List<dynamic>? address}){
    _country = country;
    _language = language;
    _deviceToken = deviceToken;
    _roles = roles;
    _isActive = isActive;
    _isMember = isMember;
    _isSuspended = isSuspended;
    _isDeleted = isDeleted;
    _notificationCounter = notificationCounter;
    _profilePicture = profilePicture;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _username = username;
    _activationCode = activationCode;
    _activationExpiresIn = activationExpiresIn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _address = address;
    _id = id;
}

  User.fromJson(dynamic json) {
    _country = json['country'];
    _language = json['language'];
    if (json['deviceToken'] != null) {
      _deviceToken = [];
      json['deviceToken'].forEach((v) {
        _deviceToken?.add(v);
      });
    }
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _isActive = json['isActive'];
    _isMember = json['isMember'];
    _isSuspended = json['isSuspended'];
    _isDeleted = json['isDeleted'];
    _notificationCounter = json['notificationCounter'];
    _profilePicture = json['profilePicture'];
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phone'];
    _username = json['username'];
    _activationCode = json['activationCode'];
    _activationExpiresIn = json['activationExpiresIn'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['address'] != null) {
      _address = [];
      json['address'].forEach((v) {
        _address?.add(v);
      });
    }
    _id = json['id'];
  }
  String? _country;
  String? _language;
  List<dynamic>? _deviceToken;
  List<String>? _roles;
  bool? _isActive;
  bool? _isMember;
  bool? _isSuspended;
  bool? _isDeleted;
  num? _notificationCounter;
  String? _profilePicture;
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _username;
  dynamic _activationCode;
  dynamic _activationExpiresIn;
  String? _createdAt;
  String? _updatedAt;
  List<dynamic>? _address;

  User copyWith({  String? country,
  String? language,
  List<dynamic>? deviceToken,
  List<String>? roles,
  bool? isActive,
  bool? isMember,
  bool? isSuspended,
  bool? isDeleted,
  num? notificationCounter,
  String? profilePicture,
  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? username,
  dynamic activationCode,
  dynamic activationExpiresIn,
  String? createdAt,
  String? updatedAt,
  List<dynamic>? address,
}) => User(  country: country ?? _country,
  language: language ?? _language,
  deviceToken: deviceToken ?? _deviceToken,
  roles: roles ?? _roles,
  isActive: isActive ?? _isActive,
  isMember: isMember ?? _isMember,
  isSuspended: isSuspended ?? _isSuspended,
  isDeleted: isDeleted ?? _isDeleted,
  notificationCounter: notificationCounter ?? _notificationCounter,
  profilePicture: profilePicture ?? _profilePicture,
  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  username: username ?? _username,
  activationCode: activationCode ?? _activationCode,
  activationExpiresIn: activationExpiresIn ?? _activationExpiresIn,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  address: address ?? _address,
);
  String? get country => _country;
  String? get language => _language;
  List<dynamic>? get deviceToken => _deviceToken;
  List<String>? get roles => _roles;
  bool? get isActive => _isActive;
  bool? get isMember => _isMember;
  bool? get isSuspended => _isSuspended;
  bool? get isDeleted => _isDeleted;
  num? get notificationCounter => _notificationCounter;
  String? get profilePicture => _profilePicture;
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get username => _username;
  dynamic get activationCode => _activationCode;
  dynamic get activationExpiresIn => _activationExpiresIn;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<dynamic>? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['language'] = _language;
    if (_deviceToken != null) {
      map['deviceToken'] = _deviceToken?.map((v) => v.toJson()).toList();
    }
    map['roles'] = _roles;
    map['isActive'] = _isActive;
    map['isMember'] = _isMember;
    map['isSuspended'] = _isSuspended;
    map['isDeleted'] = _isDeleted;
    map['notificationCounter'] = _notificationCounter;
    map['profilePicture'] = _profilePicture;
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['username'] = _username;
    map['activationCode'] = _activationCode;
    map['activationExpiresIn'] = _activationExpiresIn;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_address != null) {
      map['address'] = _address?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    return map;
  }

}