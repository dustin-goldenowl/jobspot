import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

part 'view_company_profile_state.dart';

@injectable
class ViewCompanyProfileCubit extends Cubit<ViewCompanyProfileState> {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final GetListJobUseCase _getListJobUseCase;

  ViewCompanyProfileCubit(this._getListJobUseCase)
      : super(const ViewCompanyProfileState(isTop: false)) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          240 - 2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
  }

  void init(String uid) {
    _getListJob(uid);
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  Future _getListJob(String uid) async {
    final response = await _getListJobUseCase.call(params: uid);
    if (response is DataSuccess) {
      emit(state.copyWith(listJob: response.data));
    }
  }
}
