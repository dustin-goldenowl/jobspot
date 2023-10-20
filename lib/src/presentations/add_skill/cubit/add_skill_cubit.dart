import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart';

part 'add_skill_state.dart';

@injectable
class AddSkillCubit extends Cubit<AddSkillState> {
  final FocusNode searchFocusNode = FocusNode();
  final searchController = TextEditingController();

  final GetListSkillUseCase _getListSkillUseCase;
  final UpdateSkillUseCase _updateSkillUseCase;

  AddSkillCubit(this._getListSkillUseCase, this._updateSkillUseCase)
      : super(AddSkillState.ds()) {
    searchFocusNode.addListener(() {
      if (searchFocusNode.hasFocus) {
        emit(state.copyWith(isFocus: true));
      }
    });
    searchController.addListener(() => searchSkill());
  }

  void initListSkill(List<SkillEntity> listSkill) =>
      emit(state.copyWith(listSkill: listSkill));

  Future searchSkill() async {
    emit(state.copyWith(query: searchController.text));
    final response =
        await _getListSkillUseCase.call(params: searchController.text);
    if (response is DataSuccess) {
      emit(state.copyWith(listSearch: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void addSkill(SkillEntity skill) {
    if (state.listSkill
        .where((element) =>
            element.title.toLowerCase().compareTo(skill.title.toLowerCase()) ==
            0)
        .isEmpty) {
      emit(state
          .copyWith(listSkill: [...state.listSkill, skill], isFocus: false));
    } else {
      emit(state.copyWith(isFocus: false));
    }
    searchFocusNode.unfocus();
  }

  void removeSkill(SkillEntity skill) {
    final list = [...state.listSkill];
    list.remove(skill);
    emit(state.copyWith(listSkill: [...list]));
  }

  Future updateListSkill() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updateSkillUseCase.call(params: state.listSkill);
    if (response is DataSuccess) {
      emit(state.copyWith());
    } else {
      emit(state.copyWith(error: response.error));
    }
  }
}
