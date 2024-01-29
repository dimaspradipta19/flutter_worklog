import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_worklog/models/detail_task_model.dart';
import 'package:http/http.dart' as http;

class DetailTaskService {
  final String baseUrl = "http://localhost:18047/";
  final String endpoint = "User/details/";
  // final Dio _dio = Dio();

  Future<DetailTaskModel> getDetailTask(int userId) async {
    try {
      // var response = await _dio.get(baseUrl);

      // final String response =
      //     await rootBundle.loadString('assets/dataTask.json');

      var response = await http.get(
        Uri.parse(baseUrl + endpoint + userId.toString()),
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      );

      if (response.statusCode == 200) {
        var resultLogin = DetailTaskModel.fromJson(json.decode(response.body));
        return resultLogin;
      } else {
        return _handleError(response);
      }
    } catch (e) {
      return _handleError(e);
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
