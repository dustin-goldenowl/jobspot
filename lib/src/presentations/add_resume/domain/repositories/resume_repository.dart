import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

abstract class ResumeRepository {
  Future<DataState<bool>> addResume(AddResumeEntity resume);

  Future<DataState<bool>> deleteResume(ResumeEntity resume);
}
