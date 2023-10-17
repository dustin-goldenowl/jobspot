import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

@lazySingleton
class DeletePostUseCase extends UseCase<DataState<bool>, PostEntity> {
  final ApplicantProfileRepository _repository;

  DeletePostUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required PostEntity params}) {
    return _repository.deletePost(params);
  }
}
