import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/follow_user_use_case.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';

part 'view_company_profile_state.dart';

@injectable
class ViewCompanyProfileCubit extends Cubit<ViewCompanyProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _postSubscription;

  final GetListJobUseCase _getListJobUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;
  final FavouritePostUseCase _favouritePostUseCase;
  final FollowUserUseCase _followUserUseCase;
  final StreamListPostUseCase _streamListPostUseCase;

  ViewCompanyProfileCubit(
    this._getListJobUseCase,
    this._streamListPostUseCase,
    this._getUserInfoUseCase,
    this._favouritePostUseCase,
    this._followUserUseCase,
  ) : super(const ViewCompanyProfileState(isTop: false)) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          240 - 2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
  }

  void init(String uid) {
    _getListJob(uid);
    _getListPost(uid);
    _getUserInfo(uid);
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  void toTab(int index) => tabController.animateTo(index);

  Future openWebsite() async {
    if (await canLaunchUrlString(state.user?.website ?? "")) {
      await launchUrlString(state.user?.website ?? "");
    }
  }

  Future _getListJob(String uid) async {
    final response = await _getListJobUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listJob: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void _getListPost(String uid) {
    if (_postSubscription != null) _postSubscription!.cancel();
    _postSubscription = _streamListPostUseCase
        .call(params: GetPostEntity(limit: 15, uid: uid))
        .listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      } else {
        emit(state.copyWith(error: event.error));
      }
    });
  }

  Future _getUserInfo(String uid) async {
    final response = await _getUserInfoUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(user: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  Future followUser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    UserModel user = UserModel.fromEntity(state.user!);
    final isFollow = user.follower.contains(uid);
    isFollow ? user.follower.remove(uid) : user.follower.add(uid);

    emit(state.copyWith(user: user.toUserEntity()));
    final response = await _followUserUseCase.call(
        params: FavouriteEntity(
      uidTo: user.id,
      id: state.user!.id,
      listFavourite: user.follower,
    ));
    if (response is DataFailed) {
      isFollow ? user.follower.add(uid) : user.follower.remove(uid);
      emit(state.copyWith(user: user.toUserEntity()));
    }
  }
}
