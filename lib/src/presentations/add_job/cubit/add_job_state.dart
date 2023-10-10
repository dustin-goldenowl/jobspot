part of 'add_job_cubit.dart';

class AddJobState extends Equatable {
  const AddJobState({
    required this.typeWorkplace,
    required this.jobType,
    required this.level,
    required this.jobLocation,
    required this.jobPosition,
    required this.description,
  });

  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final int level;
  final String jobPosition;
  final String description;

  AddJobState copyWith({
    int? typeWorkplace,
    int? jobType,
    int? jobLocation,
    int? level,
    String? jobPosition,
    String? description,
  }) {
    return AddJobState(
      typeWorkplace: typeWorkplace ?? this.typeWorkplace,
      jobType: jobType ?? this.jobType,
      level: level ?? this.level,
      jobLocation: jobLocation ?? this.jobLocation,
      jobPosition: jobPosition ?? this.jobPosition,
      description: description ?? this.description,
    );
  }

  factory AddJobState.ds() {
    return const AddJobState(
      jobType: -1,
      level: -1,
      typeWorkplace: -1,
      jobLocation: -1,
      jobPosition: "",
      description: "",
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
      ];
}
