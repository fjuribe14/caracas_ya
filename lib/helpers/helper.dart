import 'package:intl/intl.dart';

class Helper {
  static String formatCurrency({
    required double value,
  }) {
    return '₡${value.toStringAsFixed(2)}';
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static String formatData({
    required DateTime date,
    String? format = 'dd-MM-yyyy',
  }) =>
      DateFormat(format).format(date);
}
