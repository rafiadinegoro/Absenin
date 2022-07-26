import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';

class NumberAndDate {
  static dateFormat(String? date) {
    initializeDateFormatting();

    return DateFormat("yyyy-MM-d", "id_ID").format(DateTime.parse(date!));
  }

  static hourpick(DateTime date) {
    initializeDateFormatting();
    return DateFormat("hh:mm", "id_ID").format(date);
  }

  static formattglindo(String? date) {
    initializeDateFormatting();

    return DateFormat("EEEE, dd-MM-yyyy", "id_ID")
        .format(DateTime.parse(date!));
  }

  static rupiahFormat(String? amount) {
    return NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0)
        .format(double.parse(amount.toString()));
  }
}
