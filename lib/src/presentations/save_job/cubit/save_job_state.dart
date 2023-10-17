part of 'save_job_cubit.dart';

class SaveJobState extends Equatable {
  const SaveJobState({
    this.listJob,
    this.error,
    this.deleteJobID,
    this.isDeleteAllSaveJob,
  });

  final String? error;
  final List<JobEntity>? listJob;
  final String? deleteJobID;
  final bool? isDeleteAllSaveJob;

  SaveJobState copyWith({
    String? error,
    List<JobEntity>? listJob,
    String? deleteJobID,
    bool? isDeleteAllSaveJob,
  }) {
    return SaveJobState(
      listJob: listJob,
      error: error,
      deleteJobID: deleteJobID,
      isDeleteAllSaveJob: isDeleteAllSaveJob,
    );
  }

  @override
  List<Object?> get props => [listJob, error, deleteJobID, isDeleteAllSaveJob];
}
