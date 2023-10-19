import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/use_cases/get_language_use_case.dart';

part 'view_language_state.dart';

@injectable
class ViewLanguageCubit extends Cubit<ViewLanguageState> {
  final GetLanguagesUseCase _getLanguagesUseCase;
  final DeleteLanguageUseCase _deleteLanguageUseCase;

  StreamSubscription? _subscription;

  ViewLanguageCubit(this._getLanguagesUseCase, this._deleteLanguageUseCase)
      : super(const ViewLanguageState()) {
    getLanguage();
  }

  void getLanguage() {
    if (_subscription != null) _subscription!.cancel();
    _subscription = _getLanguagesUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copy(listLanguage: event.data));
      }
    });
  }

  Future deleteLanguage(String id) async {
    final response = await _deleteLanguageUseCase.call(params: id);
    if (response is DataSuccess) {}
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    return super.close();
  }
}
