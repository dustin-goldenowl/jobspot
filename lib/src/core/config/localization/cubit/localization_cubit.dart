import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(LocalizationState(locale: _getLocal(PrefsUtils.isVietnamese)));

  static Locale _getLocal([bool? isVietnamese]) {
    return isVietnamese == null
        ? Locale(Platform.localeName.split('_')[0] == "vi" ? "vi" : "en")
        : (isVietnamese ? const Locale('vi') : const Locale('en'));
  }

  void changeLanguage(bool value) {
    PrefsUtils.setLanguage(value);
    emit(state.copyWith(locale: _getLocal(value)));
  }
}
