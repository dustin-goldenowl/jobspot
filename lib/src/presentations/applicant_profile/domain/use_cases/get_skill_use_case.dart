import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@injectable
class GetSkillUseCase
    extends UseCase<DataState<List<SkillEntity>>, List<String>> {
  final ApplicantProfileRepository _repository;

  GetSkillUseCase(this._repository);

  @override
  Future<DataState<List<SkillEntity>>> call({required List<String> params}) {
    return _repository.getSkill(params);
  }
}
