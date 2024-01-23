import 'package:flutter/material.dart';
import 'package:flutter_worklog/models/post_data_dummy_model.dart';

class PostDataDummyProvider extends ChangeNotifier {
  List<PostDataDummyModel> dataWorklog = [];

  void addDataWorklog(PostDataDummyModel dataModel) {
    dataWorklog.add(dataModel);
    notifyListeners();
  }

  void clearData() {
    dataWorklog.clear();
    notifyListeners();
  }
}
