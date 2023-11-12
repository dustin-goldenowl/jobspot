import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart';
import 'package:jobspot/src/presentations/company_profile/domain/router/company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/company_profile/domain/use_cases/delete_job_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'company_profile_state.dart';

@injectable
class CompanyProfileCubit extends Cubit<CompanyProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _postSubscription;
  StreamSubscription? _userInfoSubscription;

  final FavouritePostUseCase _favouritePostUseCase;
  final GetListJobUseCase _getListJobUseCase;
  final StreamListPostUseCase _streamListPostUseCase;
  final StreamUserInfoUseCase _streamUserInfoUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final DeleteJobUseCase _deleteJobUseCase;
  final SharePostUseCase _sharePostUseCase;
  final SaveJobUseCase _saveJobUseCase;

  CompanyProfileCubit(
    this._favouritePostUseCase,
    this._streamUserInfoUseCase,
    this._streamListPostUseCase,
    this._getListJobUseCase,
    this._deletePostUseCase,
    this._deleteJobUseCase,
    this._sharePostUseCase,
    this._saveJobUseCase,
  ) : super(const CompanyProfileState(isTop: false, isLoading: false)) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          240 - 2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
    getUserInfo();
    getListJob();
    getListPost();
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  void toTab(int index) => tabController.animateTo(index);

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  Future getListJob() async {
    final response = await _getListJobUseCase.call(
        params: FirebaseAuth.instance.currentUser!.uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listJob: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void getListPost() {
    if (_postSubscription != null) _postSubscription!.cancel();
    _postSubscription = _streamListPostUseCase
        .call(
            params: GetPostEntity(
                limit: 15, uid: FirebaseAuth.instance.currentUser!.uid))
        .listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      } else {
        emit(state.copyWith(error: event.error));
      }
    });
  }

  void getUserInfo() {
    if (_userInfoSubscription != null) _userInfoSubscription!.cancel();
    emit(state.copyWith(user: PrefsUtils.getUserInfo()));
    _userInfoSubscription = _streamUserInfoUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(user: event.data));
      }
    });
  }

  Future deletePost(PostEntity post) async {
    emit(state.copyWith(isLoading: true));
    final response = await _deletePostUseCase.call(params: post);
    if (response is DataSuccess) {
      final list = [...state.listPost!];
      list.removeWhere((element) => element.id == post.id);
      emit(state.copyWith(listPost: list));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteJob(String id) async {
    emit(state.copyWith(isLoading: true));
    final response = await _deleteJobUseCase.call(params: id);
    if (response is DataSuccess) {
      final list = [...state.listJob!];
      list.removeWhere((element) => element.id == id);
      emit(state.copyWith(listJob: list));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future openWebsite() async {
    if (await canLaunchUrlString(state.user?.website ?? "")) {
      await launchUrlString(state.user?.website ?? "");
    }
  }

  Future sharePost(SharePostBase entity) async {
    final response = await _sharePostUseCase.call(params: entity);
    CompanyProfileCoordinator.rootRouter.pop();
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  Future saveJob(String jobID) async {
    final response = await _saveJobUseCase.call(params: jobID);
    if (response is DataSuccess) {
      emit(state.copyWith(saveJobID: jobID));
    }
  }

  @override
  Future<void> close() {
    tabController.dispose();
    scrollController.dispose();
    if (_postSubscription != null) _postSubscription!.cancel();
    if (_userInfoSubscription != null) _userInfoSubscription!.cancel();
    return super.close();
  }
}
