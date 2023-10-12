part of 'apply_job_cubit.dart';

class ApplyJobState extends Equatable {
  const ApplyJobState({
    this.file,
    this.time,
    this.isLoading = false,
    this.dataState,
  });

  final PlatformFile? file;
  final DateTime? time;
  final bool isLoading;
  final DataState? dataState;

  ApplyJobState copyWith({
    PlatformFile? file,
    DateTime? time,
    bool isLoading = false,
    DataState? dataState,
  }) {
    return ApplyJobState(
      file: file,
      time: time,
      dataState: dataState,
      isLoading: isLoading,
    );
  }

  @override
  List<Object?> get props => [file, time, dataState, isLoading];
}
