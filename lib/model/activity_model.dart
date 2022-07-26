// To parse this JSON data, do
//
//     final activityResponse = activityResponseFromJson(jsonString);

import 'dart:convert';

ActivityResponse activityResponseFromJson(String str) =>
    ActivityResponse.fromJson(json.decode(str));

String activityResponseToJson(ActivityResponse data) =>
    json.encode(data.toJson());

class ActivityResponse {
  ActivityResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<List<Activity>>? data;

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      ActivityResponse(
        status: json["status"],
        message: json["message"],
        data: List<List<Activity>>.from(json["data"].map(
            (x) => List<Activity>.from(x.map((x) => Activity.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
            data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Activity {
  Activity({
    this.id,
    this.chiefOfficerId,
    this.fieldOfficerId,
    this.locationName,
    this.description,
    this.startTime,
    this.finishTime,
    this.coordinate,
    this.statusActivity,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.assignerActivitiesId,
    this.assigneeActivitiesId,
  });

  int? id;
  String? chiefOfficerId;
  String? fieldOfficerId;
  String? locationName;
  String? description;
  DateTime? startTime;
  DateTime? finishTime;
  String? coordinate;
  int? statusActivity;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  AssigneActivitiesId? assignerActivitiesId;
  AssigneActivitiesId? assigneeActivitiesId;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        chiefOfficerId: json["chief_officer_id"],
        fieldOfficerId: json["field_officer_id"],
        locationName: json["location_name"],
        description: json["description"],
        startTime: DateTime.parse(json["start_time"]),
        finishTime: DateTime.parse(json["finish_time"]),
        coordinate: json["coordinate"],
        statusActivity: json["status_activity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        assignerActivitiesId:
            AssigneActivitiesId.fromJson(json["assigner_activities_id"]),
        assigneeActivitiesId:
            AssigneActivitiesId.fromJson(json["assignee_activities_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chief_officer_id": chiefOfficerId,
        "field_officer_id": fieldOfficerId,
        "location_name": locationName,
        "description": description,
        "start_time": startTime!.toIso8601String(),
        "finish_time": finishTime!.toIso8601String(),
        "coordinate": coordinate,
        "status_activity": statusActivity,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "assigner_activities_id": assignerActivitiesId!.toJson(),
        "assignee_activities_id": assigneeActivitiesId!.toJson(),
      };
}

class AssigneActivitiesId {
  AssigneActivitiesId({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory AssigneActivitiesId.fromJson(Map<String, dynamic> json) =>
      AssigneActivitiesId(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "role": role,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
