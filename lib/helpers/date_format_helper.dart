import 'package:intl/intl.dart';

class DateFormatHelper {
  static String formatToDay(DateTime date) {
    return DateFormat.E('en_US').format(date);
  }

  static String formatToGMT7(DateTime time) {
    return DateFormat.Hm().format(
      time.add(
        const Duration(hours: 7),
      ),
    );
  }
}
