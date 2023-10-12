part of 'view_job_cubit.dart';

class ViewJobState extends Equatable {
  const ViewJobState({this.dataState, required this.isReadMore});

  final DataState<JobEntity>? dataState;
  final bool isReadMore;

  ViewJobState copyWith({
    DataState<JobEntity>? dataState,
    bool? isReadMore,
  }) {
    return ViewJobState(
      dataState: dataState,
      isReadMore: isReadMore ?? this.isReadMore,
    );
  }

  @override
  List<Object?> get props => [dataState, isReadMore];
}
