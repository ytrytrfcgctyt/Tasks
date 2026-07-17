import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/routscreen/svgimgrou.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:taskes/controller/homecontroller.dart';
import 'package:taskes/function/date_helper.dart';
import 'package:taskes/function/myDateUtils.dart';
import 'package:taskes/widgt/puplicc/butonsvgtext.dart' show Butonsvgtext;
import 'package:taskes/widgt/puplicc/droupdaownbox.dart';
import 'package:taskes/widgt/puplicc/formapp.dart';
import 'package:taskes/widgt/puplicc/textform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void addBLAce(BuildContext context) {
  final mycontroller = Get.find<Homecontroller>();
  myDateUtils.setTodayDateOnly(mycontroller.blancdatt);
  Formapp.show(
    title: Text(
      'حركة رصيد',
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Appcoloros.appbarcolor,
      ),
    ),
    children: [
      Responsive(
        mobile: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.blancount,
                      lablenam: 'المبلغ',
                      hintetex: 'اكتب المبلغ',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.production_quantity_limits_outlined,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Droupdaownbox(
                      prefixIcon: Icon(
                        Icons.currency_bitcoin,
                        color: Appcoloros.buttonDark,
                      ),
                      label: 'العملة',
                      items: const [
                        {'id': '1', 'name': 'د.ع'},
                        {'id': '2', 'name': '\$'},
                      ],
                      selectedValue: mycontroller.blaceidex ?? '1',
                      onChanged: (val) {
                        mycontroller.blaceidex = val;
                      },
                      isRequired: true,
                      bordercolor: Appcoloros.buttonDark,
                      lablecolor: Appcoloros.buttonDark,
                      textcolor: Appcoloros.textDark2,
                      hintcolor: Appcoloros.textDark,
                      fontSize: 12,
                      lableSize: 15,
                      bourderrudise: 10,
                      textforcolor: Appcoloros.textDark2,
                      floatingLabelSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Droupdaownbox(
                prefixIcon: Icon(
                  Icons.currency_bitcoin,
                  color: Appcoloros.buttonDark,
                ),
                label: 'الحركة',
                items: const [
                  {'id': '1', 'name': 'صرف'},
                  {'id': '2', 'name': 'قبض'},
                ],
                selectedValue: mycontroller.blacetype ?? '1',
                onChanged: (val) {
                  mycontroller.blacetype = val;
                },
                isRequired: true,
                bordercolor: Appcoloros.buttonDark,
                lablecolor: Appcoloros.buttonDark,
                textcolor: Appcoloros.textDark2,
                hintcolor: Appcoloros.textDark,
                fontSize: 12,
                lableSize: 15,
                bourderrudise: 10,
                textforcolor: Appcoloros.textDark2,
                floatingLabelSize: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: MouseRegion(
                cursor: SystemMouseCursors.grabbing,
                child: Textform(
                  mouseCursor: SystemMouseCursors.click,
                  contrler: mycontroller.blancdatt,
                  lablenam: 'التاريخ',
                  hintetex: '2026/03/12',
                  valid: (val) {
                    return null;
                  },
                  icon: Icons.person,
                  fontsize: 14,
                  readonly: true,
                  ontap: () {
                    DateServices.selectDate(context, mycontroller.blancdatt);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                contrler: mycontroller.blancnoot,
                lablenam: 'ملاحظة',
                hintetex: 'الملاحظات',
                valid: (val) {
                  return null;
                },
                icon: Icons.quick_contacts_mail_sharp,
                fontsize: 20,
                readonly: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                contrler: mycontroller.blancditl,
                lablenam: 'التفاصيل',
                hintetex: 'ادخل تفاصيل الحركة',
                valid: (val) {
                  return null;
                },
                icon: Icons.paypal_outlined,
                fontsize: 20,
                readonly: false,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 120,
                  child: Butonsvgtext(
                    title: 'تسجيل',
                    svgasset: Svgimgrou.add,
                    onTap: () async {
                      await mycontroller.insertBlance();
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: Butonsvgtext(
                    title: 'الغاء',
                    svgasset: Svgimgrou.canccel,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        tablet: null,
        desktop: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.blancount,
                      lablenam: 'المبلغ',
                      hintetex: 'اكتب المبلغ هنا',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.production_quantity_limits_outlined,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Droupdaownbox(
                      prefixIcon: Icon(
                        Icons.currency_bitcoin,
                        color: Appcoloros.buttonDark,
                      ),
                      label: 'العملة',
                      items: const [
                        {'id': '1', 'name': 'د.ع'},
                        {'id': '2', 'name': '\$'},
                      ],
                      selectedValue: mycontroller.blaceidex ?? '1',
                      onChanged: (val) {
                        mycontroller.blaceidex = val;
                      },
                      isRequired: true,
                      bordercolor: Appcoloros.buttonDark,
                      lablecolor: Appcoloros.buttonDark,
                      textcolor: Appcoloros.textDark2,
                      hintcolor: Appcoloros.textDark,
                      fontSize: 12,
                      lableSize: 15,
                      bourderrudise: 10,
                      textforcolor: Appcoloros.textDark2,
                      floatingLabelSize: 10,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Droupdaownbox(
                      prefixIcon: Icon(
                        Icons.currency_bitcoin,
                        color: Appcoloros.buttonDark,
                      ),
                      label: 'الحركة',
                      items: const [
                        {'id': '1', 'name': 'صرف'},
                        {'id': '2', 'name': 'قبض'},
                      ],
                      selectedValue: mycontroller.blacetype ?? '1',
                      onChanged: (val) {
                        mycontroller.blacetype = val;
                      },
                      isRequired: true,
                      bordercolor: Appcoloros.buttonDark,
                      lablecolor: Appcoloros.buttonDark,
                      textcolor: Appcoloros.textDark2,
                      hintcolor: Appcoloros.textDark,
                      fontSize: 12,
                      lableSize: 15,
                      bourderrudise: 10,
                      textforcolor: Appcoloros.textDark2,
                      floatingLabelSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.grabbing,
                      child: Textform(
                        mouseCursor: SystemMouseCursors.click,
                        contrler: mycontroller.blancdatt,
                        lablenam: 'التاريخ',
                        hintetex: '2026/03/12',
                        valid: (val) {
                          return null;
                        },
                        icon: Icons.person,
                        fontsize: 14,
                        readonly: true,
                        ontap: () {
                          DateServices.selectDate(
                            context,
                            mycontroller.blancdatt,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.blancnoot,
                      lablenam: 'ملاحظة',
                      hintetex: 'الملاحظات',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.quick_contacts_mail_sharp,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.blancditl,
                      lablenam: 'التفاصيل',
                      hintetex: 'ادخل تفاصيل الحركة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.paypal_outlined,
                      fontsize: 20,
                      readonly: false,
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
                    title: 'تسجيل',
                    svgasset: Svgimgrou.add,
                    onTap: () async {
                      await mycontroller.insertBlance();
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: Butonsvgtext(
                    title: 'الغاء',
                    svgasset: Svgimgrou.canccel,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
