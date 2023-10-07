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
              scrollController.position.maxScrollExtent &&
          state.isMore) {
        fetchPostData(limit: _limit + 15, isLoading: false);
      }
    });
  }

  void fetchPostData({int limit = 5, bool isLoading = true}) {
    if (isLoading) emit(state.copyWith());
    _limit = limit;
    if (_postStream != null) _postStream!.cancel();
    _postStream = FirebaseFirestore.instance
        .collection("posts")
        // .where("owner", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //TODO This command is to filter posts that are not from the current account.
        .limit(limit)
        .snapshots()
        .listen((event) async {
      final documents =
          await FirebaseFirestore.instance.collection("posts").get();
      List<PostModel> posts = [];
      for (var element in event.docs) {
        posts.add(PostModel.fromDocumentSnapshot(element));
      }
      final listUser = await getListUser(posts);
      posts = posts
          .map(
            (e) => e.copyWith(
              user: listUser.firstWhere((element) => element.id == e.owner),
            ),
          )
          .toList();
      emit(state.copyWith(posts: posts, isMore: _limit < documents.size));
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
