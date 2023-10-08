import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  StreamSubscription? _postStream;
  ScrollController scrollController = ScrollController();
  int _limit = 15;

  ConnectionCubit() : super(const ConnectionState(isMore: true)) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchPostData(limit: _limit + 15, isLoading: false);
      }
    });
  }

  void fetchPostData({int limit = 15, bool isLoading = true}) {
    emit(state.copyWith(posts: isLoading ? null : state.posts, isMore: true));
    if (_postStream != null) _postStream!.cancel();
    _postStream = FirebaseFirestore.instance
        .collection("posts")
        // .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //TODO This command is to filter posts that are not from the current account.
        .limit(limit)
        .snapshots()
        .listen((event) async {
      List<PostModel> posts = [];
      for (var element in event.docs) {
        posts.add(PostModel.fromDocumentSnapshot(element));
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
      _limit = limit < documents.count ? limit : documents.count;
      emit(state.copyWith(posts: posts, isMore: limit < documents.count));
    });
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
