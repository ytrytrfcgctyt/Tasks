import 'package:flutter/material.dart';

class Custmbuton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color backcolor;
  final Color textcolor;
  final IconData icon;
  const Custmbuton({
    super.key,
    required this.onTap,
    required this.title,
    required this.backcolor,
    required this.textcolor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: backcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Row(
            children: [
              Icon(icon, color: textcolor, size: 22),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
