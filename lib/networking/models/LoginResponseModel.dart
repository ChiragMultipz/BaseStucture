
// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.success,
    this.message,
    this.result,
  });

  bool? success;
  String? message;
  Result? result;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    success: json["success"],
    message: json["message"],
    result: json["result"]?.isEmpty ?? true ? Result() : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.id,
    this.roleId,
    this.firstName,
    this.lastName,
    this.userSlug,
    this.countryCode,
    this.mobile,
    this.name,
    this.email,
    this.dob,
    this.otp,
    this.address,
    this.latitude,
    this.longitude,
    this.gender,
    this.profile,
    this.profileImages,
    this.description,
    this.signupBy,
    this.loginStatus,
    this.deviceType,
    this.deviceName,
    this.deviceOs,
    this.profileApproved,
    this.isActive,
    this.token,
  });

  int? id;
  int? roleId;
  dynamic firstName;
  dynamic lastName;
  dynamic userSlug;
  int? countryCode;
  int? mobile;
  dynamic name;
  String? email;
  dynamic dob;
  int? otp;
  dynamic address;
  dynamic latitude;
  dynamic longitude;
  String? gender;
  String? profile;
  List<dynamic>? profileImages;
  dynamic description;
  String? signupBy;
  String? loginStatus;
  String? deviceType;
  String? deviceName;
  String? deviceOs;
  int? profileApproved;
  int? isActive;
  String? token;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    roleId: json["role_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userSlug: json["user_slug"],
    countryCode: json["country_code"],
    mobile: json["mobile"],
    name: json["name"],
    email: json["email"],
    dob: json["dob"],
    otp: json["otp"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    gender: json["gender"],
    profile: json["profile"],
    profileImages: List<dynamic>.from(json["profile_images"].map((x) => x)),
    description: json["description"],
    signupBy: json["signup_by"],
    loginStatus: json["login_status"],
    deviceType: json["device_type"],
    deviceName: json["device_name"],
    deviceOs: json["device_os"],
    profileApproved: json["profile_approved"],
    isActive: json["is_active"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "first_name": firstName,
    "last_name": lastName,
    "user_slug": userSlug,
    "country_code": countryCode,
    "mobile": mobile,
    "name": name,
    "email": email,
    "dob": dob,
    "otp": otp,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "gender": gender,
    "profile": profile,
    "profile_images": List<dynamic>.from(profileImages!.map((x) => x)),
    "description": description,
    "signup_by": signupBy,
    "login_status": loginStatus,
    "device_type": deviceType,
    "device_name": deviceName,
    "device_os": deviceOs,
    "profile_approved": profileApproved,
    "is_active": isActive,
    "token": token,
  };
}

class LoginRequest {
  String? username;
  String? password;
  String? deviceType;
  String? deviceName;
  String? deviceOs;
  String? deviceId;
  String? pushToken;
  LoginRequest({this.username, this.password, this.deviceType,
  this.deviceName,
  this.deviceOs,this.deviceId,this.pushToken});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['email'];
    password = json['password'];
    deviceType = json["device_type"];
    deviceName = json["device_name"];
    deviceOs = json["device_os"];
    deviceId = json["device_id"];
    pushToken = json["push_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.username;
    data['password'] = this.password;
    data["device_type"] = this.deviceType;
    data["device_name"] = this.deviceName;
    data["device_os"] = this.deviceOs;
    data["device_id"] = this.deviceId;
    data["push_token"] = this.pushToken;
    return data;
  }
}


class ProfileImage {
  ProfileImage({
    this.id,
    this.userId,
    this.imagePath,
  });

  int? id;
  int? userId;
  String? imagePath;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    id: json["id"],
    userId: json["user_id"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image_path": imagePath,
  };
}

