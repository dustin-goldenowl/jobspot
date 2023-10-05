import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/injection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future configureDependencies() async => getIt.init();

@module
abstract class InjectionModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
