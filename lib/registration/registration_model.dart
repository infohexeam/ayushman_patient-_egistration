//==============================================================================
import 'dart:convert';

class DownloadFromOptions {
  String icon;
  String text;
  String platform;
  DownloadFromOptions({
    required this.icon,
    required this.text,
    required this.platform,
  });
}

GetGenderResponseModel getGenderResponseModelFromJson(String str) =>
    GetGenderResponseModel.fromJson(json.decode(str));

String getGenderResponseModelToJson(GetGenderResponseModel data) =>
    json.encode(data.toJson());

class GetGenderResponseModel {
  int? status;
  String? message;
  List<Gender>? data;

  GetGenderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetGenderResponseModel.fromJson(Map<String, dynamic> json) =>
      GetGenderResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Gender>.from(json["data"]!.map((x) => Gender.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Gender {
  int? id;
  String? name;

  Gender({
    this.id,
    this.name,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
//==============================================================================
// To parse this JSON data, do
//
//     final getMaritalStatusResponseModel = getMaritalStatusResponseModelFromJson(jsonString);

GetMaritalStatusResponseModel getMaritalStatusResponseModelFromJson(
        String str) =>
    GetMaritalStatusResponseModel.fromJson(json.decode(str));

String getMaritalStatusResponseModelToJson(
        GetMaritalStatusResponseModel data) =>
    json.encode(data.toJson());

class GetMaritalStatusResponseModel {
  int? status;
  String? message;
  List<MaritalStatus>? data;

  GetMaritalStatusResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetMaritalStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMaritalStatusResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MaritalStatus>.from(
                json["data"]!.map((x) => MaritalStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MaritalStatus {
  int? id;
  String? name;

  MaritalStatus({
    this.id,
    this.name,
  });

  factory MaritalStatus.fromJson(Map<String, dynamic> json) => MaritalStatus(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

//==============================================================================
// To parse this JSON data, do
//
//     final getBloodGroupResponseModel = getBloodGroupResponseModelFromJson(jsonString);

GetBloodGroupResponseModel getBloodGroupResponseModelFromJson(String str) =>
    GetBloodGroupResponseModel.fromJson(json.decode(str));

String getBloodGroupResponseModelToJson(GetBloodGroupResponseModel data) =>
    json.encode(data.toJson());

class GetBloodGroupResponseModel {
  int? status;
  String? message;
  List<BloodGroup>? data;

  GetBloodGroupResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetBloodGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      GetBloodGroupResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<BloodGroup>.from(
                json["data"]!.map((x) => BloodGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BloodGroup {
  int? id;
  String? name;

  BloodGroup({
    this.id,
    this.name,
  });

  factory BloodGroup.fromJson(Map<String, dynamic> json) => BloodGroup(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
//==============================================================================
// To parse this JSON data, do
//
//     final registrationResponseModel = registrationResponseModelFromJson(jsonString);

RegistrationResponseModel registrationResponseModelFromJson(String str) =>
    RegistrationResponseModel.fromJson(json.decode(str));

String registrationResponseModelToJson(RegistrationResponseModel data) =>
    json.encode(data.toJson());

class RegistrationResponseModel {
  int? status;
  int? patientId;
  String? message;
  Errors? errors;

  RegistrationResponseModel({
    this.status,
    this.patientId,
    this.message,
    this.errors,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) =>
      RegistrationResponseModel(
        status: json["status"],
        patientId: json["patient_id"],
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errors": errors?.toJson(),
        "patient_id": patientId,
        "message": message,
      };
}

class Errors {
  String? patientEmail;
  String? patientMobile;

  Errors({
    this.patientEmail,
    this.patientMobile,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        patientEmail: json["patient_email"],
        patientMobile: json["patient_mobile"],
      );

  Map<String, dynamic> toJson() => {
        "patient_email": patientEmail,
        "patient_mobile": patientMobile,
      };
}
//==============================================================================
