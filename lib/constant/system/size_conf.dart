import 'package:flutter/material.dart';

class SizeConf {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double bolkSizeHorizontal;
  static late double bolkSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    bolkSizeHorizontal = screenWidth / 100;
    bolkSizeVertical = screenHeight / 100;
  }
}
