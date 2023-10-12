import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDMY(DateTime date) =>
      DateFormat('dd/MM/yyyy').format(date);

  static String formatCVTime(DateTime date) =>
      DateFormat("dd MMM yyyy 'at' hh:mm a").format(date);
}
