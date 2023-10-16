part of 'main_cubit.dart';

class MainState extends Equatable {
  const MainState({this.jobID, this.isDeleteAllSaveJob});

  final String? jobID;
  final bool? isDeleteAllSaveJob;

  MainState copyWith({String? jobID, bool? isDeleteAllSaveJob}) {
    return MainState(jobID: jobID, isDeleteAllSaveJob: isDeleteAllSaveJob);
  }

  @override
  List<Object?> get props => [
        jobID,
        jobID != null ? identityHashCode(this) : null,
        isDeleteAllSaveJob,
      ];
}
