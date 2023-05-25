class ChangePasswordRequest {
  ChangePasswordRequest({
      this.oldPassword, 
      this.newPassword,});

  ChangePasswordRequest.fromJson(dynamic json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
  }
  String? oldPassword;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    return map;
  }

}