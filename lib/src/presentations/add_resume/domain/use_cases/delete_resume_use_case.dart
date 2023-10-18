import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart';

@lazySingleton
class DeleteResumeUseCase extends UseCase<DataState<bool>, String> {
  final ResumeRepository _repository;

  DeleteResumeUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteResume(params);
  }
}
