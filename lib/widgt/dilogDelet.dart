import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/routscreen/svgimgrou.dart';
import 'package:taskes/widgt/puplicc/butonsvgtext.dart';
import 'package:taskes/widgt/puplicc/formapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void dilogDELETE(
  BuildContext context,
  String title,
  String msg,
  void Function() delet,
) {
  Formapp.show(
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Appcoloros.appbarcolor,
      ),
    ),
    children: [
      Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    msg,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      color: Appcoloros.appbarcolor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: Butonsvgtext(
                  title: 'حذف',
                  svgasset: Svgimgrou.canccel,
                  onTap: delet,
                ),
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: Butonsvgtext(
                  title: 'الغاء',
                  svgasset: Svgimgrou.singin,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
