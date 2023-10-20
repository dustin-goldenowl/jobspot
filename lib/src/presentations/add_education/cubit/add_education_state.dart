part of 'add_education_cubit.dart';

class AddEducationState extends Equatable {
  const AddEducationState({
    required this.endDate,
    required this.isEduNow,
    required this.startDate,
    required this.isLoading,
    this.error,
  });

  final DateTime startDate;
  final DateTime endDate;
  final bool isEduNow;
  final bool isLoading;
  final String? error;

  AddEducationState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    bool? isEduNow,
    bool? isLoading,
    String? error,
  }) {
    return AddEducationState(
      endDate: endDate ?? this.endDate,
      isEduNow: isEduNow ?? this.isEduNow,
      startDate: startDate ?? this.startDate,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory AddEducationState.ds() {
    return AddEducationState(
      startDate: DateTime.now().getDate,
      endDate: DateTime.now().getDate,
      isEduNow: false,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [startDate, endDate, isEduNow, isLoading, error];
}
