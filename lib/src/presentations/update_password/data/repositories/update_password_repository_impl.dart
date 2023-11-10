import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart';

@LazySingleton(as: UpdatePasswordRepository)
class UpdatePasswordRepositoryImpl extends UpdatePasswordRepository {
  @override
  Future<DataState<bool>> changePassword(String newPassword) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> validatePassword(String oldPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final authCredentials = EmailAuthProvider.credential(
      email: user?.email ?? "",
      password: oldPassword,
    );
    try {
      final authResult =
          await user!.reauthenticateWithCredential(authCredentials);
      return DataSuccess(authResult.user != null);
    } catch (e) {
      print(e);
      return const DataSuccess(false);
    }
  }
}
