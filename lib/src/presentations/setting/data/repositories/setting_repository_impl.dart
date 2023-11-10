import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl extends SettingRepository {
  @override
  Future<DataState<bool>> deleteAccount() async {
    try {
      await Future.wait([
        deletePost(),
        deleteComment(),
        XCollection.user.doc(FirebaseAuth.instance.currentUser!.uid).delete(),
        FirebaseUtils.deleteImage(PrefsUtils.getUserInfo()?.avatar ?? ""),
        FirebaseAuth.instance.currentUser!.delete(),
      ]);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future deletePost() async {
    final collection = await XCollection.post
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    await Future.wait(collection.docs
        .map((e) => XCollection.post.doc(e.id).delete())
        .toList());
  }

  Future deleteComment() async {
    final collection = await XCollection.comment
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    await Future.wait(collection.docs
        .map((e) => XCollection.comment.doc(e.id).delete())
        .toList());
  }
}
