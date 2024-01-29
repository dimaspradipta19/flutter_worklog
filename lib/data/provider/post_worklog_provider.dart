import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/services/post_worklog_service.dart';
import 'package:flutter_worklog/models/login_model.dart';
import 'package:flutter_worklog/models/post_worklog_model.dart';
import 'package:flutter_worklog/utils/enum.dart';

class PostDataWorklogProvider extends ChangeNotifier {
  PostWorklogModel? hasilDataWorklog;
  PostWorklogService servicesWorklog = PostWorklogService();
  ResultState state = ResultState.noData;

  Future<PostLoginModel?> postDataWorklog(
      {required String logStart,
      required String logEnd,
      required String logDate,
      required String logDetails,
      required int userId,
      required int projectId,
      required String logTitle}) async {
    try {
      state = ResultState.isLoading;
      hasilDataWorklog = await servicesWorklog.postDataWorklog(
          logStart: logStart,
          logEnd: logEnd,
          logDate: logDate,
          logDetails: logDetails,
          userId: userId,
          projectId: projectId,
          logTitle: logTitle);
      notifyListeners();
      if (hasilDataWorklog != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      notifyListeners();
    }
    return null;
  }
}
