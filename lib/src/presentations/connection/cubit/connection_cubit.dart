import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';

part 'connection_state.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final FetchPostUseCase _fetchPostUseCase;
  final FavouritePostUseCase _favouritePostUseCase;
  final SharePostUseCase _sharePostUseCase;

  StreamSubscription? _postStream;
  ScrollController scrollController = ScrollController();
  int _limit = 15;

  ConnectionCubit(
    this._fetchPostUseCase,
    this._favouritePostUseCase,
    this._sharePostUseCase,
  ) : super(const ConnectionState(isMore: true, isLoading: false)) {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        fetchPostData(limit: _limit + 15, isLoading: false);
      }
    });
  }

  void fetchPostData({int limit = 15, bool isLoading = true}) {
    emit(state.copyWith(posts: isLoading ? null : state.posts, isMore: true));
    if (_postStream != null) _postStream!.cancel();
    _postStream = _fetchPostUseCase.call(params: limit).listen((event) {
      if (event is DataSuccess) {
        _limit = event.data!.limit;
        emit(state.copyWith(
          posts: event.data!.listData,
          isMore: event.data!.isMore,
        ));
      } else {
        emit(state.copyWith(posts: state.posts, error: event.error));
      }
    });
  }

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataFailed) {
      print(response.error);
    }
  }

  Future sharePost(SharePostEntity entity) async {
    emit(state.copyWith(isLoading: true, posts: state.posts));
    final response = await _sharePostUseCase.call(params: entity);
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false, posts: state.posts));
    } else {
      emit(state.copyWith(error: response.error, posts: state.posts));
    }
  }

  @override
  Future<void> close() {
    if (_postStream != null) _postStream!.cancel();
    scrollController.dispose();
    return super.close();
  }
}
