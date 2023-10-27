import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';

abstract class ViewJobApplicantRepository {
  Future<DataState<List<ResumeApplicantEntity>>> getListApplicant(String jobID);
}
