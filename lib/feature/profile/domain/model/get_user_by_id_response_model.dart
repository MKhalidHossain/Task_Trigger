class GetUserByIdResponseModel {
  bool? status;
  int? statusCode;
  String? message;
  UserforProfile? userforProfile;

  GetUserByIdResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.userforProfile,
  });

  GetUserByIdResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    userforProfile = json['user'] != null ? UserforProfile.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (userforProfile != null) {
      data['user'] = userforProfile!.toJson();
    } 
    return data;
  }
}

class UserforProfile {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? role;

  UserforProfile({this.id, this.name, this.email, this.avatar, this.role});

  UserforProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
  }

  get image => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['avatar'] = avatar;
    data['role'] = role;
    return data;
  }
}
