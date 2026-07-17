import 'package:intl/intl.dart';

String formatAny(Object? value) {
  final formatter = NumberFormat("#,###");
  final String valueString = (value ?? "0").toString();
  final double doubleValue = double.tryParse(valueString) ?? 0.0;
  return formatter.format(doubleValue);
}

extension NumberFormatter on Object? {
  String toCurrency() => formatAny(this);
  String toIraqiDinar() => "${formatAny(this)} د.ع";
}
