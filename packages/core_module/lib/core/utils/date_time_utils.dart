import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTimeUtils? _instance;

  DateTimeUtils._internal();

  factory DateTimeUtils() {
    return _instance ??= DateTimeUtils._internal();
  }

  String formatDate(String dateStr, {String format = 'EEE, MMM d yyyy, hh:mm a'}) {
    DateTime parsedDate = DateTime.parse(dateStr);
    return DateFormat(format).format(parsedDate);
  }
}
