// To parse this JSON data, do
//
//     final dashboardChief = dashboardChiefFromJson(jsonString);

import 'dart:convert';

DashboardChief dashboardChiefFromJson(String str) =>
    DashboardChief.fromJson(json.decode(str));

String dashboardChiefToJson(DashboardChief data) => json.encode(data.toJson());

class DashboardChief {
  DashboardChief({
    this.status,
    this.message,
    this.jumlah,
    this.aktifitasSelesai,
    this.aktifitasBerproses,
    this.data,
  });

  int? status;
  String? message;
  int? jumlah;
  int? aktifitasSelesai;
  int? aktifitasBerproses;
  List<Chief>? data;

  factory DashboardChief.fromJson(Map<String, dynamic> json) => DashboardChief(
        status: json["status"],
        message: json["message"],
        jumlah: json["jumlah"],
        aktifitasSelesai: json["aktifitas_selesai"],
        aktifitasBerproses: json["aktifitas_berproses"],
        data: List<Chief>.from(json["data"].map((x) => Chief.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "jumlah": jumlah,
        "aktifitas_selesai": aktifitasSelesai,
        "aktifitas_berproses": aktifitasBerproses,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Chief {
  Chief({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.assigneeActivitiesCount,
    this.finishedActivity,
    this.unfinishedActivities,
    this.assigneeActivities,
  });

  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? assigneeActivitiesCount;
  String? finishedActivity;
  String? unfinishedActivities;
  List<dynamic>? assigneeActivities;

  factory Chief.fromJson(Map<String, dynamic> json) => Chief(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        assigneeActivitiesCount: json["assignee_activities_count"],
        finishedActivity: json["finished_activity"],
        unfinishedActivities: json["unfinished_activities"],
        assigneeActivities:
            List<dynamic>.from(json["assignee_activities"].map((x) => x)),
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
        "assignee_activities_count": assigneeActivitiesCount,
        "finished_activity": finishedActivity,
        "unfinished_activities": unfinishedActivities,
        "assignee_activities":
            List<dynamic>.from(assigneeActivities!.map((x) => x)),
      };
}
