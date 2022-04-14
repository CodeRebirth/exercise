import 'package:exercise/const/string_const.dart';
import 'package:intl/intl.dart';

class DateFormater {
  static String format(String source) {
    if (source.toUpperCase() == "UNKNOWN") {
      return "Unknown";
    }
    return DateFormat(DATE_FORMAT)
        .format(DateTime.parse(source.split('-').reversed.join()));
  }
}
