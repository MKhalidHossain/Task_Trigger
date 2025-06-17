class GetUserByIdResponseModel {
  bool? status;
  int? statusCode;
  String? message;
  User? user;

  GetUserByIdResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.user,
  });

  GetUserByIdResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;

  User({this.id, this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id']; // ✅ Fix: using '_id' from backend
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
  }

  // String get image => null;

  // String get avatar => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = id; // Keep consistent with backend field
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['role'] = role;
    return data;
  }
}
