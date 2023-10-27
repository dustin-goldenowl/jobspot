import 'package:flutter/material.dart';

class SearchEntity {
  final int limit;
  final int lastUpdate;
  final String query;
  final int? location;
  final int? typeWorkplace;
  final int? jobType;
  final int? level;
  final RangeValues? salary;

  SearchEntity({
    required this.limit,
    required this.query,
    required this.lastUpdate,
    this.location,
    this.jobType,
    this.level,
    this.typeWorkplace,
    this.salary,
  });

  SearchEntity copyWith({
    int? limit,
    String? query,
    int? location,
    int? lastUpdate,
    int? typeWorkplace,
    int? jobType,
    int? level,
    RangeValues? salary,
  }) {
    return SearchEntity(
      limit: limit ?? this.limit,
      query: query ?? this.query,
      location: location ?? this.location,
      jobType: jobType ?? this.jobType,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      level: level ?? this.level,
      salary: salary ?? this.salary,
      typeWorkplace: typeWorkplace ?? this.typeWorkplace,
    );
  }
}
