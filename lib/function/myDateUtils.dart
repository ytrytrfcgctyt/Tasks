import 'package:flutter/material.dart';

// ignore: camel_case_types
class myDateUtils {
  static void setTodayDateOnly(TextEditingController controller) {
    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString().padLeft(2, '0');
    String day = now.day.toString().padLeft(2, '0');
    controller.text = "$year/$month/$day";
  }
}
