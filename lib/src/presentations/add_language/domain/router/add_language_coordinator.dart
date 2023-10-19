import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';

class AddLanguageCoordinator {
  AddLanguageCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSearchLanguage({
    required Function(CountryEntity country) onBack,
  }) =>
      rootRouter.push(SearchLanguageRoute(onBack: onBack));
}
