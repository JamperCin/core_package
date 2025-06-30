import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTimeUtils? _instance;

  DateTimeUtils._internal();

  factory DateTimeUtils() {
    return _instance ??= DateTimeUtils._internal();
  }

  String formatDate(String dateStr,
      {String format = 'EEE, MMM d yyyy, hh:mm a'}) {
    try {
      DateTime parsedDate = DateTime.parse(dateStr);
      return DateFormat(format).format(parsedDate);
    } catch (e) {
      return dateStr;
    }
  }

  String formatDateTime(DateTime date, {String format = 'EEE, MMM d yyyy, hh:mm a'}) {
    return DateFormat(format).format(date);
  }

  String getCurrentDate({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(DateTime.now());
  }
}
