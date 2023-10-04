import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_business_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart';

@lazySingleton
class RegisterBusinessUseCase
    extends UseCase<DataState<UserCredential>, RegisterBusinessEntity> {
  RegisterBusinessUseCase(this._signUpRepository);

  final SignUpRepository _signUpRepository;

  @override
  Future<DataState<UserCredential>> call(
      {required RegisterBusinessEntity params}) {
    return _signUpRepository.signUpBusiness(params);
  }
}
