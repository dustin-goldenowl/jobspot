part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.error, this.data, this.jobID});

  final FetchJobData? data;
  final String? error;
  final String? jobID;

  HomeState copyWith({
    FetchJobData? data,
    String? error,
    String? jobID,
  }) {
    return HomeState(error: error, data: data, jobID: jobID);
  }

  @override
  List<Object?> get props =>
      [data, error, jobID, jobID != null ? identityHashCode(this) : null];
}
