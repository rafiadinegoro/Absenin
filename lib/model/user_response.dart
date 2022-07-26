// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

UsersResponse usersResponseFromJson(String str) =>
    UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<List<Users>>? data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        status: json["status"],
        message: json["message"],
        data: List<List<Users>>.from(json["data"]
            .map((x) => List<Users>.from(x.map((x) => Users.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(
            data!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Users {
  Users({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.assigneeActivities,
    this.assignerActivities,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<AssigneeActivity>? assigneeActivities;
  List<dynamic>? assignerActivities;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        assigneeActivities: json["assignee_activities"] == null
            ? null
            : List<AssigneeActivity>.from(json["assignee_activities"]
                .map((x) => AssigneeActivity.fromJson(x))),
        assignerActivities: json["assigner_activities"] == null
            ? null
            : List<dynamic>.from(json["assigner_activities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "assignee_activities": assigneeActivities == null
            ? null
            : List<dynamic>.from(assigneeActivities!.map((x) => x.toJson())),
        "assigner_activities": assignerActivities == null
            ? null
            : List<dynamic>.from(assignerActivities!.map((x) => x)),
      };
}

class AssigneeActivity {
  AssigneeActivity({
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

  factory AssigneeActivity.fromJson(Map<String, dynamic> json) =>
      AssigneeActivity(
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
      };
}
