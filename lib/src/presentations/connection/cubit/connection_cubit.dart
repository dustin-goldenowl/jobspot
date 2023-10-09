import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart';

part 'connection_state.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final FetchPostUseCase _useCase;

  StreamSubscription? _postStream;
  ScrollController scrollController = ScrollController();
  int _limit = 15;

  ConnectionCubit(this._useCase) : super(const ConnectionState(isMore: true)) {
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
    _postStream = _useCase.call(params: limit).listen((event) {
      if (event is DataSuccess) {
        _limit = event.data!.limit;
        emit(state.copyWith(
          posts: event.data!.posts,
          isMore: event.data!.isMore,
        ));
      } else {
        emit(state.copyWith(posts: state.posts, error: event.error));
      }
    });
  }
}
