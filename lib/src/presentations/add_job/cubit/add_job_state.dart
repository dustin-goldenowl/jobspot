part of 'add_job_cubit.dart';

class AddJobState extends Equatable {
  const AddJobState({
    required this.typeWorkplace,
    required this.jobType,
    required this.level,
    required this.salary,
    required this.jobLocation,
    required this.jobPosition,
    required this.description,
    required this.endDate,
    required this.startDate,
  });

  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final int salary;
  final String jobPosition;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  AddJobState copyWith({
    int? typeWorkplace,
    int? jobType,
    int? jobLocation,
    int? level,
    int? salary,
    String? jobPosition,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return AddJobState(
      typeWorkplace: typeWorkplace ?? this.typeWorkplace,
      jobType: jobType ?? this.jobType,
      level: level ?? this.level,
      jobLocation: jobLocation ?? this.jobLocation,
      jobPosition: jobPosition ?? this.jobPosition,
      description: description ?? this.description,
      salary: salary ?? this.salary,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
    );
  }

  factory AddJobState.ds() {
    return AddJobState(
      jobType: -1,
      level: -1,
      typeWorkplace: -1,
      jobLocation: -1,
      jobPosition: "",
      description: "",
      salary: -1,
      endDate: DateTime.now(),
      startDate: DateTime.now(),
    );
  }

  @override
  List<Object> get props => [
        typeWorkplace,
        jobType,
        jobPosition,
        jobLocation,
        description,
        level,
        salary,
        endDate,
        startDate
      ];
}
