import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart';

@injectable
class UpdateSkillUseCase extends UseCase<DataState<bool>, List<SkillEntity>> {
  final SkillRepository _repository;

  UpdateSkillUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required List<SkillEntity> params}) {
    return _repository.updateListSkill(params);
  }
}
