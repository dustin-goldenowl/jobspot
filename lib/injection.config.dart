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
import 'package:jobspot/injection.dart' as _i16;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i3;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i15;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i6;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i5;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i12;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i13;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i14;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i8;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i7;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i9;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i10;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i5.SignInRepository>(() => _i6.LoginRepositoryImpl());
    gh.lazySingleton<_i7.SignUpRepository>(() => _i8.SignUpRepositoryImpl());
    gh.lazySingleton<_i9.RegisterApplicantUseCase>(
        () => _i9.RegisterApplicantUseCase(gh<_i7.SignUpRepository>()));
    gh.lazySingleton<_i10.RegisterBusinessUseCase>(
        () => _i10.RegisterBusinessUseCase(gh<_i7.SignUpRepository>()));
    gh.lazySingleton<_i11.RegisterGoogleUseCase>(
        () => _i11.RegisterGoogleUseCase(gh<_i7.SignUpRepository>()));
    gh.lazySingleton<_i12.SignInEmailPasswordUseCase>(
        () => _i12.SignInEmailPasswordUseCase(gh<_i5.SignInRepository>()));
    gh.lazySingleton<_i13.SignInGoogleUseCase>(
        () => _i13.SignInGoogleUseCase(gh<_i5.SignInRepository>()));
    gh.factory<_i14.SignUpCubit>(() => _i14.SignUpCubit(
          gh<_i9.RegisterApplicantUseCase>(),
          gh<_i10.RegisterBusinessUseCase>(),
          gh<_i11.RegisterGoogleUseCase>(),
        ));
    gh.factory<_i15.SignInCubit>(() => _i15.SignInCubit(
          gh<_i12.SignInEmailPasswordUseCase>(),
          gh<_i13.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i16.InjectionModule {}
