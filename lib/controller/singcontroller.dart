import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taskes/class/puplicvarible.dart';
import 'package:taskes/onlonfile/functionserver.dart';
import 'package:taskes/onlonfile/statusRequst.dart';

class Singcontroller extends GetxController {
  var isOnline = true.obs;
  List usernam = [];
  late Statusrequst statusrequst;
  Functionserver funserver = Functionserver(Get.find());
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    checkInternet();
    TextEditingController() = username;
    TextEditingController() = password;

    super.onInit();
  }

  Future<void> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline.value = true;
      }
    } on SocketException catch (_) {
      isOnline.value = false;
    }
    // print(isOnline);
  }

  selectacoun() async {
    usernam.clear();
    statusrequst = Statusrequst.loading;
    update();
    try {
      var response = await funserver.singin(username.text, password.text);
      if (response != null &&
          response is Map &&
          response['status'] == "success") {
        var userData = response['data'][0];

        Puplicvarible.iduser = userData['iduser'].toString();
        Puplicvarible.fullName = userData['nam'];
        statusrequst = Statusrequst.success;
        usernam.addAll(response['data']);
      } else {
        statusrequst = Statusrequst.failure;
      }
    } catch (e) {
      statusrequst = Statusrequst.failure;
      // print("Error in selectacoun: $e");
    }
    // await changeDigits();
    // sumformat();
    update();
  }
}
