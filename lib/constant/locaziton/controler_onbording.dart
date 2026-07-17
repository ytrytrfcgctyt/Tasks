import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taskes/constant/locaziton/server_onbording.dart';

abstract class ControlerOnbording extends GetxController {
  onPaageChange(int index);
}

class ControlerOnbordingIMP extends ControlerOnbording {
  late PageController pageController;
  int curentPage = 0;
  ServerOnbording serverOnbording = Get.find();
  @override
  onPaageChange(int index) {
    curentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
