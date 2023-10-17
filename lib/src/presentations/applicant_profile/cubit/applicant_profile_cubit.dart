import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/add_experience_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

part 'applicant_profile_state.dart';

@injectable
class ApplicantProfileCubit extends Cubit<ApplicantProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  StreamSubscription? _subscription;

  final GetListPostUseCase _getListPostUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final AddExperienceUseCase _addExperienceUseCase;

  ApplicantProfileCubit(
    this._getListPostUseCase,
    this._deletePostUseCase,
    this._addExperienceUseCase,
  ) : super(const ApplicantProfileState(isTop: false, isLoading: false));

  void getListPost() {
    if (_subscription != null) _subscription!.cancel();
    _subscription = _getListPostUseCase.call(params: 15).listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
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
      emit(state.copyWith(listPost: state.listPost, error: response.error));
    }
  }

  Future addWorkExperience(WorkExperienceEntity experience) async {
    final response = await _addExperienceUseCase.call(params: experience);
    if (response is DataSuccess) {}
  }

  void changeIsTop(bool isTop) =>
      emit(state.copyWith(listPost: state.listPost, isTop: isTop));

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    tabController.dispose();
    return super.close();
  }
}
