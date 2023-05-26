import 'Addresses.dart';

class EditProfileRequest {
  EditProfileRequest({
    this.firstName,
    this.lastName,
    this.phone,
    this.campus,
    this.isMember,
    this.profilePicture,
    this.maritalStatus,
    this.sex,
    this.occupation,
    this.addresses,
  });

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    campus = json['campus'];
    isMember = json['isMember'];
    profilePicture = json['profilePicture'];
    maritalStatus = json['maritalStatus'];
    sex = json['sex'];
    occupation = json['occupation'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }

  String? firstName;
  String? lastName;
  String? phone;
  String? campus;
  bool? isMember;
  String? profilePicture;
  String? maritalStatus;
  String? sex;
  String? occupation;
  List<Addresses?>? addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phone'] = phone;
    map['campus'] = campus;
    map['isMember'] = isMember;
    map['profilePicture'] = profilePicture;
    map['maritalStatus'] = maritalStatus;
    map['sex'] = sex;
    map['occupation'] = occupation;
    if (addresses != null) {
      map['addresses'] = addresses!.map((v) => v!.toJson()).toList();
    }
    return map;
  }
}
