import 'dart:convert';

DetailTaskModel detailTaskModelFromJson(String str) =>
    DetailTaskModel.fromJson(json.decode(str));

String detailTaskModelToJson(DetailTaskModel data) =>
    json.encode(data.toJson());

class DetailTaskModel {
  int userId;
  String username;
  String fullName;
  dynamic password;
  List<Worklog> worklogs;
  List<Project> projects;

  DetailTaskModel({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.password,
    required this.worklogs,
    required this.projects,
  });

  factory DetailTaskModel.fromJson(Map<String, dynamic> json) =>
      DetailTaskModel(
        userId: json["userId"],
        username: json["username"],
        fullName: json["fullName"],
        password: json["password"],
        worklogs: List<Worklog>.from(
            json["worklogs"].map((x) => Worklog.fromJson(x))),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "fullName": fullName,
        "password": password,
        "worklogs": List<dynamic>.from(worklogs.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Project {
  int userId;
  int projectId;
  dynamic project;
  dynamic user;

  Project({
    required this.userId,
    required this.projectId,
    required this.project,
    required this.user,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        userId: json["userId"],
        projectId: json["projectId"],
        project: json["project"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "projectId": projectId,
        "project": project,
        "user": user,
      };
}

class Worklog {
  int logId;
  String logStart;
  String logEnd;
  DateTime logDate;
  String logDetails;
  int userId;
  int projectId;
  dynamic project;
  dynamic user;

  Worklog({
    required this.logId,
    required this.logStart,
    required this.logEnd,
    required this.logDate,
    required this.logDetails,
    required this.userId,
    required this.projectId,
    required this.project,
    required this.user,
  });

  factory Worklog.fromJson(Map<String, dynamic> json) => Worklog(
        logId: json["logId"],
        logStart: json["logStart"],
        logEnd: json["logEnd"],
        logDate: DateTime.parse(json["logDate"]),
        logDetails: json["logDetails"],
        userId: json["userId"],
        projectId: json["projectId"],
        project: json["project"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "logId": logId,
        "logStart": logStart,
        "logEnd": logEnd,
        "logDate": logDate.toIso8601String(),
        "logDetails": logDetails,
        "userId": userId,
        "projectId": projectId,
        "project": project,
        "user": user,
      };
}
