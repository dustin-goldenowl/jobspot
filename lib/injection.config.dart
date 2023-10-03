// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i3;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i8;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i5;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i4;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i6;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.SignInRepository>(() => _i5.LoginRepositoryImpl());
    gh.lazySingleton<_i6.SignInEmailPasswordUseCase>(
        () => _i6.SignInEmailPasswordUseCase(gh<_i4.SignInRepository>()));
    gh.lazySingleton<_i7.SignInGoogleUseCase>(
        () => _i7.SignInGoogleUseCase(gh<_i4.SignInRepository>()));
    gh.factory<_i8.SignInCubit>(() => _i8.SignInCubit(
          gh<_i6.SignInEmailPasswordUseCase>(),
          gh<_i7.SignInGoogleUseCase>(),
        ));
    return this;
  }
}
