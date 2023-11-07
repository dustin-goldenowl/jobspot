import 'dart:math';

import 'package:intl/intl.dart';

extension IntExtention on int {
  String getFileSizeString({int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (this == 0) return '0${suffixes[0]}';
    final i = (log(this) / log(1024)).floor();
    return ((this / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  String digits([int number = 2]) => toString().padLeft(number, '0');

  String get toCurrency {
    final fomater = NumberFormat("#,##0.0", "en_US");
    return fomater.format(this);
  }
}
