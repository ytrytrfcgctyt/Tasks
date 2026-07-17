import 'dart:io';
import 'package:taskes/constant/locaziton/controler_onbording.dart';
import 'package:taskes/constant/locaziton/localcontrollr.dart';
import 'package:taskes/constant/locaziton/server_onbording.dart';
import 'package:taskes/constant/routscreen/routes.dart';
import 'package:taskes/onlonfile/initalbaindinge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      center: true,
      title: "الحسابات",
      titleBarStyle: TitleBarStyle.normal,
      fullScreen: false,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.setPreventClose(false);
    });
  }
  await initalServer();
  Get.lazyPut(() => ControlerOnbordingIMP());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localcontrollr controller = Get.put(Localcontrollr());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.languge,
      initialRoute: '/',
      initialBinding: Initalbaindinge(),
      getPages: routes,
    );
  }
}
