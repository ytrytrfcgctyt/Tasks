import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerOnbording extends GetxService {
  late SharedPreferences myshardPrf;
  Future<ServerOnbording> init() async {
    myshardPrf = await SharedPreferences.getInstance();
    return this;
  }
}

initalServer() async {
  await Get.putAsync(() => ServerOnbording().init());
}
