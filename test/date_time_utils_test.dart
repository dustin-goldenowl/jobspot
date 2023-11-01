import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';

void main() {
  group('DateTime Format', () {
    test('formatDMY', () {
      expect(DateTimeUtils.formatDMY(DateTime(2023, 11, 01)), "01/11/2023");
    });

    test('formatMonthYear', () {
      expect(DateTimeUtils.formatMonthYear(DateTime(2023, 11)), "Nov 2023");
    });

    test('formatCVTime', () {
      expect(
        DateTimeUtils.formatCVTime(DateTime(2023, 11, 01, 10, 30)),
        "01 Nov 2023 at 10:30 AM",
      );
    });

    test('getDate', () {
      expect(
        DateTime(2023, 11, 01, 10, 30).getDate,
        DateTime(2023, 11, 01),
      );
    });
  });
}
