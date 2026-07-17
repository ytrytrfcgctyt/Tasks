import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskes/constant/locaziton/server_onbording.dart';

class Localcontrollr extends GetxController {
  Locale? languge;
  ServerOnbording serverlocal = Get.find();
  // ThemeData apptheme = themeData;
  changLoclaz() {
    // Locale locale = Locale("ar");
    serverlocal.myshardPrf.setString("lange", "ar");
  }

  @override
  void onInit() {
    String? sharedPrfLocal = serverlocal.myshardPrf.getString("lange");
    if (sharedPrfLocal == "ar") {
      languge = const Locale("ar");
    } else {
      languge = const Locale("ar");
    }
    super.onInit();
  }
}
