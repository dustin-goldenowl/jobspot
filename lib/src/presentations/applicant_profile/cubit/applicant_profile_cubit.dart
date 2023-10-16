import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

part 'applicant_profile_state.dart';

@injectable
class ApplicantProfileCubit extends Cubit<ApplicantProfileState> {
  late TabController tabController;
  StreamSubscription? _subscription;

  final GetListPostUseCase _getListPostUseCase;

  ApplicantProfileCubit(this._getListPostUseCase)
      : super(const ApplicantProfileState());

  void getListPost() {
    if (_subscription != null) _subscription!.cancel();
    _subscription = _getListPostUseCase.call(params: 15).listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listPost: event.data));
      }
    });
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    tabController.dispose();
    return super.close();
  }
}
