import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';

@injectable
class GetEducationUseCase
    extends UseCase<DataState<List<EducationEntity>>, String> {
  final ViewApplicantProfileRepository _repository;

  GetEducationUseCase(this._repository);

  @override
  Future<DataState<List<EducationEntity>>> call({required String params}) {
    return _repository.getEducation(params);
  }
}
