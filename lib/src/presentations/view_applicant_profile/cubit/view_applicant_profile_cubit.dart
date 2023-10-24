import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';

part 'view_applicant_profile_state.dart';

@injectable
class ViewApplicantProfileCubit extends Cubit<ViewApplicantProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _postSubscription;

  final StreamListPostUseCase _streamListPostUseCase;
  final GetWorkExperienceUseCase _getWorkExperienceUseCase;
  final GetEducationUseCase _getEducationUseCase;
  final GetAppreciationUseCase _getAppreciationUseCase;
  final GetResumeUseCase _getResumeUseCase;
  final GetLanguageUseCase _getLanguagesUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;
  final GetSkillUseCase _getSkillUseCase;
  final FavouritePostUseCase _favouritePostUseCase;

  ViewApplicantProfileCubit(
    this._getAppreciationUseCase,
    this._getEducationUseCase,
    this._getLanguagesUseCase,
    this._getResumeUseCase,
    this._getSkillUseCase,
    this._getUserInfoUseCase,
    this._getWorkExperienceUseCase,
    this._streamListPostUseCase,
    this._favouritePostUseCase,
  ) : super(const ViewApplicantProfileState(isTop: false, isLoading: false));

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  void init(String uid) {
    _getUserInfo(uid);
    _getListPost(uid);
    _getWorkExperience(uid);
    _getEducation(uid);
    _getAppreciation(uid);
    _getResume(uid);
    _getLanguage(uid);
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

  Future _getWorkExperience(String uid) async {
    final response = await _getWorkExperienceUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listExperience: response.data));
    }
  }

  void _getEducation(String uid) async {
    final response = await _getEducationUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listEducation: response.data));
    }
  }

  Future _getAppreciation(String uid) async {
    final response = await _getAppreciationUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listAppreciation: response.data));
    }
  }

  Future _getResume(String uid) async {
    final response = await _getResumeUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listResume: response.data));
    }
  }

  Future _getUserInfo(String uid) async {
    final response = await _getUserInfoUseCase.call(params: uid);
    if (response is DataSuccess) {
      _getListSkill(response.data!.skill ?? []);
      emit(state.copyWith(user: response.data));
    }
  }

  Future _getLanguage(String uid) async {
    final response = await _getLanguagesUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listLanguage: response.data));
    }
  }

  Future _getListSkill(List<String> skills) async {
    final response = await _getSkillUseCase.call(params: skills);
    if (response is DataSuccess) {
      emit(state.copyWith(listSkill: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataFailed) {
      print(response.error);
    }
  }

  @override
  Future<void> close() {
    tabController.dispose();
    scrollController.dispose();
    if (_postSubscription != null) _postSubscription!.cancel();
    return super.close();
  }
}
