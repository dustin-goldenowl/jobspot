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
import 'package:jobspot/injection.dart' as _i33;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i21;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i24;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i12;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i25;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i14;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i13;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i15;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i32;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i30;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i31;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i20;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i19;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i27;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i28;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

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
    gh.lazySingleton<_i3.AddJobRepository>(() => _i4.AddJobRepositoryImpl());
    gh.lazySingleton<_i5.AddJobUseCase>(
        () => _i5.AddJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i6.AddPostRepository>(() => _i7.AddPostRepositoryImpl());
    gh.lazySingleton<_i8.AddPostUseCase>(
        () => _i8.AddPostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i9.AppRouter>(() => _i9.AppRouter());
    gh.lazySingleton<_i10.ConnectionRepository>(
        () => _i11.ConnectionRepositoryImpl());
    gh.lazySingleton<_i12.FetchPostUseCase>(
        () => _i12.FetchPostUseCase(gh<_i10.ConnectionRepository>()));
    gh.lazySingleton<_i13.JobPositionRepository>(
        () => _i14.JobPositionRepositoryImpl());
    gh.factory<_i15.SearchJobPositionUseCase>(
        () => _i15.SearchJobPositionUseCase(gh<_i13.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i16.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i17.SignInRepository>(() => _i18.LoginRepositoryImpl());
    gh.lazySingleton<_i19.SignUpRepository>(() => _i20.SignUpRepositoryImpl());
    gh.lazySingleton<_i21.UpdatePostUseCase>(
        () => _i21.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i22.AddJobCubit>(
        () => _i22.AddJobCubit(gh<_i5.AddJobUseCase>()));
    gh.factory<_i23.AddPostCubit>(() => _i23.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i21.UpdatePostUseCase>(),
        ));
    gh.factory<_i24.ConnectionCubit>(
        () => _i24.ConnectionCubit(gh<_i12.FetchPostUseCase>()));
    gh.factory<_i25.JobPositionCubit>(
        () => _i25.JobPositionCubit(gh<_i15.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i26.RegisterApplicantUseCase>(
        () => _i26.RegisterApplicantUseCase(gh<_i19.SignUpRepository>()));
    gh.lazySingleton<_i27.RegisterBusinessUseCase>(
        () => _i27.RegisterBusinessUseCase(gh<_i19.SignUpRepository>()));
    gh.lazySingleton<_i28.RegisterGoogleUseCase>(
        () => _i28.RegisterGoogleUseCase(gh<_i19.SignUpRepository>()));
    gh.lazySingleton<_i29.SignInEmailPasswordUseCase>(
        () => _i29.SignInEmailPasswordUseCase(gh<_i17.SignInRepository>()));
    gh.lazySingleton<_i30.SignInGoogleUseCase>(
        () => _i30.SignInGoogleUseCase(gh<_i17.SignInRepository>()));
    gh.factory<_i31.SignUpCubit>(() => _i31.SignUpCubit(
          gh<_i26.RegisterApplicantUseCase>(),
          gh<_i27.RegisterBusinessUseCase>(),
          gh<_i28.RegisterGoogleUseCase>(),
        ));
    gh.factory<_i32.SignInCubit>(() => _i32.SignInCubit(
          gh<_i29.SignInEmailPasswordUseCase>(),
          gh<_i30.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i33.InjectionModule {}
