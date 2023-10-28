import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/consider_company_use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/get_list_company_pending_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

part 'home_admin_state.dart';

@injectable
class HomeAdminCubit extends Cubit<HomeAdminState> {
  final GetListCompanyPendingUseCase _getListCompanyPendingUseCase;
  final ConsiderCompanyUseCase _considerCompanyUseCase;

  HomeAdminCubit(
    this._getListCompanyPendingUseCase,
    this._considerCompanyUseCase,
  ) : super(const HomeAdminState()) {
    getListCompany();
  }

  Future getListCompany() async {
    final response = await _getListCompanyPendingUseCase.call();
    if (response is DataSuccess) {
      emit(state.copyWith(listCompany: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future considerCompany(ConsiderCompany consider) async {
    final listCompany = [...state.listCompany!];
    final temptList = [...state.listCompany!];
    temptList.removeWhere((element) => element.id == consider.toUserID);
    emit(state.copyWith(listCompany: temptList));
    final response = await _considerCompanyUseCase.call(params: consider);
    if (response is DataFailed) {
      emit(state.copyWith(listCompany: listCompany, error: response.error));
    }
  }
}
