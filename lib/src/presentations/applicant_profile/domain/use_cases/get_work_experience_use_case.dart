import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@lazySingleton
class GetWorkExperienceUseCase
    extends StreamUseCase<DataState<List<WorkExperienceEntity>>, dynamic> {
  final ApplicantProfileRepository _repository;

  GetWorkExperienceUseCase(this._repository);

  @override
  Stream<DataState<List<WorkExperienceEntity>>> call({params}) {
    return _repository.getWorkExperience();
  }
}
