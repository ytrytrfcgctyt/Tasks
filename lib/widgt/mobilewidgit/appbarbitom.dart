import 'package:taskes/constant/app/appcoloros.dart';
import 'package:flutter/material.dart';

class Appbarbitom extends StatelessWidget {
  final Widget? child;
  const Appbarbitom({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcoloros.appbarcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
