import 'package:jobspot/injection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocal {
  AppLocal._();

  static AppLocalizations get text => getIt<AppLocalizations>();
}
