class GetRequestByIdResponseModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  GetRequestByIdResponseModel(
      {this.status, this.statusCode, this.message, this.data});

  GetRequestByIdResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? notificationEnabled;
  String? sId;
  User? user;
  String? name;
  String? date;
  String? startTime;
  String? endTime;
  String? location;
  bool? isFullDay;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.notificationEnabled,
      this.sId,
      this.user,
      this.name,
      this.date,
      this.startTime,
      this.endTime,
      this.location,
      this.isFullDay,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    notificationEnabled = json['notificationEnabled'];
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    name = json['name'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    location = json['location'];
    isFullDay = json['isFullDay'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationEnabled'] = notificationEnabled;
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['name'] = name;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['location'] = location;
    data['isFullDay'] = isFullDay;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;

  User({this.sId, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
