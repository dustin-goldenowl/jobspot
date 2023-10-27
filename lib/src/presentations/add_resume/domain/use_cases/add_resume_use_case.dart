import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart';

@lazySingleton
class AddResumeUseCase extends UseCase<DataState<String>, AddResumeEntity> {
  final ResumeRepository _repository;

  AddResumeUseCase(this._repository);

  @override
  Future<DataState<String>> call({required AddResumeEntity params}) {
    return _repository.addResume(params);
  }
}
