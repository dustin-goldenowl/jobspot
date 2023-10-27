import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/filter/domain/entities/filter_entity.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.ds());

  void init(FilterEntity? entity) {
    if (entity != null) {
      emit(state.copyWith(
        indexJobType: entity.jobType,
        indexLastUpdate: entity.lastUpdate,
        indexLevel: entity.level,
        indexTypeWorkplace: entity.typeWorkplace,
        salary: entity.salary,
        isFilterSalary: entity.salary != null,
      ));
    }
  }

  void changeExpand(int index, bool isExpanded) {
    switch (index) {
      case 0:
        emit(state.copyWith(isExpandedLastUpdate: isExpanded));
        break;
      case 1:
        emit(state.copyWith(isExpandedTypeWorkplace: isExpanded));
        break;
      case 2:
        emit(state.copyWith(isExpandedJobType: isExpanded));
        break;
      case 3:
        emit(state.copyWith(isExpandedLevel: isExpanded));
        break;
      case 4:
        emit(state.copyWith(isExpandedSalary: isExpanded));
        break;
      default:
    }
  }

  void changeLastUpdate(int? index) =>
      emit(state.copyWith(indexLastUpdate: index));

  void changeTypeWorkplace(int? index) =>
      emit(state.copyWith(indexTypeWorkplace: index));

  void changeJobType(int? index) => emit(state.copyWith(indexJobType: index));

  void changeLevel(int? index) => emit(state.copyWith(indexLevel: index));

  void changeSalary(RangeValues salary) =>
      emit(state.copyWith(salary: salary, isFilterSalary: true));

  FilterEntity getSearchEntity() {
    return FilterEntity(
      jobType: state.indexJobType,
      lastUpdate: state.indexLastUpdate,
      level: state.indexLevel,
      salary: state.isFilterSalary ? state.salary : null,
      typeWorkplace: state.indexTypeWorkplace,
    );
  }
}
