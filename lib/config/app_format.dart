import 'package:intl/intl.dart';

class AppFormat {
  static const DATE_FORMAT = 'd MMM yyyy';
  static const DEFAULT_LOCALE = 'id_ID';
  static String date(String stringDate) {
    DateTime dateTime = DateTime.parse(stringDate);
    return DateFormat(DATE_FORMAT, DEFAULT_LOCALE).format(dateTime);
  }
}