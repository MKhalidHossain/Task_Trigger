class GetAllTasksResponseModel {
  bool? status;
  int? statusCode;
  int? count;
  String? message;
  List<Data>? data;

  GetAllTasksResponseModel(
      {this.status, this.statusCode, this.count, this.message, this.data});

  GetAllTasksResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    count = json['count'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['count'] = count;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
