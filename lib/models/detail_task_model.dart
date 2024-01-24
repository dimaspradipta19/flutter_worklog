// To parse this JSON data, do
//
//     final detailTaskModel = detailTaskModelFromJson(jsonString);

import 'dart:convert';

DetailTaskModel detailTaskModelFromJson(String str) => DetailTaskModel.fromJson(json.decode(str));

String detailTaskModelToJson(DetailTaskModel data) => json.encode(data.toJson());

class DetailTaskModel {
    int userId;
    String username;
    String fullName;
    List<Worklog> worklogs;
    List<Project> projects;

    DetailTaskModel({
        required this.userId,
        required this.username,
        required this.fullName,
        required this.worklogs,
        required this.projects,
    });

    factory DetailTaskModel.fromJson(Map<String, dynamic> json) => DetailTaskModel(
        userId: json["userId"],
        username: json["username"],
        fullName: json["fullName"],
        worklogs: List<Worklog>.from(json["worklogs"].map((x) => Worklog.fromJson(x))),
        projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "fullName": fullName,
        "worklogs": List<dynamic>.from(worklogs.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    };
}

class Project {
    int projectId;
    String projectName;

    Project({
        required this.projectId,
        required this.projectName,
    });

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        projectId: json["projectId"],
        projectName: json["projectName"] as String,
    );

    Map<String, dynamic> toJson() => {
        "projectId": projectId,
        "projectName": projectNameValues.reverse[projectName],
    };
}

enum ProjectName {
    ARJUNA,
    EDP,
    MADAM
}

final projectNameValues = EnumValues({
    "ARJUNA": ProjectName.ARJUNA,
    "EDP": ProjectName.EDP,
    "MADAM": ProjectName.MADAM
});

class Worklog {
    int logId;
    String logStart;
    String logEnd;
    DateTime logDate;
    String logDetails;
    String logTitle;
    int userId;
    Project project;

    Worklog({
        required this.logId,
        required this.logStart,
        required this.logEnd,
        required this.logDate,
        required this.logDetails,
        required this.logTitle,
        required this.userId,
        required this.project,
    });

    factory Worklog.fromJson(Map<String, dynamic> json) => Worklog(
        logId: json["logId"],
        logStart: json["logStart"],
        logEnd: json["logEnd"],
        logDate: DateTime.parse(json["logDate"]),
        logDetails: json["logDetails"],
        logTitle: json["logTitle"],
        userId: json["userId"],
        project: Project.fromJson(json["project"]),
    );

    Map<String, dynamic> toJson() => {
        "logId": logId,
        "logStart": logStart,
        "logEnd": logEnd,
        "logDate": logDate.toIso8601String(),
        "logDetails": logDetails,
        "logTitle": logTitle,
        "userId": userId,
        "project": project.toJson(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
