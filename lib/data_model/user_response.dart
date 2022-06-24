// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserResponse userFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.profile,
    this.status,
  });

  Profile? profile;
  Status? status;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    profile: Profile.fromJson(json["Profile"]),
    status: Status.fromJson(json["Status"]),
  );

  Map<String, dynamic> toJson() => {
    "Profile": profile?.toJson(),
    "Status": status?.toJson(),
  };
}

class Profile {
  Profile({
    this.firstName,
    this.lastName,
    this.email,
    this.profileId,
    this.userId,
    this.imageId,
    this.phoneNumber,
    this.verificationStatus,
    this.aboutMe,
    this.profileRating,
    this.createdAt,
    this.updatedAt,
    this.numberOfTrips,
    this.responseTime,
    this.replyRate,
    this.promoAccepted,
    this.heardFrom,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? profileId;
  String? userId;
  String? imageId;
  String? phoneNumber;
  String? verificationStatus;
  String? aboutMe;
  double? profileRating;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? numberOfTrips;
  double? responseTime;
  int? replyRate;
  bool? promoAccepted;
  String? heardFrom;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    profileId: json["ProfileID"],
    userId: json["UserID"],
    imageId: json["ImageID"],
    phoneNumber: json["PhoneNumber"],
    verificationStatus: json["VerificationStatus"],
    aboutMe: json["AboutMe"],
    profileRating: json["ProfileRating"].toDouble(),
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    numberOfTrips: json["NumberOfTrips"],
    responseTime: json["ResponseTime"].toDouble(),
    replyRate: json["ReplyRate"],
    promoAccepted: json["PromoAccepted"],
    heardFrom: json["HeardFrom"],
  );

  Map<String, dynamic> toJson() => {
    "FirstName": firstName,
    "LastName": lastName,
    "Email": email,
    "ProfileID": profileId,
    "UserID": userId,
    "ImageID": imageId,
    "PhoneNumber": phoneNumber,
    "VerificationStatus": verificationStatus,
    "AboutMe": aboutMe,
    "ProfileRating": profileRating,
    "CreatedAt": createdAt.toString(),
    "UpdatedAt": updatedAt.toString(),
    "NumberOfTrips": numberOfTrips,
    "ResponseTime": responseTime,
    "ReplyRate": replyRate,
    "PromoAccepted": promoAccepted,
    "HeardFrom": heardFrom,
  };
}

class Status {
  Status({
    this.success,
    this.error,
  });

  bool? success;
  String? error;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    success: json["success"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error": error,
  };
}
