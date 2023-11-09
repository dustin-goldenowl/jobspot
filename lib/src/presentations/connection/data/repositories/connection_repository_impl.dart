import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/share_post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';

@LazySingleton(as: ConnectionRepository)
class ConnectionRepositoryImpl extends ConnectionRepository {
  final SendNotificationUseCase _sendNotificationUseCase;

  ConnectionRepositoryImpl(this._sendNotificationUseCase);

  @override
  Stream<DataState<FetchLazyData<PostEntity>>> fetchPostData(int limit) {
    try {
      final myPostCollection = XCollection.post
          .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid);
      return myPostCollection.limit(limit).snapshots().asyncMap((event) async {
        List<PostModel> posts =
            event.docs.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
        final data = await Future.wait([
          getListUser(posts),
          myPostCollection.count().get(),
          getListSharePost(posts.map((e) => e.sharePostID).toSet()),
          ...getListCommentPost(posts.map((e) => e.id).toList()),
        ]);
        final listUser = data.first as List<UserModel>;
        final count = (data[1] as AggregateQuerySnapshot).count;
        final listSharePost = data[2] as List<PostModel>;
        int index = 3;
        posts = posts
            .map((e) => e.copyWith(
                  user: listUser.firstWhere((element) => element.id == e.owner),
                  numberOfComments:
                      (data[index++] as AggregateQuerySnapshot).count,
                  sharePost: e.sharePostID != null
                      ? listSharePost
                          .firstWhere((element) => element.id == e.sharePostID)
                      : null,
                ))
            .toList();
        return DataSuccess(FetchLazyData(
          isMore: limit < count,
          listData: posts.map((e) => e.toPostEntity()).toList(),
          limit: limit < count ? limit : count,
        ));
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<List<PostModel>> getListSharePost(Set<String?> sharePost) async {
    final list = [...sharePost];
    list.remove(null);
    final response =
        await Future.wait(list.map((e) => XCollection.post.doc(e).get()));
    List<PostModel> listPost =
        response.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
    final listUser = await getListUser(listPost);
    listPost = listPost
        .map((e) => e.copyWith(
            user: listUser.firstWhere((element) => element.id == e.owner)))
        .toList();
    return listPost;
  }

  Future<List<UserModel>> getListUser(List<PostModel> datas) async {
    Set<String> listUserId = datas.map((e) => e.owner).toSet();
    final userData = await Future.wait(
        listUserId.map((id) => XCollection.user.doc(id).get()).toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  List<Future<AggregateQuerySnapshot>> getListCommentPost(List<String> listID) {
    return listID
        .map((e) =>
            XCollection.comment.where("post", isEqualTo: e).count().get())
        .toList();
  }

  @override
  Future<DataState<bool>> sharePost(SharePostBase entity) async {
    try {
      if (entity is SharePostEntity) {
        final model = SharePostModel.fromEntity(entity);
        final myCollection = XCollection.post.doc();
        await Future.wait([
          XCollection.post.doc(entity.postID).update({
            "share": [...entity.share, FirebaseAuth.instance.currentUser!.uid]
          }),
          myCollection.set(model.toMap()),
        ]);
        _sendNotificationUseCase.call(
            params: SendNotificationEntity(
          action: myCollection.id,
          to: entity.toUid,
          type: AppTags.share,
        ));
      } else if (entity is UpdateSharePostEntity) {
        await XCollection.post
            .doc(entity.postID)
            .update({"description": entity.description});
      }
      return DataSuccess(true);
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }
}
