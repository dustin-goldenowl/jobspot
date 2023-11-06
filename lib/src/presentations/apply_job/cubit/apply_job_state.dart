part of 'apply_job_cubit.dart';

class ApplyJobState extends Equatable {
  const ApplyJobState({
    this.resume,
    this.isLoading = false,
    this.dataState,
    required this.isTop,
  });

  final ResumeEntity? resume;
  final bool isLoading;
  final DataState? dataState;
  final bool isTop;

  ApplyJobState copyWith({
    ResumeEntity? resume,
    bool isLoading = false,
    DataState? dataState,
    bool? isTop,
  }) {
    return ApplyJobState(
      resume: resume,
      dataState: dataState,
      isLoading: isLoading,
      isTop: isTop ?? this.isTop,
    );
  }

  @override
  List<Object?> get props => [resume, dataState, isLoading, isTop];
}
