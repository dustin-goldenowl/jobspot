import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart';

@lazySingleton
class GetListSkillUseCase
    extends UseCase<DataState<List<SkillEntity>>, String> {
  final SkillRepository _repository;

  GetListSkillUseCase(this._repository);

  @override
  Future<DataState<List<SkillEntity>>> call({required String params}) {
    return _repository.getListSkill(params);
  }
}
