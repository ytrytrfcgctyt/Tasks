import 'package:taskes/constant/routscreen/routimge.dart';
import 'package:taskes/constant/routscreen/routname.dart';
import 'package:taskes/constant/routscreen/svgimgrou.dart';
import 'package:taskes/controller/singcontroller.dart';
import 'package:taskes/widgt/puplicc/butonsvgtext.dart';
import 'package:taskes/widgt/puplicc/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Singin extends StatelessWidget {
  const Singin({super.key});

  @override
  Widget build(BuildContext context) {
    Singcontroller mycontroller = Get.put(Singcontroller());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Routimge.bakground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 200),
              Obx(() {
                if (mycontroller.isOnline.value) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "أهلاً بك",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: 350,
                          // height: 450,
                          padding: const EdgeInsets.all(10),
                          // color: Colors.red,
                          child: Column(
                            children: [
                              Text(
                                'تسجيل الدخول',
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: Textform(
                                  contrler: mycontroller.username,
                                  lablenam: 'اسم المستخدم',
                                  hintetex: 'ادخل اسم المستخدم',
                                  valid: (val) {
                                    return null;
                                  },
                                  icon: Icons.person,
                                  fontsize: 12,
                                  readonly: false,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                width: 200,
                                child: Textform(
                                  contrler: mycontroller.password,
                                  obscuer: true,
                                  lablenam: 'كلمة المرور',
                                  hintetex: 'ادخل كلمة المرور',
                                  valid: (val) {
                                    return null;
                                  },
                                  icon: Icons.remove_red_eye,
                                  fontsize: 12,
                                  readonly: false,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: Butonsvgtext(
                                  title: 'تسجيل الدخول',
                                  svgasset: Svgimgrou.singin,
                                  onTap: () async {
                                    await mycontroller.selectacoun();
                                    if (mycontroller.usernam.isEmpty) {
                                      Get.snackbar(
                                        'لا يوجد مستخدم',
                                        'تـأكد من اسم المستخدم وكلمة المرور',
                                      );
                                    } else {
                                      Get.toNamed(Routname.homee);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.wifi_off,
                            size: 150,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 10),
                          const Text("لا يوجد اتصال بالإنترنت"),
                          TextButton(
                            onPressed: () => mycontroller.checkInternet(),
                            child: InkWell(
                              onTap: () {
                                mycontroller.checkInternet();
                              },
                              child: Text("إعادة المحاولة"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ],
      ),
    );
  }
}
