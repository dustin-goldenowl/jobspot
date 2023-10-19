import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_education_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_resume_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_work_experience_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

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

  final DeletePostUseCase _deletePostUseCase;
  final DeleteResumeUseCase _deleteResumeUseCase;
  final GetListPostUseCase _getListPostUseCase;
  final GetWorkExperienceUseCase _getWorkExperienceUseCase;
  final GetEducationUseCase _getEducationUseCase;
  final GetAppreciationUseCase _getAppreciationUseCase;
  final GetResumeUseCase _getResumeUseCase;

  ApplicantProfileCubit(
    this._deletePostUseCase,
    this._deleteResumeUseCase,
    this._getListPostUseCase,
    this._getWorkExperienceUseCase,
    this._getEducationUseCase,
    this._getAppreciationUseCase,
    this._getResumeUseCase,
  ) : super(const ApplicantProfileState(isTop: false, isLoading: false)) {
    _init();
  }

  void _init() {
    _getListPost();
    _getWorkExperience();
    _getEducation();
    _getAppreciation();
    _getResume();
  }

  void _getListPost() {
    if (_postSubscription != null) _postSubscription!.cancel();
    _postSubscription = _getListPostUseCase.call(params: 15).listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      }
    });
  }

  void _getWorkExperience() {
    if (_experienceSubscription != null) _experienceSubscription!.cancel();
    _experienceSubscription = _getWorkExperienceUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listExperience: event.data));
      }
    });
  }

  void _getEducation() {
    if (_educationSubscription != null) _educationSubscription!.cancel();
    _educationSubscription = _getEducationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listEducation: event.data));
      }
    });
  }

  void _getAppreciation() {
    if (_appreciationSubscription != null) _appreciationSubscription!.cancel();
    _appreciationSubscription = _getAppreciationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listAppreciation: event.data));
      }
    });
  }

  void _getResume() {
    if (_resumeSubscription != null) _resumeSubscription!.cancel();
    _resumeSubscription = _getResumeUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listResume: event.data));
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

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  @override
  Future<void> close() {
    if (_postSubscription != null) _postSubscription!.cancel();
    if (_experienceSubscription != null) _experienceSubscription!.cancel();
    if (_educationSubscription != null) _educationSubscription!.cancel();
    if (_appreciationSubscription != null) _appreciationSubscription!.cancel();
    if (_resumeSubscription != null) _resumeSubscription!.cancel();
    scrollController.dispose();
    tabController.dispose();
    return super.close();
  }
}
