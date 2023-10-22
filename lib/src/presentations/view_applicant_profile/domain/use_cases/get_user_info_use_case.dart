import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';

@lazySingleton
class GetUserInfoUseCase extends UseCase<DataState<UserEntity>, String> {
  final ViewApplicantProfileRepository _repository;

  GetUserInfoUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call({required String params}) {
    return _repository.getUserInfo(params);
  }
}
