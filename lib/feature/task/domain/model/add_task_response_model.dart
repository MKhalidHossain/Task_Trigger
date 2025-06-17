class AddTaskResponseModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  AddTaskResponseModel({this.status, this.statusCode, this.message, this.data});

  AddTaskResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  String? user;
  String? name;
  String? date;
  String? startTime;
  String? endTime;
  String? location;
  bool? isFullDay;
  bool? notificationEnabled;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.user,
      this.name,
      this.date,
      this.startTime,
      this.endTime,
      this.location,
      this.isFullDay,
      this.notificationEnabled,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    name = json['name'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    location = json['location'];
    isFullDay = json['isFullDay'];
    notificationEnabled = json['notificationEnabled'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = user;
    data['name'] = name;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['location'] = location;
    data['isFullDay'] = isFullDay;
    data['notificationEnabled'] = notificationEnabled;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
