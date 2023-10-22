import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@lazySingleton
class StreamUserInfoUseCase
    extends StreamUseCase<DataState<UserEntity>, dynamic> {
  final ApplicantProfileRepository _repository;

  StreamUserInfoUseCase(this._repository);

  @override
  Stream<DataState<UserEntity>> call({params}) {
    return _repository.getUserInfo();
  }
}
