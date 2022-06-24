// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';




class LoginResponse {
  LoginResponse({
    this.user,
    this.jwt,
    this.status,
  });

  User? user;
  String? jwt;
  Status? status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    user: User.fromJson(json["User"]),
    jwt: json["JWT"],
    status: Status.fromJson(json["Status"]),
  );


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

class User {
  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.userId,
    this.profileId,
    this.roles,
    this.registrationStatus,
    this.socialLoginId,
    this.socialLoginProvider,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? userId;
  String? profileId;
  List<String>? roles;
  RegistrationStatus? registrationStatus;
  String? socialLoginId;
  String? socialLoginProvider;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["FirstName"],
    lastName: json["LastName"],
    email: json["Email"],
    password: json["Password"],
    userId: json["UserID"],
    profileId: json["ProfileID"],
    roles: List<String>.from(json["Roles"].map((x) => x)),
    registrationStatus: RegistrationStatus.fromJson(json["RegistrationStatus"]),
    socialLoginId: json["SocialLoginID"],
    socialLoginProvider: json["SocialLoginProvider"],
  );


}

class RegistrationStatus {
  RegistrationStatus({
    this.phoneVerified,
    this.termsAndConditionAccepted,
    this.dlVerified,
    this.emailVerified,
    this.dlDocumentsSubmitted,
  });

  bool? phoneVerified;
  bool? termsAndConditionAccepted;
  bool? dlVerified;
  bool? emailVerified;
  bool? dlDocumentsSubmitted;

  factory RegistrationStatus.fromJson(Map<String, dynamic> json) => RegistrationStatus(
    phoneVerified: json["PhoneVerified"],
    termsAndConditionAccepted: json["TermsAndConditionAccepted"],
    dlVerified: json["DLVerified"],
    emailVerified: json["EmailVerified"],
    dlDocumentsSubmitted: json["DLDocumentsSubmitted"],
  );


}
