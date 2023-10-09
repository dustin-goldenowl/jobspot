part of 'add_job_cubit.dart';

class AddJobState extends Equatable {
  const AddJobState({
    required this.typeWorkplace,
    required this.jobType,
    required this.jobLocation,
    required this.jobPosition,
    required this.description,
  });

  final int typeWorkplace;
  final int jobType;
  final int jobLocation;
  final String jobPosition;
  final String description;

  AddJobState copyWith({
    int? typeWorkplace,
    int? jobType,
    int? jobLocation,
    String? jobPosition,
    String? description,
  }) {
    return AddJobState(
      typeWorkplace: typeWorkplace ?? this.typeWorkplace,
      jobType: jobType ?? this.jobType,
      jobLocation: jobLocation ?? this.jobLocation,
      jobPosition: jobPosition ?? this.jobPosition,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props => [
        typeWorkplace,
        jobType,
        jobPosition,
        jobLocation,
        description,
      ];
}
