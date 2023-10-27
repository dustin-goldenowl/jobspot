part of 'home_applicant_cubit.dart';

class HomeApplicantState extends Equatable {
  const HomeApplicantState({this.error, this.data, this.jobID});

  final FetchJobData? data;
  final String? error;
  final String? jobID;

  HomeApplicantState copyWith({
    FetchJobData? data,
    String? error,
    String? jobID,
  }) {
    return HomeApplicantState(error: error, data: data, jobID: jobID);
  }

  @override
  List<Object?> get props =>
      [data, error, jobID, jobID != null ? identityHashCode(this) : null];
}
