part of 'add_work_experience_cubit.dart';

class AddWorkExperienceState extends Equatable {
  const AddWorkExperienceState({
    required this.endDate,
    required this.isWorkNow,
    required this.startDate,
    required this.isLoading,
    this.error,
  });

  final DateTime startDate;
  final DateTime endDate;
  final bool isWorkNow;
  final bool isLoading;
  final String? error;

  AddWorkExperienceState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    bool? isWorkNow,
    bool? isLoading,
    String? error,
  }) {
    return AddWorkExperienceState(
      endDate: endDate ?? this.endDate,
      isWorkNow: isWorkNow ?? this.isWorkNow,
      startDate: startDate ?? this.startDate,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory AddWorkExperienceState.ds() {
    return AddWorkExperienceState(
      startDate: DateTime.now().getDate,
      endDate: DateTime.now().getDate,
      isWorkNow: false,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [startDate, endDate, isWorkNow, isLoading, error];
}
