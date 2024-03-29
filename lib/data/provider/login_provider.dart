import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/services/login_service.dart';
import 'package:flutter_worklog/models/login_model.dart';
import 'package:flutter_worklog/utils/enum.dart';

class PostLoginProvider extends ChangeNotifier {
  PostLoginModel? hasilPost;
  PostLoginService servicesLogin = PostLoginService();
  ResultState state = ResultState.noData;

  Future<PostLoginModel?> postLogin(String username, String password) async {
    try {
      state = ResultState.isLoading;
      notifyListeners();
      hasilPost = await servicesLogin.postLogin(username, password);
      if (hasilPost != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
    return hasilPost;
  }
}
