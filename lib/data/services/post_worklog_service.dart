import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_worklog/models/post_worklog_model.dart';
import 'package:http/http.dart' as http;

class PostWorklogService {
  final baseUrl = 'http://localhost:18047';
  final endpoint = "/Worklog";
  Future<PostWorklogModel?> postDataWorklog({
    required String logStart,
    required String logEnd,
    required String logDate,
    required String logDetails,
    required int userId,
    required int projectId,
    required String logTitle,
  }) async {
    try {
      final body = {
        'logStart': logStart,
        'logEnd': logEnd,
        'logDate': logDate,
        'logDetails': logDetails,
        'userId': userId,
        'projectId': projectId,
        'logTitle': logTitle
      };
      var response = await http.post(
          Uri.parse(
            baseUrl + endpoint,
          ),
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode(body));

      if (response.statusCode == 201) {
        // final jsonData = response.body;
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        var hasilPostData = PostWorklogModel.fromJson(decodedData);
        print("hasil postData ${hasilPostData.toString()}");
        print("hasil response status code ${response.statusCode}");
        return hasilPostData;
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
