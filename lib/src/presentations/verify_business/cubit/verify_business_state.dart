part of 'verify_business_cubit.dart';

class VerifyBusinessState extends Equatable {
  const VerifyBusinessState({
    required this.isLoading,
    this.file,
    this.time,
    this.error,
  });

  final bool isLoading;
  final PlatformFile? file;
  final DateTime? time;
  final String? error;

  VerifyBusinessState copyWith({
    bool isLoading = false,
    PlatformFile? file,
    DateTime? time,
    String? error,
  }) {
    return VerifyBusinessState(
      isLoading: isLoading,
      file: file,
      time: time,
      error: error,
    );
  }

  @override
  List<Object?> get props => [file, time, error, isLoading];
}
