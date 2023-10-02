import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/email_password_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class SignInEmailPasswordUseCase
    extends UseCase<DataState<UserCredential>, EmailPasswordEntity> {
  SignInEmailPasswordUseCase(this._signInRepository);

  final SignInRepository _signInRepository;

  @override
  Future<DataState<UserCredential>> call(
      {required EmailPasswordEntity params}) {
    return _signInRepository.signInWithEmailPassword(params);
  }
}
