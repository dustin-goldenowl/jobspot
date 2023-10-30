import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';
import 'package:jobspot/src/presentations/follow/domain/use_cases/get_list_follow_use_case.dart';

part 'follow_state.dart';

@injectable
class FollowCubit extends Cubit<FollowState> {
  late TabController tabController;
  List<String>? _following;
  List<String>? _follower;

  final GetListFollowUseCase _getListFollowUseCase;

  FollowCubit(this._getListFollowUseCase) : super(const FollowState());

  Future refresh() async {
    getListFollower();
    getListFollowing();
  }

  Future getListFollower({List<String>? follower}) async {
    emit(state.copyWith(
      listFollower: null,
      listFollowing: state.listFollowing,
    ));
    _follower ??= follower;
    final response =
        await _getListFollowUseCase.call(params: follower ?? _follower ?? []);
    if (response is DataSuccess) {
      emit(state.copyWith(
          listFollower: response.data, listFollowing: state.listFollowing));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future getListFollowing({List<String>? following}) async {
    emit(state.copyWith(
      listFollower: state.listFollower,
      listFollowing: null,
    ));
    _following ??= following;
    final response =
        await _getListFollowUseCase.call(params: following ?? _following ?? []);
    if (response is DataSuccess) {
      emit(state.copyWith(
          listFollowing: response.data, listFollower: state.listFollower));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }
}
