class ChangeAvatarResponseModel {
  bool? status;
  int? statusCode;
  String? message;

  ChangeAvatarResponseModel({this.status, this.statusCode, this.message});

  ChangeAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
