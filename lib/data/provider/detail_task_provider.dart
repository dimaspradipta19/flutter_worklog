import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/services/detail_task_services.dart';
import 'package:flutter_worklog/models/detail_task_model.dart';
import 'package:flutter_worklog/utils/enum.dart';

class DetailTaskProvider extends ChangeNotifier {
  DetailTaskModel? hasilDetailTask;
  DetailTaskService servicesDetail = DetailTaskService();
  ResultState state = ResultState.noData;

  Future<DetailTaskModel?> getDataDetail(int userId) async {
    try {
      state = ResultState.isLoading;
      notifyListeners();
      hasilDetailTask = await servicesDetail.getDetailTask(userId);
      if (hasilDetailTask != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
    return null;
  }
}
