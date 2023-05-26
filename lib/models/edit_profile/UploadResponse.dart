/// status : "success"
/// message : "url request generated successfully"
/// data : {"url":"https://coza-uploads.s3.us-east-005.backblazeb2.com/coza-uploads-1684341840375.jpg"}

class UploadResponse {
  UploadResponse({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UploadResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
UploadResponse copyWith({  String? status,
  String? message,
  Data? data,
}) => UploadResponse(  status: status ?? _status,
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

/// url : "https://coza-uploads.s3.us-east-005.backblazeb2.com/coza-uploads-1684341840375.jpg"

class Data {
  Data({
      String? url,}){
    _url = url;
}

  Data.fromJson(dynamic json) {
    _url = json['url'];
  }
  String? _url;
Data copyWith({  String? url,
}) => Data(  url: url ?? _url,
);
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}