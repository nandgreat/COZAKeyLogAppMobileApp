class SignupRequest {
  SignupRequest({
      this.firstName, 
      this.lastName, 
      this.username, 
      this.password, 
      this.country, 
      this.email, 
      this.referredBy, 
      this.phone,});

  SignupRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    country = json['country'];
    email = json['email'];
    referredBy = json['referred_by'];
    phone = json['phone'];
  }
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? country;
  String? email;
  String? referredBy;
  int? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['username'] = username;
    map['password'] = password;
    map['country'] = country;
    map['email'] = email;
    map['referred_by'] = referredBy;
    map['phone'] = phone;
    return map;
  }

}