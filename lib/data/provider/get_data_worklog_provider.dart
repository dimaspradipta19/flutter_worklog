import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/services/get_data_worklog_service.dart';
import 'package:flutter_worklog/utils/enum.dart';

class DataWorklogProvider with ChangeNotifier {
  final DataWorklogService _worklogService = DataWorklogService();
  Map<String, List<dynamic>> _groupedWorklogs = {};
  ResultState state = ResultState.noData;

  Map<String, List<dynamic>> get groupedWorklogs => _groupedWorklogs;

  Future<void> initializeWorklogs(int userId) async {
    try {
      state = ResultState.isLoading;
      notifyListeners();

      final groupedWorklogs = await _worklogService.getDataWorklog(userId);

      if (groupedWorklogs.isNotEmpty) {
        _groupedWorklogs = groupedWorklogs;
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.error;
        notifyListeners();
      }

      notifyListeners();
    } catch (e) {
      print('Error loading JSON data: $e');
      state = ResultState.error;
      notifyListeners();
    }
  }
}
