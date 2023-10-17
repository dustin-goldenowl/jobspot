// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i67;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i38;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i32;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i39;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i33;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i40;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart'
    as _i18;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i41;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i65;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i50;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i20;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i19;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i51;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i57;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i42;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i66;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i29;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i28;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i61;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i63;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i35;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i34;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i64;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i37;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i36;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i43;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i45;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i46;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i62;
import 'package:shared_preferences/shared_preferences.dart' as _i27;

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
    gh.lazySingleton<_i10.ApplicantProfileRepository>(
        () => _i11.ApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i12.ApplyJobRepository>(
        () => _i13.ApplyJobRepositoryImpl());
    gh.lazySingleton<_i14.ApplyJobUseCase>(
        () => _i14.ApplyJobUseCase(gh<_i12.ApplyJobRepository>()));
    gh.lazySingleton<_i15.ConnectionRepository>(
        () => _i16.ConnectionRepositoryImpl());
    gh.lazySingleton<_i17.FetchPostUseCase>(
        () => _i17.FetchPostUseCase(gh<_i15.ConnectionRepository>()));
    gh.lazySingleton<_i18.GetListPostUseCase>(
        () => _i18.GetListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i19.HomeRepository>(() => _i20.HomeRepositoryImpl());
    gh.lazySingleton<_i21.JobPositionRepository>(
        () => _i22.JobPositionRepositoryImpl());
    gh.lazySingleton<_i23.SaveJobRepository>(
        () => _i24.SaveJobRepositoryImpl());
    gh.lazySingleton<_i25.SaveJobUseCase>(
        () => _i25.SaveJobUseCase(gh<_i19.HomeRepository>()));
    gh.factory<_i26.SearchJobPositionUseCase>(
        () => _i26.SearchJobPositionUseCase(gh<_i21.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i27.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i28.SignInRepository>(() => _i29.LoginRepositoryImpl());
    gh.lazySingleton<_i30.SignUpRepository>(() => _i31.SignUpRepositoryImpl());
    gh.factory<_i32.UpdateJobUseCase>(
        () => _i32.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i33.UpdatePostUseCase>(
        () => _i33.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i34.ViewJobRepository>(
        () => _i35.ViewJobRepositoryImpl());
    gh.lazySingleton<_i36.ViewPostRepository>(
        () => _i37.ViewPostRepositoryImpl());
    gh.factory<_i38.AddJobCubit>(() => _i38.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i32.UpdateJobUseCase>(),
        ));
    gh.factory<_i39.AddPostCubit>(() => _i39.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i33.UpdatePostUseCase>(),
        ));
    gh.factory<_i40.ApplicantProfileCubit>(
        () => _i40.ApplicantProfileCubit(gh<_i18.GetListPostUseCase>()));
    gh.factory<_i41.ApplyJobCubit>(
        () => _i41.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i42.DeleteAllSaveJobUseCase>(
        () => _i42.DeleteAllSaveJobUseCase(gh<_i23.SaveJobRepository>()));
    gh.lazySingleton<_i43.DeleteCommentUseCase>(
        () => _i43.DeleteCommentUseCase(gh<_i36.ViewPostRepository>()));
    gh.lazySingleton<_i44.FavouriteCommentUseCase>(
        () => _i44.FavouriteCommentUseCase(gh<_i36.ViewPostRepository>()));
    gh.lazySingleton<_i45.FavouritePostUseCase>(
        () => _i45.FavouritePostUseCase(gh<_i36.ViewPostRepository>()));
    gh.lazySingleton<_i46.FetchDataCommentFirstLevelUseCase>(() =>
        _i46.FetchDataCommentFirstLevelUseCase(gh<_i36.ViewPostRepository>()));
    gh.lazySingleton<_i47.FetchJobUseCase>(
        () => _i47.FetchJobUseCase(gh<_i19.HomeRepository>()));
    gh.lazySingleton<_i48.FetchJobUseCase>(
        () => _i48.FetchJobUseCase(gh<_i34.ViewJobRepository>()));
    gh.lazySingleton<_i49.GetReplyCommentUseCase>(
        () => _i49.GetReplyCommentUseCase(gh<_i36.ViewPostRepository>()));
    gh.factory<_i50.HomeCubit>(() => _i50.HomeCubit(
          gh<_i47.FetchJobUseCase>(),
          gh<_i25.SaveJobUseCase>(),
        ));
    gh.factory<_i51.JobPositionCubit>(
        () => _i51.JobPositionCubit(gh<_i26.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i52.ListenSaveJobUseCase>(
        () => _i52.ListenSaveJobUseCase(gh<_i23.SaveJobRepository>()));
    gh.lazySingleton<_i53.RegisterApplicantUseCase>(
        () => _i53.RegisterApplicantUseCase(gh<_i30.SignUpRepository>()));
    gh.lazySingleton<_i54.RegisterBusinessUseCase>(
        () => _i54.RegisterBusinessUseCase(gh<_i30.SignUpRepository>()));
    gh.lazySingleton<_i55.RegisterGoogleUseCase>(
        () => _i55.RegisterGoogleUseCase(gh<_i30.SignUpRepository>()));
    gh.lazySingleton<_i56.ReplyCommentUseCase>(
        () => _i56.ReplyCommentUseCase(gh<_i36.ViewPostRepository>()));
    gh.factory<_i57.SaveJobCubit>(() => _i57.SaveJobCubit(
          gh<_i52.ListenSaveJobUseCase>(),
          gh<_i42.DeleteAllSaveJobUseCase>(),
          gh<_i25.SaveJobUseCase>(),
        ));
    gh.lazySingleton<_i58.SendCommentUseCase>(
        () => _i58.SendCommentUseCase(gh<_i36.ViewPostRepository>()));
    gh.lazySingleton<_i59.SignInEmailPasswordUseCase>(
        () => _i59.SignInEmailPasswordUseCase(gh<_i28.SignInRepository>()));
    gh.lazySingleton<_i60.SignInGoogleUseCase>(
        () => _i60.SignInGoogleUseCase(gh<_i28.SignInRepository>()));
    gh.factory<_i61.SignUpCubit>(() => _i61.SignUpCubit(
          gh<_i53.RegisterApplicantUseCase>(),
          gh<_i54.RegisterBusinessUseCase>(),
          gh<_i55.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i62.SyncPostDataUseCase>(
        () => _i62.SyncPostDataUseCase(gh<_i36.ViewPostRepository>()));
    gh.factory<_i63.ViewJobCubit>(
        () => _i63.ViewJobCubit(gh<_i48.FetchJobUseCase>()));
    gh.factory<_i64.ViewPostBloc>(() => _i64.ViewPostBloc(
          gh<_i46.FetchDataCommentFirstLevelUseCase>(),
          gh<_i44.FavouriteCommentUseCase>(),
          gh<_i45.FavouritePostUseCase>(),
          gh<_i58.SendCommentUseCase>(),
          gh<_i62.SyncPostDataUseCase>(),
          gh<_i56.ReplyCommentUseCase>(),
          gh<_i49.GetReplyCommentUseCase>(),
          gh<_i43.DeleteCommentUseCase>(),
        ));
    gh.factory<_i65.ConnectionCubit>(() => _i65.ConnectionCubit(
          gh<_i17.FetchPostUseCase>(),
          gh<_i45.FavouritePostUseCase>(),
        ));
    gh.factory<_i66.SignInCubit>(() => _i66.SignInCubit(
          gh<_i59.SignInEmailPasswordUseCase>(),
          gh<_i60.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i67.InjectionModule {}
