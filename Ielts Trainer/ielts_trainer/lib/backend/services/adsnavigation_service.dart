import 'package:flutter/cupertino.dart';
import 'package:ielts_trainer/frontend/views/home_view.dart';
import 'package:ielts_trainer/frontend/views/home/mocktest_view.dart';
import 'package:ielts_trainer/frontend/views/home/pmaterial_view.dart';
import 'package:ielts_trainer/frontend/views/home/ptevid_view.dart';

class AdsNavigtion {
  static Widget getNavigatedRoute(String key) {
    switch (key) {
      case "practicematerial":
        {
          return const PMaterialView();
        }

      case "ptevideo":
        {
          return const PVidView();
        }

      case "mocktest":
        {
          return const MockTest();
        }

      default:
        {
          return const HomeView();
        }
    }
  }
}
