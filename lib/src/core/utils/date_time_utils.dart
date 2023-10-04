import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDMY(DateTime date) =>
      DateFormat('dd/MM/yyyy').format(date);
}
