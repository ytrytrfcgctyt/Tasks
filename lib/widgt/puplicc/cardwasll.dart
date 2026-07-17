import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:flutter/material.dart';

class Cardwasll extends StatelessWidget {
  final String acount;
  final String idex;
  final String user;
  final String datt;
  final String noot;
  final void Function() delet;
  const Cardwasll({
    super.key,
    required this.acount,
    required this.idex,
    required this.user,
    required this.datt,
    required this.noot,
    required this.delet,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Appcoloros.appbarcolor,
            borderRadius: BorderRadius.circular(15),
            border: Border(
              bottom: BorderSide(
                color: Colors.black, // لون الخط أسود
                width: 1, // سمك الخط (يمكنك زيادته حسب الرغبة)
              ),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text('المبلغ: $acount'),
                          SizedBox(width: 10),
                          Container(
                            width: 26,
                            height: 26,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: idex == '1'
                                  ? Appcoloros.buttonDark
                                  : Appcoloros.bakgroundDark2,
                            ),
                            child: Center(
                              child: Text(
                                idex == '1' ? 'د.ع' : '\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: idex == '1'
                                      ? Appcoloros.textDark
                                      : Appcoloros.buttonDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Text('التاريخ: $datt')),
                    // Expanded(child: Text('رقم السند: 5582')),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(child: Text('ملاحظات: $noot')),
                    Row(
                      children: [
                        InkWell(
                          onTap: delet,
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
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
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          decoration: BoxDecoration(
            color: Appcoloros.bakgroundDark2,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16), // مساحة داخلية مريحة
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            acount,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            idex == '1' ? 'د.ع' : '\$',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.orange,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // قسم التاريخ
                    Text(
                      'التاريخ: $datt',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(
                    height: 1,
                    color: Colors.black12,
                  ), // فاصل خفيف جداً
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'ملاحظات: $noot',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: delet,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                        size: 22,
                      ),
                      constraints: const BoxConstraints(), // تقليل مساحة الضغط
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
