import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

@LazySingleton(as: ApplicantProfileRepository)
class ApplicantProfileRepositoryImpl extends ApplicantProfileRepository {
  @override
  Stream<DataState<List<PostEntity>>> getListPost(int limit) {
    try {
      return FirebaseFirestore.instance
          .collection("posts")
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .limit(limit)
          .snapshots()
          .asyncMap((event) async {
        List<PostModel> listPost =
            event.docs.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
        final response = await Future.wait(
            getListCommentPost(listPost.map((e) => e.id).toList()));
        final user = PrefsUtils.getUserInfo();
        UserModel userModel = UserModel(
          id: FirebaseAuth.instance.currentUser!.uid,
          name: user!.name,
          avatar: user.avatar,
        );
        int index = 0;
        listPost = listPost
            .map((e) => e.copyWith(
                user: userModel, numberOfComments: response[index++].count))
            .toList();
        return DataSuccess(listPost.map((e) => e.toPostEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  List<Future<AggregateQuerySnapshot>> getListCommentPost(List<String> listID) {
    return listID
        .map((e) => FirebaseFirestore.instance
            .collection("comments")
            .where("post", isEqualTo: e)
            .count()
            .get())
        .toList();
  }
}
