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
import 'package:jobspot/injection.dart' as _i29;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i6;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i20;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i8;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i7;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i9;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i21;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i12;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i28;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i27;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i17;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i16;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i22;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i23;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i24;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

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
    gh.lazySingleton<_i7.ConnectionRepository>(
        () => _i8.ConnectionRepositoryImpl());
    gh.lazySingleton<_i9.FetchPostUseCase>(
        () => _i9.FetchPostUseCase(gh<_i7.ConnectionRepository>()));
    gh.lazySingleton<_i10.JobPositionRepository>(
        () => _i11.JobPositionRepositoryImpl());
    gh.factory<_i12.SearchJobPositionUseCase>(
        () => _i12.SearchJobPositionUseCase(gh<_i10.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i13.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i14.SignInRepository>(() => _i15.LoginRepositoryImpl());
    gh.lazySingleton<_i16.SignUpRepository>(() => _i17.SignUpRepositoryImpl());
    gh.lazySingleton<_i18.UpdatePostUseCase>(
        () => _i18.UpdatePostUseCase(gh<_i3.AddPostRepository>()));
    gh.factory<_i19.AddPostCubit>(() => _i19.AddPostCubit(
          gh<_i5.AddPostUseCase>(),
          gh<_i18.UpdatePostUseCase>(),
        ));
    gh.factory<_i20.ConnectionCubit>(
        () => _i20.ConnectionCubit(gh<_i9.FetchPostUseCase>()));
    gh.factory<_i21.JobPositionCubit>(
        () => _i21.JobPositionCubit(gh<_i12.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i22.RegisterApplicantUseCase>(
        () => _i22.RegisterApplicantUseCase(gh<_i16.SignUpRepository>()));
    gh.lazySingleton<_i23.RegisterBusinessUseCase>(
        () => _i23.RegisterBusinessUseCase(gh<_i16.SignUpRepository>()));
    gh.lazySingleton<_i24.RegisterGoogleUseCase>(
        () => _i24.RegisterGoogleUseCase(gh<_i16.SignUpRepository>()));
    gh.lazySingleton<_i25.SignInEmailPasswordUseCase>(
        () => _i25.SignInEmailPasswordUseCase(gh<_i14.SignInRepository>()));
    gh.lazySingleton<_i26.SignInGoogleUseCase>(
        () => _i26.SignInGoogleUseCase(gh<_i14.SignInRepository>()));
    gh.factory<_i27.SignUpCubit>(() => _i27.SignUpCubit(
          gh<_i22.RegisterApplicantUseCase>(),
          gh<_i23.RegisterBusinessUseCase>(),
          gh<_i24.RegisterGoogleUseCase>(),
        ));
    gh.factory<_i28.SignInCubit>(() => _i28.SignInCubit(
          gh<_i25.SignInEmailPasswordUseCase>(),
          gh<_i26.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i29.InjectionModule {}
