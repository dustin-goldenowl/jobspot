import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';

@lazySingleton
class GetResumeUseCase extends UseCase<DataState<List<ResumeEntity>>, String> {
  final ViewApplicantProfileRepository _repository;

  GetResumeUseCase(this._repository);

  @override
  Future<DataState<List<ResumeEntity>>> call({required String params}) {
    return _repository.getResume(params);
  }
}
