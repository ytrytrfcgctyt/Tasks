import 'package:taskes/onlonfile/crud.dart';
import 'package:get/get.dart';

class Initalbaindinge extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
