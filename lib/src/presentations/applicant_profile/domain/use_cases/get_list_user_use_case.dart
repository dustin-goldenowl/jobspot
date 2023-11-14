import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';

@lazySingleton
class GetListUserUseCase extends UseCase<List<UserModel>, Set<String>> {
  final ApplicantProfileRepository _repository;

  GetListUserUseCase(this._repository);

  @override
  Future<List<UserModel>> call({required Set<String> params}) {
    return _repository.getListUser(params);
  }
}
