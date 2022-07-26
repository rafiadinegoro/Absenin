// To parse this JSON data, do
//
//     final cutiResponse = cutiResponseFromJson(jsonString);

import 'dart:convert';

CutiResponse cutiResponseFromJson(String str) =>
    CutiResponse.fromJson(json.decode(str));

String cutiResponseToJson(CutiResponse data) => json.encode(data.toJson());

class CutiResponse {
  CutiResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<List<Cuti>>? data;

  factory CutiResponse.fromJson(Map<String, dynamic> json) => CutiResponse(
        status: json["status"],
        message: json["message"],
        data: List<List<Cuti>>.from(json["data"]
            .map((x) => List<Cuti>.from(x.map((x) => Cuti.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
            data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Cuti {
  Cuti({
    this.id,
    this.chiefOfficerId,
    this.fieldOfficerId,
    this.submittedDate,
    this.finishedDate,
    this.description,
    this.requestStatus,
    this.letterType,
    this.filename,
    this.path,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? chiefOfficerId;
  String? fieldOfficerId;
  DateTime? submittedDate;
  DateTime? finishedDate;
  String? description;
  int? requestStatus;
  dynamic letterType;
  dynamic filename;
  dynamic path;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Cuti.fromJson(Map<String, dynamic> json) => Cuti(
        id: json["id"],
        chiefOfficerId: json["chief_officer_id"],
        fieldOfficerId: json["field_officer_id"],
        submittedDate: DateTime.parse(json["submitted_date"]),
        finishedDate: DateTime.parse(json["finished_date"]),
        description: json["description"],
        requestStatus: json["request_status"],
        letterType: json["letter_type"],
        filename: json["filename"],
        path: json["path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chief_officer_id": chiefOfficerId,
        "field_officer_id": fieldOfficerId,
        "submitted_date": submittedDate!.toIso8601String(),
        "finished_date": finishedDate!.toIso8601String(),
        "description": description,
        "request_status": requestStatus,
        "letter_type": letterType,
        "filename": filename,
        "path": path,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
