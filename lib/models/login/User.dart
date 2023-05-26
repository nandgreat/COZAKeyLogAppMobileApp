import 'Roles.dart';

class User {
  User({
      this.country, 
      this.language, 
      this.deviceToken, 
      this.roles, 
      this.isActive, 
      this.isMember, 
      this.isSuspended, 
      this.isDeleted, 
      this.notificationCounter, 
      this.profilePicture, 
      this.id, 
      this.email, 
      this.phone, 
      this.username, 
      this.createdAt, 
      this.updatedAt, 
      this.activationCode, 
      this.activationExpiresIn, 
      this.firstName, 
      this.lastName, 
      this.address
  });

  User.fromJson(dynamic json) {
    country = json['country'];
    language = json['language'];
    if (json['deviceToken'] != null) {
      deviceToken = [];
      json['deviceToken'].forEach((v) {
        deviceToken!.add(v);
      });
    }
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    isActive = json['isActive'];
    isMember = json['isMember'];
    isSuspended = json['isSuspended'];
    isDeleted = json['isDeleted'];
    notificationCounter = json['notificationCounter'];
    profilePicture = json['profilePicture'];
    id = json['_id'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    activationCode = json['activationCode'];
    activationExpiresIn = json['activationExpiresIn'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    if (json['address'] != null) {
      address = [];
      json['address'].forEach((v) {
        address?.add(v);
      });
    }
    id = json['id'];
  }
  String? country;
  String? language;
  List<dynamic>? deviceToken;
  List<Roles?>? roles;
  bool? isActive;
  bool? isMember;
  bool? isSuspended;
  bool? isDeleted;
  int? notificationCounter;
  String? profilePicture;
  String? id;
  String? email;
  String? phone;
  String? username;
  String? createdAt;
  String? updatedAt;
  dynamic activationCode;
  dynamic activationExpiresIn;
  String? firstName;
  String? lastName;
  List<dynamic?>? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['language'] = language;
    if (deviceToken != null) {
      map['deviceToken'] = deviceToken?.map((v) => v.toJson()).toList();
    }
    if (roles != null) {
      map['roles'] = roles!.map((v) => v?.toJson()).toList();
    }
    map['isActive'] = isActive;
    map['isMember'] = isMember;
    map['isSuspended'] = isSuspended;
    map['isDeleted'] = isDeleted;
    map['notificationCounter'] = notificationCounter;
    map['profilePicture'] = profilePicture;
    map['_id'] = id;
    map['email'] = email;
    map['phone'] = phone;
    map['username'] = username;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['activationCode'] = activationCode;
    map['activationExpiresIn'] = activationExpiresIn;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    if (address != null) {
      map['address'] = address?.map((v) => v?.toJson()).toList();
    }
    map['id'] = id;
    return map;
  }

}