part of 'add_appreciation_cubit.dart';

class AddAppreciationState extends Equatable {
  const AddAppreciationState({
    required this.endDate,
    required this.isLoading,
    this.error,
  });

  final DateTime endDate;
  final bool isLoading;
  final String? error;

  AddAppreciationState copyWith({
    DateTime? endDate,
    bool? isLoading,
    String? error,
  }) {
    return AddAppreciationState(
      endDate: endDate ?? this.endDate,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory AddAppreciationState.ds() {
    return AddAppreciationState(
      endDate: DateTime.now().getDate,
      isLoading: false,
    );
  }

  @override
  List<Object?> get props => [endDate, isLoading, error];
}
