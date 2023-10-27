part of 'view_job_applicant_cubit.dart';

class ViewJobApplicantState extends Equatable {
  const ViewJobApplicantState({this.listResume, this.error});

  final List<ResumeApplicantEntity>? listResume;
  final String? error;

  ViewJobApplicantState copyWith({
    List<ResumeApplicantEntity>? listResume,
    String? error,
  }) {
    return ViewJobApplicantState(
      listResume: listResume ?? this.listResume,
      error: error,
    );
  }

  @override
  List<Object?> get props => [listResume, error];
}
