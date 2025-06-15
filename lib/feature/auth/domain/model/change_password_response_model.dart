class ChangePasswordResponseModel {
  bool? status;
  int? statusCode;
  String? message;

  ChangePasswordResponseModel({this.status, this.statusCode, this.message});

  ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
