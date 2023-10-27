import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/fetch_post_data.dart';
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart';

@LazySingleton(as: ConnectionRepository)
class ConnectionRepositoryImpl extends ConnectionRepository {
  @override
  Stream<DataState<FetchPostData>> fetchPostData(int limit) {
    try {
      final myPostCollection = XCollection.post
          .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid);
      return myPostCollection.limit(limit).snapshots().asyncMap((event) async {
        List<PostModel> posts = [];
        for (var element in event.docs) {
          posts.add(PostModel.fromQueryDocumentSnapshot(element));
        }
        final data = await Future.wait([
          getListUser(posts),
          myPostCollection.count().get(),
          ...getListCommentPost(posts.map((e) => e.id).toList()),
        ]);
        final listUser = data.first as List<UserModel>;
        final count = (data[1] as AggregateQuerySnapshot).count;
        int index = 2;
        posts = posts
            .map((e) => e.copyWith(
                  user: listUser.firstWhere((element) => element.id == e.owner),
                  numberOfComments:
                      (data[index++] as AggregateQuerySnapshot).count,
                ))
            .toList();
        return DataSuccess(FetchPostData(
          isMore: limit < count,
          posts: posts.map((e) => e.toPostEntity()).toList(),
          limit: limit < count ? limit : count,
        ));
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<List<UserModel>> getListUser(List<PostModel> datas) async {
    Set<String> listUserId = {};
    for (var data in datas) {
      listUserId.add(data.owner);
    }
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
}
