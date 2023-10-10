import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDMY(DateTime date) =>
      DateFormat('dd/MM/yyyy').format(date);
}
