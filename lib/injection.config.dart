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
import 'package:jobspot/injection.dart' as _i20;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i6;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_post/domain/use_case/add_post_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i19;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i9;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i8;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i16;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i18;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i13;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

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
    gh.lazySingleton<_i3.AddPostRepository>(() => _i4.AddPostRepositoryImpl());
    gh.lazySingleton<_i5.AddPostUseCase>(
        () => _i5.AddPostUseCase(gh<_i3.AddPostRepository>()));
    gh.lazySingleton<_i6.AppRouter>(() => _i6.AppRouter());
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.SignInRepository>(() => _i9.LoginRepositoryImpl());
    gh.lazySingleton<_i10.SignUpRepository>(() => _i11.SignUpRepositoryImpl());
    gh.factory<_i12.AddPostCubit>(
        () => _i12.AddPostCubit(gh<_i5.AddPostUseCase>()));
    gh.lazySingleton<_i13.RegisterApplicantUseCase>(
        () => _i13.RegisterApplicantUseCase(gh<_i10.SignUpRepository>()));
    gh.lazySingleton<_i14.RegisterBusinessUseCase>(
        () => _i14.RegisterBusinessUseCase(gh<_i10.SignUpRepository>()));
    gh.lazySingleton<_i15.RegisterGoogleUseCase>(
        () => _i15.RegisterGoogleUseCase(gh<_i10.SignUpRepository>()));
    gh.lazySingleton<_i16.SignInEmailPasswordUseCase>(
        () => _i16.SignInEmailPasswordUseCase(gh<_i8.SignInRepository>()));
    gh.lazySingleton<_i17.SignInGoogleUseCase>(
        () => _i17.SignInGoogleUseCase(gh<_i8.SignInRepository>()));
    gh.factory<_i18.SignUpCubit>(() => _i18.SignUpCubit(
          gh<_i13.RegisterApplicantUseCase>(),
          gh<_i14.RegisterBusinessUseCase>(),
          gh<_i15.RegisterGoogleUseCase>(),
        ));
    gh.factory<_i19.SignInCubit>(() => _i19.SignInCubit(
          gh<_i16.SignInEmailPasswordUseCase>(),
          gh<_i17.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i20.InjectionModule {}
