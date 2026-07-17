import 'package:taskes/constant/app/appcoloros.dart';
import 'package:flutter/material.dart';

class Textform extends StatelessWidget {
  final String lablenam;
  final String hintetex;
  final bool? obscuer;
  final double fontsize;
  final Function()? ontapicon;
  final TextEditingController? contrler;
  final String? Function(String?) valid;
  final TextInputType? tepcpord;
  final IconData icon;
  final Color? iconcolo;
  final Color? fontcolor;
  final double? iconsisz;
  final void Function()? ontap;
  final void Function(String)? onChanged;
  final bool readonly;
  final MouseCursor? mouseCursor;
  const Textform({
    super.key,
    required this.lablenam,
    required this.hintetex,
    this.obscuer,
    this.ontapicon,
    this.contrler,
    required this.valid,
    this.tepcpord,
    required this.icon,
    this.iconcolo,
    this.iconsisz,
    this.fontcolor,
    required this.fontsize,
    this.ontap,
    required this.readonly,
    this.onChanged,
    this.mouseCursor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        mouseCursor: mouseCursor ?? SystemMouseCursors.text,
        onChanged: onChanged,
        readOnly: readonly,
        onTap: ontap,
        obscureText: obscuer == null || obscuer == false ? false : true,
        validator: valid,
        controller: contrler,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 14,
          fontFamily: 'cairo',
        ),
        keyboardType: tepcpord,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcoloros.buttonDark, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcoloros.buttonDark, width: 1),
          ),
          label: Text(lablenam, style: TextStyle(fontFamily: "cairo")),
          labelStyle: TextStyle(
            color: Appcoloros.textDark2,
            fontWeight: FontWeight.bold,
            fontSize: fontsize,
            fontFamily: 'cairo',
          ),
          floatingLabelStyle: TextStyle(
            color: Appcoloros.buttonDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          hint: Text(
            hintetex,
            style: TextStyle(
              color: Appcoloros.textDark,
              fontSize: 12,
              // fontWeight: FontWeight.bold,
              fontFamily: 'cairo',
            ),
          ),
          hintFadeDuration: Duration(seconds: 1),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: InkWell(
            onTap: ontapicon,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(icon, color: Appcoloros.buttonDark, size: iconsisz),
            ),
          ),
        ),
      ),
    );
  }
}
