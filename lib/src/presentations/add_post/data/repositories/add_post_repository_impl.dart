import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/add_post/data/models/post_model.dart';
import 'package:jobspot/src/presentations/add_post/data/models/update_post_model.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart';

@LazySingleton(as: AddPostRepository)
class AddPostRepositoryImpl extends AddPostRepository {
  @override
  Future<DataState> addPost(PostEntity post) async {
    try {
      final firestorePost =
          FirebaseFirestore.instance.collection("posts").doc();
      final firestoreUser = FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid);
      final images = await Future.wait(post.images
          .map((e) => FirebaseUtils.uploadImage(
                folder: "posts/${firestorePost.id}",
                name: DateTime.now().microsecondsSinceEpoch.toString(),
                image: e,
              ))
          .toList());
      PostModel postModel = PostModel.fromPostEntity(post);
      postModel.images.addAll(images);
      final firestore = await Future.wait([
        firestorePost.set(postModel.toJson()),
        firestoreUser.get(),
      ]);
      final userModel = UserModel.fromJsonFirebase(
          (firestore.last as DocumentSnapshot<Map<String, dynamic>>).data()!);
      userModel.posts.add(firestorePost.id);
      await firestoreUser.update({"posts": userModel.posts});
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> updatePost(UpdatePostEntity post) async {
    try {
      final firestorePost =
          FirebaseFirestore.instance.collection("posts").doc(post.id);
      for (var element in post.removeImages) {
        FirebaseUtils.deleteImage(element);
      }
      final images = await Future.wait(post.images
          .map((e) => FirebaseUtils.uploadImage(
                folder: "posts/${firestorePost.id}",
                name: DateTime.now().microsecondsSinceEpoch.toString(),
                image: e,
              ))
          .toList());
      UpdatePostModel postModel = UpdatePostModel.fromEntity(post);
      postModel.images.addAll(images);
      await firestorePost.update(postModel.toJson());
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }
}
