part of 'add_resume_cubit.dart';

class AddResumeState extends Equatable {
  const AddResumeState({
    this.file,
    this.time,
    required this.isLoading,
    this.dataState,
  });

  final PlatformFile? file;
  final DateTime? time;
  final bool isLoading;
  final DataState? dataState;

  AddResumeState copyWith({
    PlatformFile? file,
    DateTime? time,
    bool isLoading = false,
    DataState? dataState,
  }) {
    return AddResumeState(
      isLoading: isLoading,
      file: file ?? this.file,
      time: time ?? this.time,
      dataState: dataState,
    );
  }

  factory AddResumeState.ds() => const AddResumeState(isLoading: false);

  @override
  List<Object?> get props => [file, time, isLoading, dataState];
}
