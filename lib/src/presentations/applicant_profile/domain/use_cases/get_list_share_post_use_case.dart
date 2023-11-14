import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';

@lazySingleton
class GetListSharePostUseCase extends UseCase<List<PostModel>, Set<String?>> {
  final ApplicantProfileRepository _repository;

  GetListSharePostUseCase(this._repository);

  @override
  Future<List<PostModel>> call({required Set<String?> params}) {
    return _repository.getListSharePost(params);
  }
}
