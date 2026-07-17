import 'package:get/get.dart';
import 'package:taskes/screen/home.dart';
import 'package:taskes/screen/singin.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Singin()),
  GetPage(name: "/homee", page: () => Home()),
];
