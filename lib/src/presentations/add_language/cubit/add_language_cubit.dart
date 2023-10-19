import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/entities/add_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart';
import 'package:jobspot/src/presentations/add_language/widgets/choose_level_language_dialog.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';

part 'add_language_state.dart';

@injectable
class AddLanguageCubit extends Cubit<AddLanguageState> {
  final AddLanguageUseCase _addLanguageUseCase;

  AddLanguageCubit(this._addLanguageUseCase) : super(AddLanguageState.ds());

  void changeLanguage(CountryEntity country) =>
      emit(state.copyWith(country: country));

  void changeFirstLanguage(bool isFirst) =>
      emit(state.copyWith(isFirst: isFirst));

  Future addLanguage() async {
    if (state.country != null) {
      emit(state.copyWith(isLoading: true));
      final response = await _addLanguageUseCase.call(
          params: AddLanguageEntity(
        name: state.country!.name,
        code: state.country!.code,
        isFirst: state.isFirst,
        oralLevel: state.oralLevel,
        writtenLevel: state.writtenLevel,
      ));
      if (response is DataFailed) {
        emit(state.copyWith(error: response.error));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    } else {
      emit(state.copyWith(
          error: AppLocal.text.add_language_page_language_validate));
    }
  }

  void showPickOralDialog(BuildContext context, {bool isOral = true}) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return ChooseLevelLanguageDialog(
          currentLevel: isOral ? state.oralLevel : state.writtenLevel,
          onChange: (value) {
            if (isOral) {
              emit(state.copyWith(oralLevel: value));
            } else {
              emit(state.copyWith(writtenLevel: value));
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
