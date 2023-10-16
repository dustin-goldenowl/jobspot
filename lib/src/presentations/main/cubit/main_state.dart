part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({this.jobID});

  final String? jobID;

  MainState copyWith({String? jobID}) {
    return MainState(jobID: jobID);
  }

  @override
  List<Object?> get props =>
      [jobID, jobID != null ? identityHashCode(this) : null];
}
