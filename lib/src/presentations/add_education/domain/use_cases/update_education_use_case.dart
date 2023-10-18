import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart';

@lazySingleton
class UpdateEducationUseCase
    extends UseCase<DataState<bool>, UpdateEducationEntity> {
  final EducationRepository _repository;

  UpdateEducationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateEducationEntity params}) {
    return _repository.updateEducation(params);
  }
}
