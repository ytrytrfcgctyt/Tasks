import 'package:taskes/constant/app/appcoloros.dart';
import 'package:taskes/constant/system/responsive.dart';
import 'package:flutter/material.dart';

class Iiconbuton extends StatelessWidget {
  final void Function() ontap;
  final double sizeicon;
  final Color iconcolor;
  final IconData icon;
  const Iiconbuton({
    super.key,
    required this.ontap,
    required this.sizeicon,
    required this.iconcolor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Responsive(
        mobile: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Appcoloros.buttonDark,
            ),
            child: Icon(icon, size: sizeicon, color: iconcolor),
          ),
        ),
        tablet: Container(),
        desktop: Icon(icon, size: sizeicon, color: iconcolor),
      ),
    );
  }
}
