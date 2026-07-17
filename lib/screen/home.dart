import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/routscreen/svgimgrou.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:taskes/controller/homecontroller.dart';
import 'package:taskes/function/date_helper.dart';
import 'package:taskes/function/formatAny.dart';
import 'package:taskes/function/myDateUtils.dart';
import 'package:taskes/report/pdfclass/pdfenum.dart';
import 'package:taskes/widgt/mobilewidgit/appbarbitom.dart';
import 'package:taskes/widgt/mobilewidgit/appbarcastum.dart';
import 'package:taskes/widgt/puplicc/butonsvgtext.dart';
import 'package:taskes/widgt/puplicc/cardblans.dart';
import 'package:taskes/widgt/puplicc/cardcompany.dart';
import 'package:taskes/widgt/puplicc/cardoutcar.dart';
import 'package:taskes/widgt/puplicc/cardwasll.dart';
import 'package:taskes/widgt/puplicc/custmbuton.dart';
import 'package:taskes/widgt/puplicc/droupdaownbox.dart';
import 'package:taskes/widgt/puplicc/formapp.dart';
import 'package:taskes/widgt/puplicc/iiconbuton.dart';
import 'package:taskes/widgt/puplicc/textform.dart';
import 'package:taskes/widgt/screenwidget/blancewidget/addblance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller mycontroller = Get.put(Homecontroller());
    return Scaffold(
      backgroundColor: Appcoloros.bakgroundDark2,
      // appBar: AppBar(),
      body: Responsive(
        mobile: Obx(() {
          if (mycontroller.stastScreen.value == 1) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbarcastum(
                  child: Column(
                    children: [
                      SizedBox(height: 53),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textform(
                                lablenam: 'البحث',
                                hintetex: 'اكتب الاسم للبحث عنه',
                                valid: (val) {
                                  return null;
                                },
                                icon: Icons.search,
                                fontsize: 15,
                                readonly: false,
                                iconcolo: Appcoloros.textDark2,
                              ),
                            ),
                          ),
                          Iiconbuton(
                            ontap: () {
                              mycontroller.loadcompany();
                            },
                            sizeicon: 25,
                            iconcolor: Appcoloros.appbarcolor,
                            icon: Icons.refresh,
                          ),
                          Iiconbuton(
                            ontap: () {
                              addcompany(mycontroller);
                            },
                            sizeicon: 25,
                            iconcolor: Appcoloros.appbarcolor,
                            icon: Icons.add,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                cardcompanyMy(),
                // SizedBox(height: 10,),
                Appbarbitom(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25, top: 5),
                              child: Text(
                                'الرصيد',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25, top: 5),
                              child: Text(
                                '${mycontroller.blFDs.value} د٫ع',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25, top: 5),
                              child: Text(
                                '${mycontroller.blFUs.value} \$',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Iiconbuton(
                                ontap: () {
                                  addBLAce(context);
                                },
                                sizeicon: 20,
                                iconcolor: Appcoloros.appbarcolor,
                                icon: Icons.add,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Iiconbuton(
                                ontap: () {
                                  mycontroller.loadBlance();
                                },
                                sizeicon: 20,
                                iconcolor: Appcoloros.appbarcolor,
                                icon: Icons.refresh,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (mycontroller.stastScreen.value == 2) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbarcastum(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Iiconbuton(
                                    ontap: () {
                                      mycontroller.stastScreen.value = 1;
                                    },
                                    sizeicon: 25,
                                    iconcolor: Appcoloros.appbarcolor,
                                    icon: Icons.arrow_back_ios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Iiconbuton(
                              ontap: () {},
                              sizeicon: 25,
                              iconcolor: Appcoloros.textDark2,
                              icon: Icons.ios_share_rounded,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Iiconbuton(
                              ontap: () {
                                mycontroller.stastScreen.value = 3;
                              },
                              sizeicon: 25,
                              iconcolor: Appcoloros.textDark2,
                              icon: Icons.monetization_on,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 5),
                          //   child: Iiconbuton(
                          //     ontap: () {
                          //       movacount(context);
                          //     },
                          //     sizeicon: 25,
                          //     iconcolor: Appcoloros.textDark2,
                          //     icon: Icons.local_car_wash,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: GetBuilder<Homecontroller>(
                    builder: (builder) {
                      return GetBuilder<Homecontroller>(
                        builder: (b) {
                          return ListView.builder(
                            itemCount: mycontroller.companyacount.length,
                            itemBuilder: (builder, index) {
                              var data = mycontroller.companyacount[index];
                              String id = data['idmov'].toString();
                              return Obx(() {
                                return Cardoutcar(
                                  driver: data['namdriv'],
                                  numcar: data['numbcar'],
                                  tycar: data['typcar'],
                                  datt: data['datt'],
                                  castt: formatAny(data['costt']),
                                  nooot: data['nott'],
                                  numMenu: data['numbme'],
                                  idex: data['idex'],
                                  compsent: ' ',
                                  subb: data['subj'],
                                  a1: formatAny(data['a1']),
                                  a2: formatAny(data['a2']),
                                  a3: formatAny(data['a3']),
                                  a4: formatAny(data['a4']),
                                  a5: formatAny(data['a5']),
                                  a6: formatAny(data['a6']),
                                  a7: formatAny(data['a7']),
                                  a8: formatAny(data['a8']),
                                  a9: formatAny(data['a9']),
                                  delet: () {
                                    deletAcount(context, () async {
                                      await mycontroller.deletAcount(
                                        data['idmov'].toString(),
                                      );
                                      Get.back();
                                    });
                                  },
                                  shar: () {
                                    // mycontroller.reportInvoice(
                                    //   context,
                                    //   PdfAction.share,
                                    //   formatAny(data['a1']),
                                    //   formatAny(data['a2']),
                                    //   formatAny(data['a3']),
                                    //   formatAny(data['a4']),
                                    //   formatAny(data['a5']),
                                    //   formatAny(data['a6']),
                                    //   formatAny(data['a7']),
                                    //   formatAny(data['a8']),
                                    //   formatAny(data['a9']),
                                    //   formatAny(data['costt']),
                                    //   data['numbme'],
                                    //   mycontroller.selctnamecomp.value,
                                    //   data['subj'],
                                    //   data['namdriv'],
                                    //   data['numbcar'],
                                    //   data['typcar'],

                                    // );
                                  },
                                  isExpanded: mycontroller
                                      .isExpanded
                                      .value, // نمرر الحالة للكارد
                                  onToggleDetails: () {
                                    mycontroller.toggleExpansion(id);
                                  },
                                  namMove: data['moveto'],
                                  acountMove: formatAny(data['acountmoveto']),
                                  replce: formatAny(data['reblec']),
                                );
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Appbarbitom(
                  child: Column(
                    children: [
                      Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  _buildAnimatedCounter(
                                    label: "الإجمالي",
                                    valueString: mycontroller.mov1.value,
                                    currencySymbol: "د.ع",
                                    color: Colors.blue,
                                  ),
                                  _buildAnimatedCounter(
                                    label: "",
                                    valueString: mycontroller.mov2.value,
                                    currencySymbol: "\$",
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildAnimatedCounter(
                                    label: "المدفوع",
                                    valueString: mycontroller.paid1.value,
                                    currencySymbol: "د.ع",
                                    color: Colors.green,
                                  ),
                                  _buildAnimatedCounter(
                                    label: "",
                                    valueString: mycontroller.paid2.value,
                                    currencySymbol: "\$",
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildAnimatedCounter(
                                    label: "الباقي",
                                    valueString: mycontroller.total1.value,
                                    currencySymbol: "د.ع",
                                    color: Colors.redAccent,
                                  ),
                                  _buildAnimatedCounter(
                                    label: "",
                                    valueString: mycontroller.total2.value,
                                    currencySymbol: "\$",
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          } else if (mycontroller.stastScreen.value == 3) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbarcastum(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Iiconbuton(
                                    ontap: () {
                                      mycontroller.stastScreen.value = 1;
                                    },
                                    sizeicon: 25,
                                    iconcolor: Appcoloros.appbarcolor,
                                    icon: Icons.arrow_back_ios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CaedPaid(),
              ],
            );
          } else if (mycontroller.stastScreen.value == 4) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    color: Appcoloros.buttonDark,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(height: 75),
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Appcoloros.textDark,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Iiconbuton(
                                    ontap: () {
                                      mycontroller.stastScreen.value = 2;
                                    },
                                    sizeicon: 20,
                                    iconcolor: Appcoloros.textDark2,
                                    icon: Icons.arrow_back,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Appcoloros.textDark,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Iiconbuton(
                                    ontap: () {},
                                    sizeicon: 25,
                                    iconcolor: Appcoloros.textDark2,
                                    icon: Icons.ios_share_rounded,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Iiconbuton(
                                    ontap: () {},
                                    sizeicon: 25,
                                    iconcolor: Appcoloros.textDark2,
                                    icon: Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GetBuilder<Homecontroller>(
                      builder: (builder) {
                        return ListView.builder(
                          itemCount: mycontroller.blancList.length,
                          itemBuilder: (context, index) {
                            var data = mycontroller.blancList[index];
                            return Cardblans(
                              typ: data['typ'],
                              aco: data['blanc'],
                              dat: data['datt'],
                              noo: data['noott'],
                              ddt: data['datile'],
                              idx: data['id_ex'],
                              delet: () async {
                                await mycontroller.deletBluanc(data['idbl']);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    color: Appcoloros.buttonDark,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('125,252,000 IQD'),
                          Text('125,252,000 USD'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Text('data');
        }),

        tablet: Container(),
        desktop: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Appcoloros.bakgroundDark2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Textform(
                                contrler: mycontroller.sercnamcpany,
                                lablenam: 'البحث',
                                hintetex: 'اكتب الاسم للبحث عنه',
                                valid: (val) {
                                  return null;
                                },
                                icon: Icons.search,
                                fontsize: 15,
                                readonly: false,
                                iconcolo: Appcoloros.textDark2,
                                ontapicon: () {
                                  // if (mycontroller
                                  //     .sercnamcpany
                                  //     .text
                                  //     .isNotEmpty) {
                                  mycontroller.serchcomp();
                                  // }
                                },
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Iiconbuton(
                                ontap: () {
                                  mycontroller.loadcompany();
                                },
                                sizeicon: 20,
                                iconcolor: Appcoloros.textDark2,
                                icon: Icons.refresh,
                              ),
                              Iiconbuton(
                                ontap: () {
                                  if (mycontroller.isEdite.value == true) {
                                    mycontroller.namcpany.clear();
                                    mycontroller.phoneman.clear();
                                    mycontroller.addressc.clear();
                                    mycontroller.namemang.clear();
                                  }
                                  addcompany(mycontroller);
                                },
                                sizeicon: 20,
                                iconcolor: Appcoloros.textDark2,
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(thickness: 1, color: Appcoloros.textDark2),
                      cardcompanyMy(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Appcoloros.bakgroundDark2,
                    border: Border.all(color: Appcoloros.textDark2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          // padding: EdgeInsets.only(bottom: ),
                          width: double.infinity,
                          // height: 30,
                          decoration: BoxDecoration(
                            color: Appcoloros.bakgroundDark2,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              //
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      'حسابات الشركة',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                        color: Appcoloros.textDark2,
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(() {
                                  if (mycontroller.idcompselect.value > 0) {
                                    return Row(
                                      children: [
                                        Custmbuton(
                                          onTap: () {
                                            mycontroller.closse();
                                          },
                                          title: 'اغلاق',
                                          backcolor: Colors.red,
                                          textcolor: Colors.white,
                                          icon: Icons.close,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Custmbuton(
                                            onTap: () {
                                              paidMove(context);
                                              // print(Puplicvarible.fullName);
                                            },
                                            title: 'حركة مالية',
                                            backcolor: Colors.green,
                                            textcolor: Colors.white,
                                            icon: Icons.account_balance,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 10,
                                          ),
                                          child: Custmbuton(
                                            onTap: () {
                                              movacount(context);
                                            },
                                            title: 'ادخال شحنة',
                                            backcolor: Colors.orange,
                                            textcolor: Colors.black,
                                            icon: Icons.car_crash_outlined,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Container();
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Obx(() {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Appcoloros.bakgroundDark2,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                mycontroller
                                                    .selctnamecomp
                                                    .value,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                mycontroller
                                                    .selctnphocomp
                                                    .value,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                mycontroller
                                                    .selctadrrcomp
                                                    .value,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                mycontroller
                                                    .selctmangcomp
                                                    .value,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Cairo',
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Appcoloros.bakgroundDark2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Obx(() {
                                        if (mycontroller.idcompselect.value >
                                            0) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    5,
                                                  ),
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .grabbing,
                                                    child: Textform(
                                                      mouseCursor:
                                                          SystemMouseCursors
                                                              .click,
                                                      contrler: mycontroller
                                                          .firstDate,
                                                      lablenam: 'تاريخ البداية',
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
                                                          mycontroller
                                                              .firstDate,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    5,
                                                  ),
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .grabbing,
                                                    child: Textform(
                                                      mouseCursor:
                                                          SystemMouseCursors
                                                              .click,
                                                      contrler:
                                                          mycontroller.endDate,
                                                      lablenam: 'تاريخ النهاية',
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
                                                          mycontroller.endDate,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 10,
                                                ),
                                                child: Custmbuton(
                                                  onTap: () {
                                                    if (mycontroller
                                                            .firstDate
                                                            .text
                                                            .isEmpty ||
                                                        mycontroller
                                                            .endDate
                                                            .text
                                                            .isEmpty) {
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'يجب عليك اختيار التاريخ أولاً',
                                                          ),
                                                          backgroundColor: Colors
                                                              .red, // إضافة لون للتمييز
                                                          duration: Duration(
                                                            seconds: 2,
                                                          ), // مدة ظهور الرسالة
                                                        ),
                                                      );
                                                    }
                                                    mycontroller
                                                        .loadacTowDate();
                                                  },
                                                  title: 'فرز حسب التاريخين',
                                                  backcolor: Colors.amber,
                                                  textcolor: Colors.black,
                                                  icon: Icons.date_range,
                                                ),
                                              ),
                                              // Expanded(child: Text('00')),
                                            ],
                                          );
                                        }
                                        return Container();
                                      }),

                                      // Obx(() {
                                      // if (mycontroller.idcompselect.value > 0) {
                                      //   return  Container();};}
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 1, color: Appcoloros.textDark2),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GetBuilder<Homecontroller>(
                                  builder: (builder) {
                                    return GetBuilder<Homecontroller>(
                                      builder: (b) {
                                        if (mycontroller.loadingAcoutnt ==
                                            true) {
                                          return const SizedBox(
                                            height: 70,
                                            width: 70,
                                            child: Center(
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 80,
                                                    width: 80,
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: Colors.orange,
                                                          strokeWidth: 3,
                                                        ),
                                                  ),
                                                  Text(
                                                    "جاري التحميل",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (mycontroller
                                                .idcompselect
                                                .value ==
                                            0) {
                                          return const Center(
                                            child: Text(
                                              'لم يتم تحديد اي شركة بعد',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cairo',
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        } else if (mycontroller
                                            .companyacount
                                            .isEmpty) {
                                          return const Center(
                                            child: Text(
                                              'لا توجد حسابات مسجلة ضمن قيود هذه الشركة',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: 'Cairo',
                                              ),
                                            ),
                                          );
                                        }
                                        return ListView.builder(
                                          itemCount:
                                              mycontroller.companyacount.length,
                                          itemBuilder: (builder, index) {
                                            var data = mycontroller
                                                .companyacount[index];
                                            String id = data['idmov']
                                                .toString();
                                            bool isExpanded =
                                                mycontroller
                                                    .expandedStates[id] ??
                                                false;
                                            return Cardoutcar(
                                              driver: data['namdriv'],
                                              numcar: data['numbcar'],
                                              tycar: data['typcar'],
                                              datt: data['datt'],
                                              castt: formatAny(data['costt']),
                                              nooot: data['nott'],
                                              numMenu: data['numbme'],
                                              idex: data['idex'].toString(),
                                              compsent: data['compsent'],
                                              subb: data['subj'],
                                              a1: formatAny(data['a1']),
                                              a2: formatAny(data['a2']),
                                              a3: formatAny(data['a3']),
                                              a4: formatAny(data['a4']),
                                              a5: formatAny(data['a5']),
                                              a6: formatAny(data['a6']),
                                              a7: formatAny(data['a7']),
                                              a8: formatAny(data['a8']),
                                              a9: formatAny(data['a9']),
                                              delet: () {
                                                deletAcount(context, () async {
                                                  await mycontroller
                                                      .deletAcount(
                                                        data['idmov']
                                                            .toString(),
                                                      );
                                                  Get.back();
                                                });
                                              },
                                              shar: () {
                                                // مثال على استدعاء الدالة من الـ UI
                                                mycontroller.reportInvoice(
                                                  context,
                                                  PdfAction.share,
                                                  formatAny(data['a1']),
                                                  formatAny(data['a2']),
                                                  formatAny(data['a3']),
                                                  formatAny(data['a4']),
                                                  formatAny(data['a5']),
                                                  formatAny(data['a6']),
                                                  formatAny(data['a7']),
                                                  formatAny(data['a8']),
                                                  formatAny(data['a9']),
                                                  formatAny(data['costt']),
                                                  data['numbme'],
                                                  mycontroller
                                                      .selctnamecomp
                                                      .value,
                                                  data['subj'],
                                                  data['namdriv'],
                                                  data['numbcar'],
                                                  data['typcar'],
                                                  data['moveto'],
                                                  formatAny(
                                                    data['acountmoveto'],
                                                  ),
                                                  data['datt'],
                                                  formatAny(data['reblec']),
                                                );
                                              },
                                              onToggleDetails: () =>
                                                  mycontroller.toggleExpansion(
                                                    id,
                                                  ),
                                              isExpanded: isExpanded,
                                              namMove: data['moveto'],
                                              acountMove: formatAny(
                                                data['acountmoveto'],
                                              ),
                                              replce: formatAny(data['reblec']),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                              color: Appcoloros.textDark2,
                            ),
                            CaedPaid(),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: Appcoloros.textDark2),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Appcoloros.bakgroundDark2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            //
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Obx(() {
                                return Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Appcoloros.bakgroundDark2,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange,
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20),
                                      Column(
                                        children: [
                                          _buildAnimatedCounter(
                                            label: "الإجمالي",
                                            valueString:
                                                mycontroller.mov1.value,
                                            currencySymbol: "د.ع",
                                            color: Colors.orange,
                                          ),
                                          _buildAnimatedCounter(
                                            label: "",
                                            valueString:
                                                mycontroller.mov2.value,
                                            currencySymbol: "\$",
                                            color: Colors.orange,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          _buildAnimatedCounter(
                                            label: "المدفوع",
                                            valueString:
                                                mycontroller.paid1.value,
                                            currencySymbol: "د.ع",
                                            color: Colors.green,
                                          ),
                                          _buildAnimatedCounter(
                                            label: "",
                                            valueString:
                                                mycontroller.paid2.value,
                                            currencySymbol: "\$",
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          _buildAnimatedCounter(
                                            label: "الباقي",
                                            valueString:
                                                mycontroller.total1.value,
                                            currencySymbol: "د.ع",
                                            color: Colors.redAccent,
                                          ),
                                          _buildAnimatedCounter(
                                            label: "",
                                            valueString:
                                                mycontroller.total2.value,
                                            currencySymbol: "\$",
                                            color: Colors.redAccent,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Appcoloros.textDark2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Appcoloros.bakgroundDark2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            //
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الرصيد',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Cairo',
                                  color: Colors.orange,
                                ),
                              ),
                              Iiconbuton(
                                ontap: () {
                                  mycontroller.loadBlance();
                                },
                                sizeicon: 20,
                                iconcolor: Appcoloros.textDark2,
                                icon: Icons.refresh,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Appcoloros.buttonDark,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Obx(() {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_upward,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                mycontroller.blOuDs.value,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Appcoloros.bakgroundDark2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_downward,
                                                size: 18,
                                              ),
                                              Text(
                                                mycontroller.blinDs.value,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.bold,
                                                  color: Appcoloros.appbarcolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      _buildBalanceRow(
                                        'د.ع',
                                        mycontroller.blFDs.value,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    child: Divider(
                                      color: Colors.white24,
                                      thickness: 1,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_upward,
                                                size: 18,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                mycontroller.blOUss.value,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      Appcoloros.bakgroundDark2,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_downward,
                                                size: 18,
                                              ),
                                              Text(
                                                mycontroller.blinUss.value,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.bold,
                                                  color: Appcoloros.appbarcolor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      _buildBalanceRow(
                                        '\$',
                                        mycontroller.blFUs.value,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Appcoloros.bakgroundDark2,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            children: [
                              // قسم التواريخ
                              Expanded(
                                flex: 3,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      _buildDateChip(''),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                      _buildDateChip(''),
                                    ],
                                  ),
                                ),
                              ),

                              // قسم الأيقونات
                              Row(
                                children: [
                                  // _buildCircleIcon(
                                  //   Icons.remove_red_eye,
                                  //   Colors.blue,
                                  //   () {},
                                  // ),
                                  const SizedBox(width: 12),
                                  _buildCircleIcon(Icons.add, Colors.green, () {
                                    addBLAce(context);
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        child: Divider(thickness: 0.5, color: Colors.black),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GetBuilder<Homecontroller>(
                            builder: (builder) {
                              return ListView.builder(
                                itemCount: mycontroller.blancList.length,
                                itemBuilder: (context, index) {
                                  var data = mycontroller.blancList[index];
                                  return Cardblans(
                                    typ: data['typ'].toString(),
                                    aco: data['blanc'],
                                    dat: data['datt'],
                                    noo: data['noott'],
                                    ddt: data['datile'],
                                    idx: data['id_ex'].toString(),
                                    delet: () async {
                                      await mycontroller.deletBluanc(
                                        data['idbl'].toString(),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBalanceRow(String currency, String amount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        currency,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5),
      Text(
        amount,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold, // خط رفيع يعطي فخامة للرقم
          fontFamily: 'monospace', // اختيار اختياري للأرقام
        ),
      ),
    ],
  );
}

Widget _buildDateChip(String date) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      date,
      style: const TextStyle(color: Colors.white, fontSize: 13),
    ),
  );
}

Widget _buildCircleIcon(IconData icon, Color color, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: color),
    ),
  );
}

//================== Function Mobile & Desktop =========================
void addcompany(dynamic mycontroller) {
  final mycontroller = Get.find<Homecontroller>();
  Formapp.show(
    title: Text(
      mycontroller.isEdite.value == true ? 'تعديل شركة' : 'اضافة شركة',
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
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                contrler: mycontroller.namcpany,
                lablenam: 'اسم الشركة العام',
                hintetex: 'اكتب اسم الشركة',
                valid: (val) {
                  return null;
                },
                icon: Icons.home,
                fontsize: 12,
                readonly: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                fontcolor: Colors.orange,
                contrler: mycontroller.phoneman,
                lablenam: 'رقم الهاتف',
                hintetex: 'هاتف المدير',
                valid: (val) {
                  return null;
                },
                icon: Icons.call,
                fontsize: 14,
                readonly: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                contrler: mycontroller.addressc,
                lablenam: 'العنوان',
                hintetex: 'ادخل عنوان الشركة',
                valid: (val) {
                  return null;
                },
                icon: Icons.location_on,
                fontsize: 20,
                readonly: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Textform(
                contrler: mycontroller.namemang,
                lablenam: 'المدير',
                hintetex: 'اسم مدير الشركة',
                valid: (val) {
                  return null;
                },
                icon: Icons.person,
                fontsize: 20,
                readonly: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Droupdaownbox(
                prefixIcon: Icon(
                  Icons.merge_type_sharp,
                  color: Appcoloros.buttonDark,
                ),
                label: 'النوع',
                items: const [
                  {'id': '1', 'name': 'مستوردة'},
                  {'id': '2', 'name': 'مصدرة'},
                ],
                selectedValue: mycontroller.selectedType ?? '1',
                onChanged: (val) {
                  mycontroller.changeType(val);
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
            Obx(() {
              return Row(
                children: [
                  Butonsvgtext(
                    title: mycontroller.isEdite.value == true
                        ? 'تعديل'
                        : 'تسجيل',
                    svgasset: mycontroller.isEdite.value == true
                        ? Svgimgrou.add
                        : Svgimgrou.add,
                    onTap: () async {
                      if (mycontroller.isEdite.value == false) {
                        await mycontroller.insertcompany();
                        if (mycontroller.ins == true) {
                          mycontroller.namcpany.clear();
                          mycontroller.phoneman.clear();
                          mycontroller.addressc.clear();
                          mycontroller.namemang.clear();
                          mycontroller.ins = false;
                        } else {
                          Get.snackbar(
                            'خطأ',
                            'فشلت عملية الإضافة، حاول مجدداً',
                          );
                        }
                        if (Get.isDialogOpen!) {
                          Get.back();
                        }
                      } else {
                        mycontroller.updatCompany(
                          mycontroller.curntidcom.value,
                        );
                        Get.back();
                      }
                    },
                  ),
                  Butonsvgtext(
                    title: 'الغاء',
                    svgasset: Svgimgrou.canccel,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              );
            }),
          ],
        ),
        tablet: Container(),
        desktop: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.namcpany,
                      lablenam: 'اسم الشركة العام',
                      hintetex: 'اكتب اسم الشركة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.home,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.phoneman,
                      lablenam: 'رقم الهاتف',
                      hintetex: 'هاتف المدير',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.call,
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.addressc,
                      lablenam: 'العنوان',
                      hintetex: 'ادخل عنوان الشركة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.location_on,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.namemang,
                      lablenam: 'المدير',
                      hintetex: 'اسم مدير الشركة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.person,
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
                        Icons.merge_type_sharp,
                        color: Appcoloros.buttonDark,
                      ),
                      label: 'النوع',
                      items: const [
                        {'id': '1', 'name': 'مستوردة'},
                        {'id': '2', 'name': 'مصدرة'},
                      ],
                      selectedValue: mycontroller.selectedType ?? '1',
                      onChanged: (val) {
                        mycontroller.changeType(val);
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Butonsvgtext(
                  title: mycontroller.isEdite.value == true ? 'تعديل' : 'تسجيل',
                  svgasset: mycontroller.isEdite.value == true
                      ? Svgimgrou.add
                      : Svgimgrou.add,
                  onTap: () async {
                    if (mycontroller.isEdite.value == false) {
                      await mycontroller.insertcompany();
                      if (mycontroller.ins == true) {
                        mycontroller.namcpany.clear();
                        mycontroller.phoneman.clear();
                        mycontroller.addressc.clear();
                        mycontroller.namemang.clear();
                        mycontroller.ins = false;
                      } else {
                        Get.snackbar('خطأ', 'فشلت عملية الإضافة، حاول مجدداً');
                      }
                      if (Get.isDialogOpen!) {
                        Get.back();
                      }
                    } else {
                      mycontroller.updatCompany(mycontroller.curntidcom.value);
                    }
                  },
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

void movacount(BuildContext context) {
  final mycontroller = Get.find<Homecontroller>();
  myDateUtils.setTodayDateOnly(mycontroller.dateaco);
  Formapp.show(
    title: Text(
      'حركة مالية',
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'Cairo',
        color: Appcoloros.textDark2,
        fontWeight: FontWeight.bold,
      ),
    ),
    children: [
      Responsive(
        mobile: Column(),
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
                      contrler: mycontroller.comsent,
                      lablenam: 'الشركة المرسلة',
                      hintetex: 'اكتب اسم الشركة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.home,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.subjcar,
                      lablenam: 'نوع الحمل',
                      hintetex: 'المادة في الحمل',
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
                    child: Textform(
                      contrler: mycontroller.numbrme,
                      lablenam: 'رقم الفاتروة',
                      hintetex: 'رقم المرسل',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.format_list_numbered_rtl,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.grabbing,
                      child: Textform(
                        mouseCursor: SystemMouseCursors.click,
                        contrler: mycontroller.dateaco,
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
                            mycontroller.dateaco,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.drivnam,
                      lablenam: 'اسم السائق',
                      hintetex: ' اكتب اسم سائق السيارة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.person,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.numbcar,
                      lablenam: 'رقم السيارة',
                      hintetex: 'الرقم',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.quick_contacts_mail_sharp,
                      fontsize: 20,
                      readonly: false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.typcare,
                      lablenam: 'نوع السيارة',
                      hintetex: 'مثال: اكتروس',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.car_rental,
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
                      contrler: mycontroller.noteaco,
                      lablenam: 'ملاحظات',
                      hintetex: ' اكتب ملاحظات السيارة',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.person,
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
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.a1,
                            lablenam: 'مناولة السيارات الجانب السوري',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.car_crash_sharp,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.a2,
                            lablenam: 'رسوم جمركية والامانات الضريبة',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.home_outlined,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.a9,
                            lablenam: 'اجور شركة التخليص',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.computer_sharp,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.a8,
                            lablenam: 'مصاريف اخرى',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.backpack_outlined,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.a5,
                            lablenam: 'مصاريف معاملة',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.mark_as_unread,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Textform(
                            contrler: mycontroller.movet,
                            lablenam: 'جهة النقل من - الى',
                            hintetex: 'اكتب نص هنا',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.transform,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //============================
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Textform(
                            contrler: mycontroller.a3,
                            lablenam: 'الجباية',
                            hintetex: 'رقم فقط',
                            valid: (val) {
                              return null;
                            },
                            icon: Icons.back_hand,
                            fontsize: 20,
                            readonly: false,
                            onChanged: (val) {
                              mycontroller.sumcast();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Textform(
                              contrler: mycontroller.a4,
                              lablenam: 'صحة',
                              hintetex: 'رقم فقط',
                              valid: (val) {
                                return null;
                              },
                              icon: Icons.health_and_safety,
                              fontsize: 20,
                              readonly: false,
                              onChanged: (val) {
                                mycontroller.sumcast();
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Textform(
                              contrler: mycontroller.a6,
                              lablenam: 'فحص',
                              hintetex: 'رقم فقط',
                              valid: (val) {
                                return null;
                              },
                              icon: Icons.check,
                              fontsize: 20,
                              readonly: false,
                              onChanged: (val) {
                                mycontroller.sumcast();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Textform(
                              contrler: mycontroller.a7,
                              lablenam: 'اشعاع',
                              hintetex: 'رقم فقط',
                              valid: (val) {
                                return null;
                              },
                              icon: Icons.arrow_circle_up_outlined,
                              fontsize: 20,
                              readonly: false,
                              onChanged: (val) {
                                mycontroller.sumcast();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Textform(
                              contrler: mycontroller.rblce,
                              lablenam: 'مرتجع',
                              hintetex: 'رقم فقط',
                              valid: (val) {
                                return null;
                              },
                              icon: Icons.replay_rounded,
                              fontsize: 20,
                              readonly: false,
                              onChanged: (val) {
                                mycontroller.myreblace.value =
                                    double.tryParse(val.trim()) ?? 0.0;
                                mycontroller.sumcast();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Textform(
                              contrler: mycontroller.acountmo,
                              lablenam: 'اجور نقل',
                              hintetex: 'رقم فقط',
                              valid: (val) {
                                return null;
                              },
                              icon: Icons.arrow_circle_up_outlined,
                              fontsize: 20,
                              readonly: false,
                              onChanged: (val) {
                                mycontroller.sumcast();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Obx(() {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 0, left: 100),
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
                              selectedValue: mycontroller.idexAcou ?? '1',
                              onChanged: (val) {
                                mycontroller.changeIdexacou(val);
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
                          SizedBox(height: 10),
                          Text(
                            'اجمالي الكلفة',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Appcoloros.appbarcolor,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            formatAny(mycontroller.mysumcast.value),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'المــــرتجع',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            formatAny(mycontroller.myreblace.value),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'صافي الشحنة',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            formatAny(mycontroller.myfinal.value),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 50),

            //===========================================
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
                      await mycontroller.insertacvoMov();
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

// ignore: camel_case_types
class cardcompanyMy extends StatelessWidget {
  const cardcompanyMy({super.key});
  @override
  Widget build(BuildContext context) {
    Homecontroller mycontroller = Get.put(Homecontroller());
    void showacount() {
      mycontroller.stastScreen.value = 2;
    }

    void seletComp(String idcom) {
      mycontroller.curntidcom.value = idcom;
    }

    return Expanded(
      child: GetBuilder<Homecontroller>(
        builder: (bulider) {
          return ListView.builder(
            itemCount: mycontroller.companynma.length,
            itemBuilder: (bulider, index) {
              if (mycontroller.companynma.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              var data = mycontroller.companynma[index];
              return InkWell(
                onTap: () async {
                  mycontroller.idcompselect.value = int.parse(
                    data['idcom'].toString(),
                  );
                  mycontroller.selctnamecomp.value = data['namcomp'].toString();
                  mycontroller.selctadrrcomp.value = data['adress'].toString();
                  mycontroller.selctmangcomp.value = data['mang'].toString();
                  mycontroller.selctnphocomp.value = data['phone'].toString();
                  await mycontroller.loadacount();
                },
                child: Cardcompany(
                  showw: () async {
                    showacount();
                    seletComp(data['idcom'].toString());
                    mycontroller.idcompselect.value = int.parse(
                      data['idcom'].toString(),
                    );
                    mycontroller.selctnamecomp.value = data['namcomp']
                        .toString();
                    mycontroller.selctadrrcomp.value = data['adress']
                        .toString();
                    mycontroller.selctmangcomp.value = data['mang'].toString();
                    mycontroller.selctnphocomp.value = data['phone'].toString();
                    await mycontroller.loadacount();
                  },
                  namcomp: data['namcomp'].toString(),
                  mangnam: data['mang'].toString(),
                  phone: data['phone'].toString(),
                  adress: data['adress'].toString(),
                  balance_currency_1: formatAny(data['balance_currency_1']),
                  balance_currency_2: formatAny(data['balance_currency_2']),
                  delet: () {
                    deletCompany(context, () async {
                      await mycontroller.deletcomp(data['idcom'].toString());
                      Get.back();
                    });
                  },
                  edite: () {
                    mycontroller.isEdite.value = true;
                    mycontroller.curntidcom.value = data['idcom'].toString();
                    mycontroller.namcpany.text = data['namcomp'].toString();
                    mycontroller.namemang.text = data['mang'].toString();
                    mycontroller.phoneman.text = data['phone'].toString();
                    mycontroller.addressc.text = data['adress'].toString();
                    addcompany(mycontroller);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void deletCompany(BuildContext context, void Function() delet) {
  Formapp.show(
    title: Text(
      'حذف شركة من الحسابات',
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
                    'يؤدي حذف الشركة الى حذف كافة المعاملات المالية المتعلقة بهذه الشركة اذا كنت متاكد من مواصلة عملية الحذف اضغط على زر الحذف',
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

void deletAcount(BuildContext context, void Function() delet) {
  Formapp.show(
    title: Text(
      'حذف حركة مالية من الحسابات',
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
                    'هل انت متاكد من حذف حركة مالية متعلقة بهذه الشركة؟ اذا كنت متـاكد من ذلك اضغط حذف',
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

class CaedPaid extends StatelessWidget {
  const CaedPaid({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller mycontroller = Get.put(Homecontroller());
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<Homecontroller>(
          builder: (builder) {
            if (mycontroller.loadingAcoutnt == true) {
              // حالة التحميل
              return const SizedBox(
                height: 70,
                width: 70,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          color: Colors.lightGreen,
                          strokeWidth: 3, // لجعل الخط أنحف وأرقى
                        ),
                      ),
                      Text(
                        "جاري التحميل", // أو وضع نسبة مئوية متغيرة
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (mycontroller.idcompselect.value == 0) {
              return const Center(
                child: Text(
                  'لم يتم تحديد اي شركة بعد',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    color: Colors.grey,
                  ),
                ),
              );
            } else if (mycontroller.companyPaidd.isEmpty) {
              // حالة القائمة فارغة
              return const Center(
                child: Text(
                  'لا توجد سندات قبض مسجلة ضمن قيود هذه الشركة',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontFamily: 'Cairo',
                  ),
                ),
              );
            }
            return ListView.builder(
              itemCount: mycontroller.companyPaidd.length,
              itemBuilder: (builder, index) {
                var data = mycontroller.companyPaidd[index];
                return Cardwasll(
                  acount: formatAny(data['costt']),
                  idex: data['idex'].toString(),
                  user: data['nam'].toString(),
                  datt: data['datt'].toString(),
                  noot: data['nott'].toString(),
                  delet: () {
                    deletpaid(context, () async {
                      await mycontroller.deletPaid(data['idpush'].toString());
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void deletpaid(BuildContext context, void Function() delet) {
  Formapp.show(
    title: Text(
      'حذف حركة مالية واردة من الشركة',
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
                    'سوف يتم حذف الحركة المالية المحددة هل انت متأكد من ذلك؟ اذا كنت متأكد اضغط حذف',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20,
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

void paidMove(BuildContext context) {
  final mycontroller = Get.find<Homecontroller>();
  myDateUtils.setTodayDateOnly(mycontroller.paiddate);
  Formapp.show(
    title: Text(
      'حركة مالية مدفوعة',
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Appcoloros.appbarcolor,
      ),
    ),
    children: [
      Responsive(
        mobile: Column(),
        tablet: null,
        desktop: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.paidcost,
                      lablenam: 'الواصل',
                      hintetex: 'المبلغ الحمل',
                      valid: (val) {
                        return null;
                      },
                      icon: Icons.paypal_outlined,
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
                      selectedValue: mycontroller.idexPaid ?? '1',
                      onChanged: (val) {
                        mycontroller.idexPaid = val;
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
                        contrler: mycontroller.paiddate,
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
                            mycontroller.paiddate,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Textform(
                      contrler: mycontroller.paidnott,
                      lablenam: 'ملاحظة',
                      hintetex: 'اكتب ملاحظة هنا',
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
                      await mycontroller.insertPaid();
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

Widget _buildAnimatedCounter({
  required String label,
  required String valueString,
  required String currencySymbol,
  required Color color,
}) {
  double targetValue =
      double.tryParse(valueString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  return Responsive(
    mobile: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          tween: Tween<double>(begin: 0, end: targetValue),
          builder: (context, value, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatAny(value),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: color,
                    fontFamily: 'monospace',
                  ),
                ),
                Text(
                  currencySymbol,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
    tablet: Container(),
    desktop: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Appcoloros.textDark2,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 5),
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          tween: Tween<double>(begin: 0, end: targetValue),
          builder: (context, value, child) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formatAny(value),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: color, // لون النص الأساسي
                    fontFamily: 'Cairo',
                    shadows: [
                      Shadow(
                        blurRadius: 1.0, // قوة التوهج
                        color: color, // لون التوهج
                        offset: Offset(
                          0,
                          0,
                        ), // تحديد اتجاه الظل (0,0 يجعله يتوهج من كل الجوانب)
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  currencySymbol,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: color.withOpacity(0.8),
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
