import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:flutter/material.dart';

class Cardoutcar extends StatelessWidget {
  final bool isExpanded;
  final String driver;
  final String numcar;
  final String tycar;
  final String subb;
  final String datt;
  final String castt;
  final String a1;
  final String a2;
  final String a3;
  final String a4;
  final String a5;
  final String a6;
  final String a7;
  final String a8;
  final String a9;
  final String nooot;
  final String numMenu;
  final String idex;
  final String compsent;
  final String namMove;
  final String acountMove;
  final String replce;
  final Function() delet;
  final Function() shar;
  final Function() onToggleDetails;
  const Cardoutcar({
    super.key,
    required this.driver,
    required this.numcar,
    required this.tycar,
    required this.datt,
    required this.castt,
    required this.nooot,
    required this.numMenu,
    required this.idex,
    required this.compsent,
    required this.subb,
    required this.delet,
    required this.a1,
    required this.a2,
    required this.a3,
    required this.a4,
    required this.a5,
    required this.a6,
    required this.a7,
    required this.a8,
    required this.a9,
    required this.shar,
    required this.onToggleDetails,
    required this.isExpanded,
    required this.namMove,
    required this.acountMove,
    required this.replce,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 72, 124, 177)),
            borderRadius: BorderRadius.circular(10),
            color: Appcoloros.appbarcolor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text('الشركة المرسلة: $compsent')),
                  Row(
                    children: [
                      InkWell(
                        onTap: shar,
                        child: Icon(
                          Icons.ios_share_rounded,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: delet,
                        child: Icon(Icons.delete, size: 20, color: Colors.red),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('اسم السائق: $driver')),
                    Expanded(child: Text(' رقم السيارة: $numcar')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('نوع السيارة : $tycar')),
                    Expanded(child: Text('نوع المادة: $subb')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('التاريخ: $datt')),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: idex == 1.toString()
                                  ? Appcoloros.buttonDark
                                  : Appcoloros.bakgroundDark2,
                            ),
                            child: Text(
                              'الكلفة: $castt',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 40,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: idex == 1.toString()
                                  ? Appcoloros.buttonDark
                                  : Appcoloros.bakgroundDark2,
                            ),
                            child: Center(
                              child: Text(
                                idex == 1.toString() ? 'د.ع' : '\$',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('ملاحظات: $nooot')),
                    Expanded(child: Text('رقم الفاتورة: $numMenu')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'تفاصيل الكلفة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'الجباية: $a3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcoloros.buttonDark,
                              ),
                            ),
                          ),
                          Expanded(child: Text('صحة: $a4')),
                          Expanded(child: Text('فحص: $a6')),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text('مصاريف اخرى: $a8')),
                          Expanded(child: Text('اجور شركة التخليص: $a9')),
                        ],
                      ),
                      Text('مناولة السيارات الجانب الاردني: $a1'),
                      Text('رسوم جمركية والامانات الضريبية: $a2'),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('مصاريف معاملة: $a5')),
                    Expanded(child: Text('اشعاع: $a7')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Container(),
      desktop: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF062646), const Color(0xFF0A3D70)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange.withOpacity(0.5), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'الشركة المرسلة: $compsent',
                        style: TextStyle(
                          color: Appcoloros.textDark2,
                          fontFamily: 'cairo',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: shar,
                          child: Icon(
                            Icons.ios_share_rounded,
                            size: 20,
                            color: Appcoloros.textDark2,
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: delet,
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.orange[900],
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'اسم السائق: $driver',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ' رقم السيارة: $numcar',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'نوع السيارة : $tycar',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'نوع المادة: $subb',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'التاريخ: $datt',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'رقم الفاتورة: $numMenu',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'ملاحظات: $nooot',
                          style: TextStyle(
                            color: Appcoloros.textDark2,
                            fontFamily: 'cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'تفاصيل الكلفة',
                                style: TextStyle(
                                  color: Appcoloros.buttonDark,
                                  fontFamily: 'cairo',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                onPressed: onToggleDetails,
                                icon: Icon(
                                  isExpanded == true
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Appcoloros.buttonDark,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (isExpanded)
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'منـــاولة السيـارات الجانب السوري: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a1,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'رسوم جمركية والامانات الضريبية: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a2,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'اجـــــــور شركــــــــة التخليــــــص: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a9,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'مصــــــــــــــاريف اخـــــــــــــــرى: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a8,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'مصــــــــــــــاريف معـــــــــــاملة: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a5,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'نقل من - الى : ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    namMove,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'الجباية: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a3,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'صحــة: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a4,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'فحص: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a6,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'اشعاع: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    a7,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'مـرتجع: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    replce,
                                    style: TextStyle(
                                      color: Colors.green[700],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'اجــــور: ',
                                    style: TextStyle(
                                      color: Appcoloros.appbarcolor,
                                      fontFamily: 'cairo',
                                    ),
                                  ),
                                  Text(
                                    acountMove,
                                    style: TextStyle(
                                      color: Colors.orange[900],
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                // Row(
                //   children: [
                //     Text(
                //       castt,
                //       style: TextStyle(
                //         color: Appcoloros.textDark2,
                //         fontFamily: 'cairo',
                //         fontSize: 15,
                //       ),
                //     ),
                //     SizedBox(width: 5),
                //     Text(
                //       idex == 1.toString() ? 'د.ع' : '\$',
                //       style: TextStyle(
                //         color: idex == 1.toString()
                //             ? Appcoloros.textDark
                //             : Appcoloros.bakgroundDark2,
                //         fontFamily: 'cairo',
                //         fontSize: 15,
                //       ),
                //     ),
                //   ],
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    // لون الخلفية الأخضر الخفيف
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    // إضافة تأثير التوهج حول الـ Container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.3),
                        blurRadius: 6, // قوة التوهج
                        spreadRadius: 1, // انتشار التوهج
                      ),
                    ],
                    border: Border.all(
                      color: Colors.green.withOpacity(
                        0.4,
                      ), // إطار خفيف لزيادة التوهج
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // للحفاظ على حجم الـ Container حسب النص
                    mainAxisAlignment:
                        MainAxisAlignment.start, // لضمان البدء من اليمين
                    children: [
                      Text(
                        castt,
                        style: TextStyle(
                          color: Appcoloros.textDark2,
                          fontFamily: 'cairo',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        idex == 1.toString() ? 'د.ع' : '\$',
                        style: TextStyle(
                          color: Appcoloros.textDark,
                          fontFamily: 'cairo',
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
