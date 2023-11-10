import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/authentication_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class SignInEmailPasswordUseCase
    extends UseCase<DataState<bool>, AuthenticationEntity> {
  SignInEmailPasswordUseCase(this._signInRepository);

  final SignInRepository _signInRepository;

  @override
  Future<DataState<bool>> call({required AuthenticationEntity params}) {
    return _signInRepository.signInWithEmailPassword(params);
  }
}
