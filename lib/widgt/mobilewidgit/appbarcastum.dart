import 'package:taskes/constant/app/appcoloros.dart';
import 'package:flutter/material.dart';

class Appbarcastum extends StatelessWidget {
  final Widget? child;
  const Appbarcastum({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcoloros.appbarcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
