part of 'save_job_cubit.dart';

class SaveJobState extends Equatable {
  const SaveJobState({this.listJob, this.error, this.deleteJobID});

  final String? error;
  final List<JobEntity>? listJob;
  final String? deleteJobID;

  SaveJobState copyWith({
    String? error,
    List<JobEntity>? listJob,
    String? deleteJobID,
  }) {
    return SaveJobState(
      listJob: listJob,
      error: error,
      deleteJobID: deleteJobID,
    );
  }

  @override
  List<Object?> get props => [listJob, error, deleteJobID];
}
