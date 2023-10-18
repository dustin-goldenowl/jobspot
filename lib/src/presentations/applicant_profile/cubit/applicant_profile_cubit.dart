import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_education_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart';
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

  final GetListPostUseCase _getListPostUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final GetWorkExperienceUseCase _getWorkExperienceUseCase;
  final GetEducationUseCase _getEducationUseCase;

  ApplicantProfileCubit(
    this._getListPostUseCase,
    this._deletePostUseCase,
    this._getWorkExperienceUseCase,
    this._getEducationUseCase,
  ) : super(const ApplicantProfileState(isTop: false, isLoading: false)) {
    _init();
  }

  void _init() {
    _getListPost();
    _getWorkExperience();
    _getEducation();
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

  Future deletePost(PostEntity post) async {
    emit(state.copyWith(isLoading: true, listPost: state.listPost));
    final response = await _deletePostUseCase.call(params: post);
    if (response is DataSuccess) {
      final list = [...state.listPost!];
      list.removeWhere((element) => element.id == post.id);
      emit(state.copyWith(isLoading: true, listPost: list));
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
    scrollController.dispose();
    tabController.dispose();
    return super.close();
  }
}
