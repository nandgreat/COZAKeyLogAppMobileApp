class ResetPasswordRequest {
  ResetPasswordRequest({
      this.token, 
      this.password,});

  ResetPasswordRequest.fromJson(dynamic json) {
    token = json['token'];
    password = json['password'];
  }
  String? token;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['password'] = password;
    return map;
  }

}