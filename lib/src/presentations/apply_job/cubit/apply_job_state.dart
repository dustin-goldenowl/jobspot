part of 'apply_job_cubit.dart';

class ApplyJobState extends Equatable {
  const ApplyJobState({
    this.file,
    this.time,
    this.isLoading = false,
    this.dataState,
    required this.isTop,
  });

  final PlatformFile? file;
  final DateTime? time;
  final bool isLoading;
  final DataState? dataState;
  final bool isTop;

  ApplyJobState copyWith({
    PlatformFile? file,
    DateTime? time,
    bool isLoading = false,
    DataState? dataState,
    bool? isTop,
  }) {
    return ApplyJobState(
      file: file,
      time: time,
      dataState: dataState,
      isLoading: isLoading,
      isTop: isTop ?? this.isTop,
    );
  }

  @override
  List<Object?> get props => [file, time, dataState, isLoading, isTop];
}
