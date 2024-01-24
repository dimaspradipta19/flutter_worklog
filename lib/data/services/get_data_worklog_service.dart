import 'dart:convert';

import 'package:flutter/services.dart';

class DataWorklogService {
  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/dataTask.json');
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
}
