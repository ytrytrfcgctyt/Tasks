import 'package:taskes/constant/app/appcoloros.dart';
import 'package:flutter/material.dart';

class Droupdaownbox extends StatelessWidget {
  final String label;
  final List<Map<String, String>> items; // هنا صرنا ندعم id + name
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String? hintText;
  final bool isRequired;
  final Color bordercolor;
  final Color lablecolor;
  final Color textcolor;
  final Color hintcolor;
  final Color textforcolor;
  final double fontSize;
  final double lableSize;
  final double bourderrudise;
  final double floatingLabelSize;
  final Widget? prefixIcon;
  final Color? dropdownColor;
  const Droupdaownbox({
    super.key,
    required this.label,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    this.hintText,
    required this.isRequired,
    required this.bordercolor,
    required this.lablecolor,
    required this.textcolor,
    required this.hintcolor,
    required this.fontSize,
    required this.lableSize,
    required this.bourderrudise,
    this.prefixIcon,
    required this.textforcolor,
    this.dropdownColor,
    required this.floatingLabelSize,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: Appcoloros.bakgroundDark2,
      style: TextStyle(
        color: Colors.orange,
        fontSize: fontSize,
        fontFamily: 'cairo',
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(bourderrudise),
          borderSide: BorderSide(color: bordercolor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(bourderrudise),
          borderSide: BorderSide(color: bordercolor, width: 1.5),
        ),
        label: Text(
          label,
          style: TextStyle(fontSize: lableSize, color: lablecolor),
        ),
        labelStyle: TextStyle(
          color: lablecolor,
          // fontWeight: FontWeight.bold,
          fontSize: lableSize,
          fontFamily: 'cairo',
        ),
        floatingLabelStyle: TextStyle(
          color: lablecolor,
          fontSize: floatingLabelSize,
          // fontWeight: FontWeight.bold,
          fontFamily: 'cairo',
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintcolor,
          fontSize: 15,
          fontFamily: 'cairo',
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),

      initialValue: selectedValue?.toString(),
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item['id'],
          child: Text(
            item['name'] ??
                item['nam'] ??
                "بدون اسم", // 👈 يتحقق من name أو nam أو يضع نصاً بديلاً
            style: TextStyle(
              color: textcolor,
              fontSize: fontSize,
              // fontWeight: FontWeight.bold,
              fontFamily: 'cairo',
            ),
          ),
        );
      }).toList(),
      validator: isRequired
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'يجب اختيار $label';
              }
              return null;
            }
          : null,
    );
  }
}
