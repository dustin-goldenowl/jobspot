import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class SignInGoogleUseCase
    extends UseCase<DataState<bool>, GoogleSignInAccount> {
  SignInGoogleUseCase(this._signInRepository);

  final SignInRepository _signInRepository;

  @override
  Future<DataState<bool>> call({required GoogleSignInAccount params}) {
    return _signInRepository.signInWithGoogle(params);
  }
}
