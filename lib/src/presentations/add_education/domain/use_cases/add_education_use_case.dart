import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/add_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart';

@lazySingleton
class AddEducationUseCase extends UseCase<DataState<bool>, AddEducationEntity> {
  final EducationRepository _repository;

  AddEducationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required AddEducationEntity params}) {
    return _repository.addEducation(params);
  }
}
