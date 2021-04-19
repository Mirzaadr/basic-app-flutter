import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/models/talent_model.dart';
import 'package:starter_app/services/api_services.dart';
import 'package:starter_app/utils/network.dart';

class DashboardModel extends ChangeNotifier {
  DashboardModel() : super();

  bool isLoading = false;
  List<Talent> talents = [];

  void getTalents() async {
    isLoading = true;
    try {
      var response = await ApiServices()
          .dio
          .request('api/TalentData', options: Options(method: 'GET'));
      print(response.data);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }
}
