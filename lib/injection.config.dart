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
import 'package:jobspot/injection.dart' as _i54;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i32;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i33;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i27;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i34;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i12;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i35;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i13;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i15;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i41;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i17;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i16;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i39;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i42;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i19;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i18;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i53;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i23;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i22;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i49;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i25;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i24;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i43;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i45;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i51;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i29;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i28;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i40;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i52;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i36;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i37;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i38;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i46;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i50;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

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
    gh.lazySingleton<_i10.ApplyJobRepository>(
        () => _i11.ApplyJobRepositoryImpl());
    gh.lazySingleton<_i12.ApplyJobUseCase>(
        () => _i12.ApplyJobUseCase(gh<_i10.ApplyJobRepository>()));
    gh.lazySingleton<_i13.ConnectionRepository>(
        () => _i14.ConnectionRepositoryImpl());
    gh.lazySingleton<_i15.FetchPostUseCase>(
        () => _i15.FetchPostUseCase(gh<_i13.ConnectionRepository>()));
    gh.lazySingleton<_i16.HomeRepository>(() => _i17.HomeRepositoryImpl());
    gh.lazySingleton<_i18.JobPositionRepository>(
        () => _i19.JobPositionRepositoryImpl());
    gh.factory<_i20.SearchJobPositionUseCase>(
        () => _i20.SearchJobPositionUseCase(gh<_i18.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i21.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i22.SignInRepository>(() => _i23.LoginRepositoryImpl());
    gh.lazySingleton<_i24.SignUpRepository>(() => _i25.SignUpRepositoryImpl());
    gh.factory<_i26.UpdateJobUseCase>(
        () => _i26.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i27.UpdatePostUseCase>(
        () => _i27.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i28.ViewJobRepository>(
        () => _i29.ViewJobRepositoryImpl());
    gh.lazySingleton<_i30.ViewPostRepository>(
        () => _i31.ViewPostRepositoryImpl());
    gh.factory<_i32.AddJobCubit>(() => _i32.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i26.UpdateJobUseCase>(),
        ));
    gh.factory<_i33.AddPostCubit>(() => _i33.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i27.UpdatePostUseCase>(),
        ));
    gh.factory<_i34.ApplyJobCubit>(
        () => _i34.ApplyJobCubit(gh<_i12.ApplyJobUseCase>()));
    gh.factory<_i35.ConnectionCubit>(
        () => _i35.ConnectionCubit(gh<_i15.FetchPostUseCase>()));
    gh.lazySingleton<_i36.FavouriteCommentUseCase>(
        () => _i36.FavouriteCommentUseCase(gh<_i30.ViewPostRepository>()));
    gh.lazySingleton<_i37.FavouritePostUseCase>(
        () => _i37.FavouritePostUseCase(gh<_i30.ViewPostRepository>()));
    gh.lazySingleton<_i38.FetchDataCommentFirstLevelUseCase>(() =>
        _i38.FetchDataCommentFirstLevelUseCase(gh<_i30.ViewPostRepository>()));
    gh.lazySingleton<_i39.FetchJobUseCase>(
        () => _i39.FetchJobUseCase(gh<_i16.HomeRepository>()));
    gh.lazySingleton<_i40.FetchJobUseCase>(
        () => _i40.FetchJobUseCase(gh<_i28.ViewJobRepository>()));
    gh.factory<_i41.HomeCubit>(
        () => _i41.HomeCubit(gh<_i39.FetchJobUseCase>()));
    gh.factory<_i42.JobPositionCubit>(
        () => _i42.JobPositionCubit(gh<_i20.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i43.RegisterApplicantUseCase>(
        () => _i43.RegisterApplicantUseCase(gh<_i24.SignUpRepository>()));
    gh.lazySingleton<_i44.RegisterBusinessUseCase>(
        () => _i44.RegisterBusinessUseCase(gh<_i24.SignUpRepository>()));
    gh.lazySingleton<_i45.RegisterGoogleUseCase>(
        () => _i45.RegisterGoogleUseCase(gh<_i24.SignUpRepository>()));
    gh.lazySingleton<_i46.SendCommentUseCase>(
        () => _i46.SendCommentUseCase(gh<_i30.ViewPostRepository>()));
    gh.lazySingleton<_i47.SignInEmailPasswordUseCase>(
        () => _i47.SignInEmailPasswordUseCase(gh<_i22.SignInRepository>()));
    gh.lazySingleton<_i48.SignInGoogleUseCase>(
        () => _i48.SignInGoogleUseCase(gh<_i22.SignInRepository>()));
    gh.factory<_i49.SignUpCubit>(() => _i49.SignUpCubit(
          gh<_i43.RegisterApplicantUseCase>(),
          gh<_i44.RegisterBusinessUseCase>(),
          gh<_i45.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i50.SyncPostDataUseCase>(
        () => _i50.SyncPostDataUseCase(gh<_i30.ViewPostRepository>()));
    gh.factory<_i51.ViewJobCubit>(
        () => _i51.ViewJobCubit(gh<_i40.FetchJobUseCase>()));
    gh.factory<_i52.ViewPostBloc>(() => _i52.ViewPostBloc(
          gh<_i38.FetchDataCommentFirstLevelUseCase>(),
          gh<_i36.FavouriteCommentUseCase>(),
          gh<_i37.FavouritePostUseCase>(),
          gh<_i46.SendCommentUseCase>(),
          gh<_i50.SyncPostDataUseCase>(),
        ));
    gh.factory<_i53.SignInCubit>(() => _i53.SignInCubit(
          gh<_i47.SignInEmailPasswordUseCase>(),
          gh<_i48.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i54.InjectionModule {}
