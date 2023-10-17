// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i72;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i42;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i35;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i43;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i36;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i44;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i18;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i41;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i45;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart'
    as _i21;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i46;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i70;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i55;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i23;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i22;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i28;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i56;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i25;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i24;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i62;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i27;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i26;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i71;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i32;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i31;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i66;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i68;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i69;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i50;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i51;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i67;
import 'package:shared_preferences/shared_preferences.dart' as _i30;

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
    gh.lazySingleton<_i17.DeletePostUseCase>(
        () => _i17.DeletePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i18.ExperienceRepository>(
        () => _i19.ExperienceRepositoryImpl());
    gh.lazySingleton<_i20.FetchPostUseCase>(
        () => _i20.FetchPostUseCase(gh<_i15.ConnectionRepository>()));
    gh.lazySingleton<_i21.GetListPostUseCase>(
        () => _i21.GetListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i22.HomeRepository>(() => _i23.HomeRepositoryImpl());
    gh.lazySingleton<_i24.JobPositionRepository>(
        () => _i25.JobPositionRepositoryImpl());
    gh.lazySingleton<_i26.SaveJobRepository>(
        () => _i27.SaveJobRepositoryImpl());
    gh.lazySingleton<_i28.SaveJobUseCase>(
        () => _i28.SaveJobUseCase(gh<_i22.HomeRepository>()));
    gh.factory<_i29.SearchJobPositionUseCase>(
        () => _i29.SearchJobPositionUseCase(gh<_i24.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i30.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i31.SignInRepository>(() => _i32.LoginRepositoryImpl());
    gh.lazySingleton<_i33.SignUpRepository>(() => _i34.SignUpRepositoryImpl());
    gh.factory<_i35.UpdateJobUseCase>(
        () => _i35.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i36.UpdatePostUseCase>(
        () => _i36.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i37.ViewJobRepository>(
        () => _i38.ViewJobRepositoryImpl());
    gh.lazySingleton<_i39.ViewPostRepository>(
        () => _i40.ViewPostRepositoryImpl());
    gh.lazySingleton<_i41.AddExperienceUseCase>(
        () => _i41.AddExperienceUseCase(gh<_i18.ExperienceRepository>()));
    gh.factory<_i42.AddJobCubit>(() => _i42.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i35.UpdateJobUseCase>(),
        ));
    gh.factory<_i43.AddPostCubit>(() => _i43.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i36.UpdatePostUseCase>(),
        ));
    gh.factory<_i44.AddWorkExperienceCubit>(
        () => _i44.AddWorkExperienceCubit(gh<_i41.AddExperienceUseCase>()));
    gh.factory<_i45.ApplicantProfileCubit>(() => _i45.ApplicantProfileCubit(
          gh<_i21.GetListPostUseCase>(),
          gh<_i17.DeletePostUseCase>(),
        ));
    gh.factory<_i46.ApplyJobCubit>(
        () => _i46.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i47.DeleteAllSaveJobUseCase>(
        () => _i47.DeleteAllSaveJobUseCase(gh<_i26.SaveJobRepository>()));
    gh.lazySingleton<_i48.DeleteCommentUseCase>(
        () => _i48.DeleteCommentUseCase(gh<_i39.ViewPostRepository>()));
    gh.lazySingleton<_i49.FavouriteCommentUseCase>(
        () => _i49.FavouriteCommentUseCase(gh<_i39.ViewPostRepository>()));
    gh.lazySingleton<_i50.FavouritePostUseCase>(
        () => _i50.FavouritePostUseCase(gh<_i39.ViewPostRepository>()));
    gh.lazySingleton<_i51.FetchDataCommentFirstLevelUseCase>(() =>
        _i51.FetchDataCommentFirstLevelUseCase(gh<_i39.ViewPostRepository>()));
    gh.lazySingleton<_i52.FetchJobUseCase>(
        () => _i52.FetchJobUseCase(gh<_i37.ViewJobRepository>()));
    gh.lazySingleton<_i53.FetchJobUseCase>(
        () => _i53.FetchJobUseCase(gh<_i22.HomeRepository>()));
    gh.lazySingleton<_i54.GetReplyCommentUseCase>(
        () => _i54.GetReplyCommentUseCase(gh<_i39.ViewPostRepository>()));
    gh.factory<_i55.HomeCubit>(() => _i55.HomeCubit(
          gh<_i53.FetchJobUseCase>(),
          gh<_i28.SaveJobUseCase>(),
        ));
    gh.factory<_i56.JobPositionCubit>(
        () => _i56.JobPositionCubit(gh<_i29.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i57.ListenSaveJobUseCase>(
        () => _i57.ListenSaveJobUseCase(gh<_i26.SaveJobRepository>()));
    gh.lazySingleton<_i58.RegisterApplicantUseCase>(
        () => _i58.RegisterApplicantUseCase(gh<_i33.SignUpRepository>()));
    gh.lazySingleton<_i59.RegisterBusinessUseCase>(
        () => _i59.RegisterBusinessUseCase(gh<_i33.SignUpRepository>()));
    gh.lazySingleton<_i60.RegisterGoogleUseCase>(
        () => _i60.RegisterGoogleUseCase(gh<_i33.SignUpRepository>()));
    gh.lazySingleton<_i61.ReplyCommentUseCase>(
        () => _i61.ReplyCommentUseCase(gh<_i39.ViewPostRepository>()));
    gh.factory<_i62.SaveJobCubit>(() => _i62.SaveJobCubit(
          gh<_i57.ListenSaveJobUseCase>(),
          gh<_i47.DeleteAllSaveJobUseCase>(),
          gh<_i28.SaveJobUseCase>(),
        ));
    gh.lazySingleton<_i63.SendCommentUseCase>(
        () => _i63.SendCommentUseCase(gh<_i39.ViewPostRepository>()));
    gh.lazySingleton<_i64.SignInEmailPasswordUseCase>(
        () => _i64.SignInEmailPasswordUseCase(gh<_i31.SignInRepository>()));
    gh.lazySingleton<_i65.SignInGoogleUseCase>(
        () => _i65.SignInGoogleUseCase(gh<_i31.SignInRepository>()));
    gh.factory<_i66.SignUpCubit>(() => _i66.SignUpCubit(
          gh<_i58.RegisterApplicantUseCase>(),
          gh<_i59.RegisterBusinessUseCase>(),
          gh<_i60.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i67.SyncPostDataUseCase>(
        () => _i67.SyncPostDataUseCase(gh<_i39.ViewPostRepository>()));
    gh.factory<_i68.ViewJobCubit>(
        () => _i68.ViewJobCubit(gh<_i52.FetchJobUseCase>()));
    gh.factory<_i69.ViewPostBloc>(() => _i69.ViewPostBloc(
          gh<_i51.FetchDataCommentFirstLevelUseCase>(),
          gh<_i49.FavouriteCommentUseCase>(),
          gh<_i50.FavouritePostUseCase>(),
          gh<_i63.SendCommentUseCase>(),
          gh<_i67.SyncPostDataUseCase>(),
          gh<_i61.ReplyCommentUseCase>(),
          gh<_i54.GetReplyCommentUseCase>(),
          gh<_i48.DeleteCommentUseCase>(),
        ));
    gh.factory<_i70.ConnectionCubit>(() => _i70.ConnectionCubit(
          gh<_i20.FetchPostUseCase>(),
          gh<_i50.FavouritePostUseCase>(),
        ));
    gh.factory<_i71.SignInCubit>(() => _i71.SignInCubit(
          gh<_i64.SignInEmailPasswordUseCase>(),
          gh<_i65.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i72.InjectionModule {}
