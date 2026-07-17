import 'package:intl/intl.dart';

// String formatAny(Object? value) {
//   final formatter = NumberFormat("#,###");
//   final String valueString = (value ?? "0").toString();
//   final double doubleValue = double.tryParse(valueString) ?? 0.0;
//   return formatter.format(doubleValue);
// }
String formatAny(Object? value, {int type = 1}) {
  final double doubleValue = double.tryParse((value ?? "0").toString()) ?? 0.0;

  // اختيار النمط بناءً على النوع
  // النوع 1: بدون كسور -> #,###
  // النوع 2: بكسرين -> #,###.00
  final String pattern = (type == 2) ? "#,###.00" : "#,###";

  final formatter = NumberFormat(pattern);
  return formatter.format(doubleValue);
}

extension NumberFormatter on Object? {
  String toCurrency() => formatAny(this);
  String toIraqiDinar() => "${formatAny(this)} د.ع";
}
