import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/function/formatAny.dart';
import 'package:taskes/widgt/dilogDelet.dart';
import 'package:flutter/material.dart';

class Cardblans extends StatelessWidget {
  final String typ;
  final String aco;
  final String dat;
  final String noo;
  final String ddt;
  final String idx;
  final void Function() delet;
  const Cardblans({
    super.key,
    required this.typ,
    required this.aco,
    required this.dat,
    required this.noo,
    required this.ddt,
    required this.idx,
    required this.delet,
  });

  @override
  Widget build(BuildContext context) {
    //  Homecontroller mycontrloer = Get.put(Homecontroller());
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Appcoloros.bakgroundDark2,
        borderRadius: BorderRadius.circular(10), // حواف أنعم
        border: Border.all(color: Appcoloros.textDark2.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  typ == '1'
                      ? Icon(
                          Icons.arrow_upward,
                          size: 16,
                          color: Colors.redAccent,
                        )
                      : Icon(
                          Icons.arrow_downward,
                          size: 16,
                          color: Colors.green,
                        ),
                  const SizedBox(width: 4),
                  Text(
                    typ == '1' ? 'صرف' : 'قبض',
                    style: TextStyle(
                      color: typ == '1' ? Colors.redAccent : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                dat,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10), // مسافة بين السطور
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  ddt,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  formatAny(aco) +
                      (int.tryParse(idx.toString()) == 1
                          ? ' د.ع'
                          : ' \$'), // وضعنا الأقواس هنا
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: typ == '1' ? Colors.redAccent : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white10, height: 20), // فاصل بصري خفيف
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  noo,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13,
                    // fontStyle: FontStyle.italic,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  // _buildActionIcon(Icons.edit, Colors.blue[300]!, () {}),
                  const SizedBox(width: 15),
                  _buildActionIcon(Icons.delete, Colors.red[300]!, () {
                    dilogDELETE(
                      context,
                      'حذف حركة رصيد',
                      'سوف يتم حذف حركة الرصيد. اذا كنت متأكد من عملية الحذف اضغط حذف',
                      delet,
                    );
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildActionIcon(IconData icon, Color color, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(icon, size: 18, color: color),
  );
}
