import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_skill/data/models/skill_model.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart';

@LazySingleton(as: SkillRepository)
class SkillRepositoryImpl extends SkillRepository {
  @override
  Future<DataState<List<SkillEntity>>> getListSkill(String query) async {
    try {
      final response = await XCollection.skill
          .where(
            "title",
            isGreaterThanOrEqualTo: query.toLowerCase(),
            isLessThan: '${query.toLowerCase()}z',
          )
          .get();
      List<SkillEntity> listSkill = response.docs
          .map((e) => SkillModel.fromDocumentSnapshot(e).toSkillEntity())
          .toList();
      if (query.isNotEmpty &&
          listSkill
              .where((element) =>
                  element.title.toLowerCase().compareTo(query.toLowerCase()) ==
                  0)
              .toList()
              .isEmpty) {
        listSkill = [SkillEntity(title: query.capitalizedString), ...listSkill];
      }
      return DataSuccess(listSkill.toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateListSkill(List<SkillEntity> skills) async {
    try {
      for (int i = 0; i < skills.length; i++) {
        if (skills[i].id == null) {
          skills[i] = (await addSkill(skills[i]))!;
        }
      }
      await XCollection.user
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"skill": skills.map((e) => e.id).toList()});
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future<SkillEntity?> addSkill(SkillEntity skill) async {
    try {
      final firestore = XCollection.skill.doc();
      await firestore.set({"title": skill.title.toLowerCase()});
      return SkillEntity(title: skill.title, id: firestore.id);
    } catch (e) {
      return null;
    }
  }
}
