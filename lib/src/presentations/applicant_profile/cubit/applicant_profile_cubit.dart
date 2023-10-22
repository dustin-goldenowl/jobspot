import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';

part 'applicant_profile_state.dart';

@injectable
class ApplicantProfileCubit extends Cubit<ApplicantProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _postSubscription;
  StreamSubscription? _experienceSubscription;
  StreamSubscription? _educationSubscription;
  StreamSubscription? _appreciationSubscription;
  StreamSubscription? _resumeSubscription;
  StreamSubscription? _userInfoSubscription;
  StreamSubscription? _languageSubscription;

  final StreamListPostUseCase _streamListPostUseCase;
  final StreamWorkExperienceUseCase _streamWorkExperienceUseCase;
  final StreamEducationUseCase _streamEducationUseCase;
  final StreamAppreciationUseCase _streamAppreciationUseCase;
  final StreamResumeUseCase _streamResumeUseCase;
  final StreamLanguagesUseCase _streamLanguagesUseCase;
  final StreamUserInfoUseCase _streamUserInfoUseCase;
  final GetSkillUseCase _getSkillUseCase;
  final UpdateAboutMeUseCase _updateAboutMeUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final DeleteResumeUseCase _deleteResumeUseCase;
  final FavouritePostUseCase _favouritePostUseCase;

  ApplicantProfileCubit(
    this._deletePostUseCase,
    this._deleteResumeUseCase,
    this._streamListPostUseCase,
    this._streamWorkExperienceUseCase,
    this._streamEducationUseCase,
    this._streamAppreciationUseCase,
    this._streamResumeUseCase,
    this._getSkillUseCase,
    this._streamUserInfoUseCase,
    this._streamLanguagesUseCase,
    this._updateAboutMeUseCase,
    this._favouritePostUseCase,
  ) : super(ApplicantProfileState.ds()) {
    _init();
  }

  void _init() {
    _getUserInfo();
    _getListPost();
    _getWorkExperience();
    _getEducation();
    _getAppreciation();
    _getResume();
    _getLanguage();
    _getListSkill(state.user.skill ?? []);
  }

  void _getListPost() {
    if (_postSubscription != null) _postSubscription!.cancel();
    _postSubscription = _streamListPostUseCase
        .call(params: GetPostEntity(limit: 15))
        .listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      }
    });
  }

  void _getWorkExperience() {
    if (_experienceSubscription != null) _experienceSubscription!.cancel();
    _experienceSubscription =
        _streamWorkExperienceUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listExperience: event.data));
      }
    });
  }

  void _getEducation() {
    if (_educationSubscription != null) _educationSubscription!.cancel();
    _educationSubscription = _streamEducationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listEducation: event.data));
      }
    });
  }

  void _getAppreciation() {
    if (_appreciationSubscription != null) _appreciationSubscription!.cancel();
    _appreciationSubscription =
        _streamAppreciationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listAppreciation: event.data));
      }
    });
  }

  void _getResume() {
    if (_resumeSubscription != null) _resumeSubscription!.cancel();
    _resumeSubscription = _streamResumeUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listResume: event.data));
      }
    });
  }

  void _getUserInfo() {
    if (_userInfoSubscription != null) _userInfoSubscription!.cancel();
    _userInfoSubscription = _streamUserInfoUseCase.call().listen((event) {
      if (event is DataSuccess) {
        _getListSkill(event.data!.skill ?? []);
        emit(state.copyWith(user: event.data, about: event.data?.description));
      }
    });
  }

  void _getLanguage() {
    if (_languageSubscription != null) _languageSubscription!.cancel();
    _languageSubscription = _streamLanguagesUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listLanguage: event.data));
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

  Future deleteResume(ResumeEntity resume) async {
    emit(state.copyWith(isLoading: true));
    final response = await _deleteResumeUseCase.call(params: resume);
    if (response is DataSuccess) {
      emit(state.copyWith());
    } else {
      emit(state.copyWith(error: response.error));
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

  Future updateAboutMe(String description) async {
    emit(state.copyWith(about: description));
    final response = await _updateAboutMeUseCase.call(params: description);
    if (response is DataFailed) {
      emit(state.copyWith(
        about: PrefsUtils.getUserInfo()?.description,
        error: response.error,
      ));
    }
  }

  Future favouritePost(FavouriteEntity entity) async {
    final response = await _favouritePostUseCase.call(params: entity);
    if (response is DataFailed) {
      print(response.error);
    }
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  @override
  Future<void> close() {
    if (_userInfoSubscription != null) _userInfoSubscription!.cancel();
    if (_postSubscription != null) _postSubscription!.cancel();
    if (_experienceSubscription != null) _experienceSubscription!.cancel();
    if (_educationSubscription != null) _educationSubscription!.cancel();
    if (_appreciationSubscription != null) _appreciationSubscription!.cancel();
    if (_resumeSubscription != null) _resumeSubscription!.cancel();
    if (_languageSubscription != null) _languageSubscription!.cancel();
    scrollController.dispose();
    tabController.dispose();
    return super.close();
  }
}
