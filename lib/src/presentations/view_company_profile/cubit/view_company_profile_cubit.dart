import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart';
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
  final StreamListPostUseCase _streamListPostUseCase;

  ViewCompanyProfileCubit(
    this._getListJobUseCase,
    this._streamListPostUseCase,
    this._getUserInfoUseCase,
    this._favouritePostUseCase,
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

  Future _getListJob(String uid) async {
    final response = await _getListJobUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listJob: response.data));
    }
  }

  void _getListPost(String uid) {
    if (_postSubscription != null) _postSubscription!.cancel();
    _postSubscription = _streamListPostUseCase
        .call(params: GetPostEntity(limit: 15, uid: uid))
        .listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      }
    });
  }

  Future _getUserInfo(String uid) async {
    final response = await _getUserInfoUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(user: response.data));
    }
  }

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataSuccess) {}
  }
}
