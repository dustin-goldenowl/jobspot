import 'package:flutter/material.dart';

class FilterEntity {
  final int lastUpdate;
  final int? typeWorkplace;
  final int? jobType;
  final int? level;
  final RangeValues? salary;

  FilterEntity({
    required this.lastUpdate,
    this.jobType,
    this.level,
    this.salary,
    this.typeWorkplace,
  });
}
