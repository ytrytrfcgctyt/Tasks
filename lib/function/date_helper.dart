import 'package:flutter/material.dart';

class DateServices {
  static Future<void> selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black, // لون التقويم
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // تنسيق التاريخ بصيغة YYYY/MM/DD
      String formattedDate =
          "${pickedDate.year}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}";

      controller.text = formattedDate;
    }
  }
}
