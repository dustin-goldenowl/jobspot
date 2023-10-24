import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
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
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .delete(),
        FirebaseUtils.deleteImage(PrefsUtils.getUserInfo()?.avatar ?? ""),
        FirebaseAuth.instance.currentUser!.delete(),
      ]);
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future deletePost() async {
    final collection = await FirebaseFirestore.instance
        .collection("posts")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    await Future.wait(collection.docs
        .map((e) =>
            FirebaseFirestore.instance.collection("posts").doc(e.id).delete())
        .toList());
  }

  Future deleteComment() async {
    final collection = await FirebaseFirestore.instance
        .collection("comments")
        .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    await Future.wait(collection.docs
        .map((e) => FirebaseFirestore.instance
            .collection("comments")
            .doc(e.id)
            .delete())
        .toList());
  }
}
