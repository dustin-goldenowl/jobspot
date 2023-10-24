import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';

@lazySingleton
class GetWorkExperienceUseCase
    extends UseCase<DataState<List<WorkExperienceEntity>>, String> {
  final ViewApplicantProfileRepository _repository;

  GetWorkExperienceUseCase(this._repository);

  @override
  Future<DataState<List<WorkExperienceEntity>>> call({required String params}) {
    return _repository.getWorkExperience(params);
  }
}
