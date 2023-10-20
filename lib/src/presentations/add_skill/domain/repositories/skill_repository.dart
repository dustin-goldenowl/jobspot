import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';

abstract class SkillRepository {
  Future<DataState<List<SkillEntity>>> getListSkill(String query);

  Future<DataState<bool>> updateListSkill(List<SkillEntity> skills);
}
