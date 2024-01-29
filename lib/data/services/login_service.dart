import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../../models/login_model.dart';

class PostLoginService {
  final baseUrl = "http://localhost:18047";
  final endpoint = "/Login";
  // final Dio _dio = Dio();

  Future<PostLoginModel?> postLogin(String username, String password) async {
    try {
      final body = {
        'username': username,
        'password': password,
      };
      var response = await http.post(
        Uri.parse(baseUrl + endpoint),
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedJson = jsonDecode(response.body);
        var resultLogin = PostLoginModel.fromJson(decodedJson);
        print("status code : ${response.statusCode}");
        print("message code : ${resultLogin.messages.fullName}");
        return resultLogin;
      } else {
        return _handleError(response);
      }
    } catch (e) {
      // return _handleError(e);
      print(e.toString());
    }
  }

  _handleError(error) {
    String errorDesc = "";
    DioException dioError = error as DioException;
    switch (dioError.type) {
      // ignore: deprecated_member_use
      case DioExceptionType.connectionTimeout:
        errorDesc = "Connection to server is timeout";
        break;
      case DioExceptionType.sendTimeout:
        errorDesc = "Send timeout in connection to server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDesc = "Received timeout in connection to server";
        break;
      case DioExceptionType.badResponse:
        errorDesc =
            "Received server error status code ${dioError.response!.statusCode}";
        break;
      case DioExceptionType.cancel:
        errorDesc = "Connection to server was cancelled";
        break;
      case DioExceptionType.unknown:
        errorDesc = "Unknown error connection to server ";
        break;
      default:
    }
    final Response errorResponse = Response(
      requestOptions: RequestOptions(path: ""),
      data: errorDesc,
      statusMessage: (dioError.response!).toString(),
    );
    // You might want to log the error message here
    log("Error: $errorDesc");
    return errorResponse;
  }
}
