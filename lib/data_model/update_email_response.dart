// To parse this JSON data, do
//
//     final updateEmailResponse = updateEmailResponseFromJson(jsonString);

import 'dart:convert';

UpdateEmailResponse updateEmailResponseFromJson(String str) => UpdateEmailResponse.fromJson(json.decode(str));

String updateEmailResponseToJson(UpdateEmailResponse data) => json.encode(data.toJson());

class UpdateEmailResponse {
  UpdateEmailResponse({
    this.status,
  });

  Status? status;

  factory UpdateEmailResponse.fromJson(Map<String, dynamic> json) => UpdateEmailResponse(
    status: Status.fromJson(json["Status"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status?.toJson(),
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
