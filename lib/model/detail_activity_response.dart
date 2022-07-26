// To parse this JSON data, do
//
//     final detailActivityResponse = detailActivityResponseFromJson(jsonString);

import 'dart:convert';

DetailActivityResponse detailActivityResponseFromJson(String str) =>
    DetailActivityResponse.fromJson(json.decode(str));

String detailActivityResponseToJson(DetailActivityResponse data) =>
    json.encode(data.toJson());

class DetailActivityResponse {
  DetailActivityResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory DetailActivityResponse.fromJson(Map<String, dynamic> json) =>
      DetailActivityResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.chiefOfficerId,
    this.fieldOfficerId,
    this.description,
    this.startTime,
    this.finishTime,
    this.coordinate,
    this.statusActivity,
    this.reports,
  });

  int? id;
  String? chiefOfficerId;
  String? fieldOfficerId;
  String? description;
  DateTime? startTime;
  DateTime? finishTime;
  String? coordinate;
  String? statusActivity;
  List<Report>? reports;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        chiefOfficerId: json["chief_officer_id"],
        fieldOfficerId: json["field_officer_id"],
        description: json["description"],
        startTime: DateTime.parse(json["start_time"]),
        finishTime: DateTime.parse(json["finish_time"]),
        coordinate: json["coordinate"],
        statusActivity: json["status_activity"],
        reports:
            List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chief_officer_id": chiefOfficerId,
        "field_officer_id": fieldOfficerId,
        "description": description,
        "start_time": startTime!.toIso8601String(),
        "finish_time": finishTime!.toIso8601String(),
        "coordinate": coordinate,
        "status_activity": statusActivity,
        "reports": List<dynamic>.from(reports!.map((x) => x.toJson())),
      };
}

class Report {
  Report({
    this.id,
    this.activityId,
    this.description,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? activityId;
  String? description;
  String? lat;
  String? long;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        activityId: json["activity_id"],
        description: json["description"],
        lat: json["lat"],
        long: json["long"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_id": activityId,
        "description": description,
        "lat": lat,
        "long": long,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
