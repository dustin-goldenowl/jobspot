import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cubit/localization_cubit.dart';

void main() {
  group("test LocalizationCubit", () {
    blocTest<LocalizationCubit, LocalizationState>(
      "change to vietnamese",
      build: () => LocalizationCubit(),
      act: (cubit) => cubit.changeLanguage(true),
      expect: () => [const LocalizationState(locale: Locale("vi"))],
    );

    blocTest<LocalizationCubit, LocalizationState>(
      "change to english",
      build: () => LocalizationCubit(),
      act: (cubit) => cubit.changeLanguage(false),
      expect: () => [const LocalizationState(locale: Locale("en"))],
    );
  });
}
