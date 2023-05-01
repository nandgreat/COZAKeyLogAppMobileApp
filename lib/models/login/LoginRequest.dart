/// id : "kwislawrencekwis@gmail.com"
/// password : "Password24"

class LoginRequest {
  LoginRequest({
    String? id,
    String? password,
  }) {
    _id = id;
    _password = password;
  }

  LoginRequest.fromJson(dynamic json) {
    _id = json['id'];
    _password = json['password'];
  }

  String? _id;
  String? _password;

  LoginRequest copyWith({
    String? id,
    String? password,
  }) =>
      LoginRequest(
        id: id ?? _id,
        password: password ?? _password,
      );

  String? get id => _id;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['password'] = _password;
    return map;
  }
}
