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
    required this.isLoading,
    required this.requirements,
    this.dataState,
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
  final bool isLoading;
  final DataState? dataState;
  final List<String> requirements;

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
    List<String>? requirements,
    bool isLoading = false,
    DataState? dataState,
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
      requirements: requirements ?? this.requirements,
      isLoading: isLoading,
      dataState: dataState,
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
      endDate: DateTime.now().getDate,
      startDate: DateTime.now().getDate,
      requirements: const [],
      isLoading: false,
    );
  }

  factory AddJobState.fromUpdateJobEntity(UpdateJobEntity entity) {
    return AddJobState(
      typeWorkplace: entity.typeWorkplace,
      jobType: entity.jobType,
      level: entity.level,
      salary: entity.salary,
      jobLocation: entity.jobLocation,
      jobPosition: entity.jobPosition.capitalizedString,
      description: entity.description,
      endDate: entity.endDate,
      startDate: entity.startDate,
      requirements: const [],
      isLoading: false,
    );
  }

  JobEntity get getJobEntity => JobEntity(
        description: description,
        jobLocation: jobLocation,
        jobPosition: jobPosition,
        jobType: jobType,
        level: level,
        salary: salary,
        typeWorkplace: typeWorkplace,
        startDate: startDate,
        endDate: endDate,
        requirements: requirements,
      );

  UpdateJobEntity getUpdateJobEntity(String id) => UpdateJobEntity(
        description: description,
        jobLocation: jobLocation,
        jobPosition: jobPosition,
        jobType: jobType,
        level: level,
        salary: salary,
        typeWorkplace: typeWorkplace,
        requirements: requirements,
        startDate: startDate,
        endDate: endDate,
        id: id,
      );

  @override
  List<Object?> get props => [
        typeWorkplace,
        jobType,
        jobPosition,
        jobLocation,
        description,
        level,
        salary,
        endDate,
        startDate,
        isLoading,
        dataState,
        requirements,
      ];
}
