import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart';

part 'view_language_state.dart';

@injectable
class ViewLanguageCubit extends Cubit<ViewLanguageState> {
  final StreamLanguagesUseCase _streamLanguagesUseCase;
  final DeleteLanguageUseCase _deleteLanguageUseCase;

  StreamSubscription? _subscription;

  ViewLanguageCubit(this._streamLanguagesUseCase, this._deleteLanguageUseCase)
      : super(const ViewLanguageState());

  void getLanguage() {
    if (_subscription != null) _subscription!.cancel();
    _subscription = _streamLanguagesUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copy(listLanguage: event.data));
      }
    });
  }

  void initLanguage(List<LanguageEntity> languages) =>
      emit(state.copy(listLanguage: languages));

  Future deleteLanguage(String id) async {
    final response = await _deleteLanguageUseCase.call(params: id);
    if (response is DataFailed) {
      emit(state.copy(error: response.error));
    }
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    return super.close();
  }
}
