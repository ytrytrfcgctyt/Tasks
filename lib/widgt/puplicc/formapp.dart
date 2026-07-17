import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Formapp {
  static void show({
    required dynamic title,
    required List<Widget> children,
    String confirmTitle = 'إضافة',
    String? confirmSvg,
    VoidCallback? onConfirm,
  }) {
    Get.defaultDialog(
      title: "",
      titleStyle: const TextStyle(fontSize: 0),
      backgroundColor: Appcoloros.bakgroundDark2,
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      radius: 15,
      content: SizedBox(
        width: Responsive.isMobile(Get.context!) ? 300 : 750,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,

                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Appcoloros.bakgroundDark2,
                ),
                child: Center(child: title),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: children),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (onConfirm != null)
                  //   Butonsvgtext(
                  //     onTap: onConfirm,
                  //     title: confirmTitle,
                  //     svgasset: confirmSvg ?? myroutimage.addperson,
                  //   ),
                  // Butonsvgtext(
                  //   onTap: () => Get.back(),
                  //   title: 'إلغاء',
                  //   svgasset: myroutimage.cancellation,
                  // ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
