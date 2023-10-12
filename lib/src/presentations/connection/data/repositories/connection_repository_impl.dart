import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/fetch_post_data.dart';
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart';

@LazySingleton(as: ConnectionRepository)
class ConnectionRepositoryImpl extends ConnectionRepository {
  @override
  Stream<DataState<FetchPostData>> fetchPostData(int limit) {
    try {
      return FirebaseFirestore.instance
          .collection("posts")
          // .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          //TODO This command is to filter posts that are not from the current account.
          .limit(limit)
          .snapshots()
          .asyncMap((event) async {
        List<PostModel> posts = [];
        for (var element in event.docs) {
          posts.add(PostModel.fromQueryDocumentSnapshot(element));
        }
        final data = await Future.wait([
          getListUser(posts),
          FirebaseFirestore.instance
              .collection("posts")
              // .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
              //TODO This command is to filter posts that are not from the current account.
              .count()
              .get(),
        ]);
        final listUser = data.first as List<UserModel>;
        final documents = data.last as AggregateQuerySnapshot;
        posts = posts
            .map(
              (e) => e.copyWith(
                user: listUser.firstWhere((element) => element.id == e.owner),
              ),
            )
            .toList();
        return DataSuccess(FetchPostData(
          isMore: limit < documents.count,
          posts: posts.map((e) => e.toPostEntity()).toList(),
          limit: limit < documents.count ? limit : documents.count,
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
    final userData = await Future.wait(listUserId
        .map((id) =>
            FirebaseFirestore.instance.collection("users").doc(id).get())
        .toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }
}
