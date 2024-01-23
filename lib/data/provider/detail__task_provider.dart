import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/services/detail_task_services.dart';
import 'package:flutter_worklog/models/detail_task_model.dart';
import 'package:flutter_worklog/models/login_model.dart';
import 'package:flutter_worklog/utils/enum.dart';

class DetailTaskProvider extends ChangeNotifier {
  DetailTaskModel? hasilDetailTask;
  DetailTaskService servicesLogin = DetailTaskService();
  ResultState state = ResultState.noData;

  Future<LoginModel?> postLoginModel(String username, String password) async {
    try {
      state = ResultState.isLoading;
      notifyListeners();
      hasilDetailTask = await servicesLogin.getDetailTask();
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
    return null;
  }
}
