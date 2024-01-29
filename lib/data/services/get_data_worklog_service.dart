import 'dart:convert';
import 'dart:developer';

// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DataWorklogService {
  // Dio dio = Dio();

  final String baseUrl = "http://localhost:18047/";
  final String endpoint = "User/details/";

  // With API REAL
  Future<Map<String, List<dynamic>>> getDataWorklog(int userId) async {
    try {
      var response = await http.get(
        Uri.parse(baseUrl + endpoint + userId.toString()),
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.body;
        return groupWorklogsByDate(jsonData);
      } else {}
    } catch (error) {
      log('Error fetching worklogs: $error');
      // throw error;
    }
    return {};
  }

  Map<String, List<dynamic>> groupWorklogsByDate(String jsonData) {
    Map<String, List<dynamic>> groupedWorklogs = {};

    Map<String, dynamic> data = json.decode(jsonData);

    List<dynamic> worklogs = data['worklogs'];
    for (int i = 0; i < worklogs.length; i++) {
      String logDate = worklogs[i]['logDate'];

      if (groupedWorklogs.containsKey(logDate)) {
        groupedWorklogs[logDate]?.add(worklogs[i]);
      } else {
        groupedWorklogs[logDate] = [worklogs[i]];
      }
    }

    return groupedWorklogs;
  }

  Map<String, double> sumTimePerDay(
      Map<String, List<dynamic>> groupedWorklogs) {
    final hoursPerDay = <String, double>{};

    for (final entry in groupedWorklogs.entries) {
      double totalHours = 0;
      for (final worklog in entry.value) {
        final startTime =
            DateFormat('yyyy-MM-ddTHH:mm:ss').parse(worklog['logStart']);
        final endTime =
            DateFormat('yyyy-MM-ddTHH:mm:ss').parse(worklog['logEnd']);
        final differenceInMilliseconds =
            endTime.difference(startTime).inMilliseconds;
        final differenceInHours = differenceInMilliseconds / 3600000;
        totalHours += differenceInHours;
      }
      hoursPerDay[entry.key] = totalHours;
    }

    return hoursPerDay;
  }
}
