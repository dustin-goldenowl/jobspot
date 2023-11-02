part of 'view_job_cubit.dart';

class ViewJobState extends Equatable {
  const ViewJobState({
    this.dataState,
    required this.isReadMore,
    required this.isTop,
    this.error,
  });

  final bool isTop;
  final bool isReadMore;
  final DataState<JobEntity?>? dataState;
  final String? error;

  ViewJobState copyWith({
    DataState<JobEntity?>? dataState,
    bool? isReadMore,
    bool? isTop,
    String? error,
  }) {
    return ViewJobState(
      dataState: dataState ?? this.dataState,
      isReadMore: isReadMore ?? this.isReadMore,
      isTop: isTop ?? this.isTop,
      error: error,
    );
  }

  @override
  List<Object?> get props => [dataState, isReadMore, isTop, error];
}
