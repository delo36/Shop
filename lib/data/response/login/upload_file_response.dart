class UploadFileResponse {
  UploadFileResponse({
      this.status, 
      this.path, 
      this.url,});

  UploadFileResponse.fromJson(dynamic json) {
    status = json['status'];
    path = json['path'];
    url = json['url'];
  }
  String? status;
  String? path;
  String? url;
UploadFileResponse copyWith({  String? status,
  String? path,
  String? url,
}) => UploadFileResponse(  status: status ?? this.status,
  path: path ?? this.path,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['path'] = path;
    map['url'] = url;
    return map;
  }

}