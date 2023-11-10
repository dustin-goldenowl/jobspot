import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_education/data/models/add_education_model.dart';
import 'package:jobspot/src/presentations/add_education/data/models/update_education_model.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/add_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart';

@LazySingleton(as: EducationRepository)
class EducationRepositoryImpl extends EducationRepository {
  @override
  Future<DataState<bool>> addEducation(AddEducationEntity education) async {
    try {
      await XCollection.education
          .doc()
          .set(AddEducationModel.fromEntity(education).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateEducation(
      UpdateEducationEntity education) async {
    try {
      await XCollection.education
          .doc(education.id)
          .update(UpdateEducationModel.fromEntity(education).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteEducation(String id) async {
    try {
      await XCollection.education.doc(id).delete();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
