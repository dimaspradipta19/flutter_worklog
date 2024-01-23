import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Messages messages;
    bool success;
    dynamic errors;

    LoginModel({
        required this.messages,
        required this.success,
        required this.errors,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        messages: Messages.fromJson(json["messages"]),
        success: json["success"],
        errors: json["errors"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "messages": messages.toJson(),
        "success": success,
        "errors": errors,
    };
}

class Messages {
    int userId;
    String username;
    String fullName;

    Messages({
        required this.userId,
        required this.username,
        required this.fullName,
    });

    factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        userId: json["userId"],
        username: json["username"],
        fullName: json["fullName"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "fullName": fullName,
    };
}
