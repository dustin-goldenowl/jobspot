part of 'view_job_cubit.dart';

class ViewJobState extends Equatable {
  const ViewJobState({
    this.dataState,
    required this.isSave,
    required this.isReadMore,
    required this.isTop,
    this.error,
  });

  final bool isTop;
  final bool isSave;
  final bool isReadMore;
  final DataState<JobEntity?>? dataState;
  final String? error;

  factory ViewJobState.ds() =>
      const ViewJobState(isSave: false, isReadMore: false, isTop: false);

  ViewJobState copyWith({
    DataState<JobEntity?>? dataState,
    bool? isReadMore,
    bool? isTop,
    bool? isSave,
    String? error,
  }) {
    return ViewJobState(
      isSave: isSave ?? this.isSave,
      dataState: dataState ?? this.dataState,
      isReadMore: isReadMore ?? this.isReadMore,
      isTop: isTop ?? this.isTop,
      error: error,
    );
  }

  @override
  List<Object?> get props => [dataState, isReadMore, isTop, error, isSave];
}
