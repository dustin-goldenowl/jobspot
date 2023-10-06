import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';

part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionState> {
  StreamSubscription? _postStream;

  ConnectionCubit() : super(const ConnectionState());

  void fetchPostData() {
    emit(state.copyWith());
    if (_postStream != null) _postStream!.cancel();
    _postStream = FirebaseFirestore.instance
        .collection("posts")
        .snapshots()
        .listen((event) async {
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
      emit(state.copyWith(posts: posts));
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
