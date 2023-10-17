part of 'add_work_experience_cubit.dart';

class AddWorkExperienceState extends Equatable {
  const AddWorkExperienceState({
    required this.endDate,
    required this.isWorkNow,
    required this.startDate,
  });

  AddWorkExperienceState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    bool? isWorkNow,
  }) {
    return AddWorkExperienceState(
      endDate: endDate ?? this.endDate,
      isWorkNow: isWorkNow ?? this.isWorkNow,
      startDate: startDate ?? this.startDate,
    );
  }

  factory AddWorkExperienceState.ds() {
    return AddWorkExperienceState(
      startDate: DateTime.now().getDate,
      endDate: DateTime.now().getDate,
      isWorkNow: false,
    );
  }

  final DateTime startDate;
  final DateTime endDate;
  final bool isWorkNow;

  @override
  List<Object> get props => [startDate, endDate, isWorkNow];
}
