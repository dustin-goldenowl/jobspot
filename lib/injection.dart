import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future configureDependencies() async => getIt.init();
