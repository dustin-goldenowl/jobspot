import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart';

@lazySingleton
class RegisterGoogleUseCase
    extends UseCase<DataState<UserCredential>, GoogleSignInAccount> {
  RegisterGoogleUseCase(this._signUpRepository);

  final SignUpRepository _signUpRepository;

  @override
  Future<DataState<UserCredential>> call(
      {required GoogleSignInAccount params}) {
    return _signUpRepository.signUpWithGoogle(params);
  }
}
