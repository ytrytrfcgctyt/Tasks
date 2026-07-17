import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:taskes/widgt/puplicc/iiconbuton.dart';
import 'package:flutter/material.dart';

class Cardcompany extends StatelessWidget {
  final void Function() showw;
  final String namcomp;
  final String mangnam;
  final String phone;
  final String adress;
  final String balance_currency_1;
  final String balance_currency_2;
  final void Function() delet;
  final void Function() edite;
  const Cardcompany({
    super.key,
    required this.showw,
    required this.namcomp,
    required this.mangnam,
    required this.phone,
    required this.adress,
    required this.balance_currency_1,
    required this.balance_currency_2,
    required this.delet,
    required this.edite,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Appcoloros.cardbak,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Appcoloros.buttonDark),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      namcomp,
                      style: TextStyle(
                        color: Appcoloros.textDark2,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Iiconbuton(
                        ontap: delet,
                        sizeicon: 20,
                        iconcolor: Colors.red,
                        icon: Icons.delete,
                      ),
                      Iiconbuton(
                        ontap: edite,
                        sizeicon: 20,
                        iconcolor: Appcoloros.textDark2,
                        icon: Icons.edit,
                      ),
                      Iiconbuton(
                        ontap: showw,
                        sizeicon: 20,
                        iconcolor: Appcoloros.textDark2,
                        icon: Icons.remove_red_eye_sharp,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(mangnam)),
                  Expanded(
                    child: Row(children: [Expanded(child: Text(phone))]),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(adress)),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Appcoloros.buttonDark,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '$balance_currency_1 د.ع',
                                style: TextStyle(
                                  color: Appcoloros.textDark,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Appcoloros.textDark2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '$balance_currency_2 \$',
                              style: TextStyle(
                                color: Appcoloros.textDark,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
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
      ),
      tablet: Container(),
      desktop: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Appcoloros.textDark2),
            color: Appcoloros.bakgroundDark2,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      namcomp,
                      style: TextStyle(
                        color: Appcoloros.textDark2,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Iiconbuton(
                        ontap: delet,
                        sizeicon: 20,
                        iconcolor: Colors.red,
                        icon: Icons.delete,
                      ),
                      Iiconbuton(
                        ontap: edite,
                        sizeicon: 20,
                        iconcolor: Appcoloros.textDark2,
                        icon: Icons.edit,
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(right: 10),
                      //   child: Icon(Icons.add, size: 17),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Iiconbuton(
                          ontap: showw,
                          sizeicon: 17,
                          iconcolor: Appcoloros.textDark2,
                          icon: Icons.remove_red_eye_sharp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      mangnam,
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: Appcoloros.textDark2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            phone,
                            style: TextStyle(
                              fontFamily: 'cairo',
                              color: Appcoloros.textDark2,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      adress,
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: Appcoloros.textDark2,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Appcoloros.buttonDark,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '$balance_currency_1 د.ع',
                                style: TextStyle(
                                  color: Appcoloros.textDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Appcoloros.bakgroundDark,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '$balance_currency_2 \$',
                              style: TextStyle(
                                color: Appcoloros.textDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
      ),
    );
  }
}
