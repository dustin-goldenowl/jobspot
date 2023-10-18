import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart';

@lazySingleton
class DeleteEducationUseCase extends UseCase<DataState<bool>, String> {
  final EducationRepository _repository;

  DeleteEducationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteEducation(params);
  }
}
