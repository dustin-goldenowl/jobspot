import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/view_language/data/models/language_model.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

class ViewLanguageCoordinator {
  ViewLanguageCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showAddLanguage({LanguageEntity? language}) =>
      rootRouter.push(AddLanguageRoute(
        language: language != null
            ? LanguageModel.fromEntity(language).toUpdateLanguageEntity()
            : null,
      ));
}
