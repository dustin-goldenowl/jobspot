part of 'job_position_cubit.dart';

class JobPositionState extends Equatable {
  const JobPositionState({this.dataState, required this.text});

  final DataState<List<String>>? dataState;
  final String text;

  JobPositionState copyWith({
    DataState<List<String>>? dataState,
    String? text,
  }) {
    return JobPositionState(dataState: dataState, text: text ?? this.text);
  }

  @override
  List<Object?> get props => [dataState, text];
}
