import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/add_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';

abstract class EducationRepository {
  Future<DataState<bool>> addEducation(AddEducationEntity education);

  Future<DataState<bool>> updateEducation(UpdateEducationEntity education);

  Future<DataState<bool>> deleteEducation(String id);
}
