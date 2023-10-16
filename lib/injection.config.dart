// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i61;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i35;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i36;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i30;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i37;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart'
    as _i18;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i38;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i59;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i46;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i20;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i19;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i43;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i47;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i23;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i60;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i26;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i25;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i55;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i28;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i27;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i50;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i57;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i32;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i31;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i58;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i39;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i40;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i41;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i42;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i45;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i51;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i56;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

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
    gh.factory<_i23.SearchJobPositionUseCase>(
        () => _i23.SearchJobPositionUseCase(gh<_i21.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i24.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i25.SignInRepository>(() => _i26.LoginRepositoryImpl());
    gh.lazySingleton<_i27.SignUpRepository>(() => _i28.SignUpRepositoryImpl());
    gh.factory<_i29.UpdateJobUseCase>(
        () => _i29.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i30.UpdatePostUseCase>(
        () => _i30.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i31.ViewJobRepository>(
        () => _i32.ViewJobRepositoryImpl());
    gh.lazySingleton<_i33.ViewPostRepository>(
        () => _i34.ViewPostRepositoryImpl());
    gh.factory<_i35.AddJobCubit>(() => _i35.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i29.UpdateJobUseCase>(),
        ));
    gh.factory<_i36.AddPostCubit>(() => _i36.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i30.UpdatePostUseCase>(),
        ));
    gh.factory<_i37.ApplicantProfileCubit>(
        () => _i37.ApplicantProfileCubit(gh<_i18.GetListPostUseCase>()));
    gh.factory<_i38.ApplyJobCubit>(
        () => _i38.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i39.DeleteCommentUseCase>(
        () => _i39.DeleteCommentUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i40.FavouriteCommentUseCase>(
        () => _i40.FavouriteCommentUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i41.FavouritePostUseCase>(
        () => _i41.FavouritePostUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i42.FetchDataCommentFirstLevelUseCase>(() =>
        _i42.FetchDataCommentFirstLevelUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i43.FetchJobUseCase>(
        () => _i43.FetchJobUseCase(gh<_i19.HomeRepository>()));
    gh.lazySingleton<_i44.FetchJobUseCase>(
        () => _i44.FetchJobUseCase(gh<_i31.ViewJobRepository>()));
    gh.lazySingleton<_i45.GetReplyCommentUseCase>(
        () => _i45.GetReplyCommentUseCase(gh<_i33.ViewPostRepository>()));
    gh.factory<_i46.HomeCubit>(
        () => _i46.HomeCubit(gh<_i43.FetchJobUseCase>()));
    gh.factory<_i47.JobPositionCubit>(
        () => _i47.JobPositionCubit(gh<_i23.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i48.RegisterApplicantUseCase>(
        () => _i48.RegisterApplicantUseCase(gh<_i27.SignUpRepository>()));
    gh.lazySingleton<_i49.RegisterBusinessUseCase>(
        () => _i49.RegisterBusinessUseCase(gh<_i27.SignUpRepository>()));
    gh.lazySingleton<_i50.RegisterGoogleUseCase>(
        () => _i50.RegisterGoogleUseCase(gh<_i27.SignUpRepository>()));
    gh.lazySingleton<_i51.ReplyCommentUseCase>(
        () => _i51.ReplyCommentUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i52.SendCommentUseCase>(
        () => _i52.SendCommentUseCase(gh<_i33.ViewPostRepository>()));
    gh.lazySingleton<_i53.SignInEmailPasswordUseCase>(
        () => _i53.SignInEmailPasswordUseCase(gh<_i25.SignInRepository>()));
    gh.lazySingleton<_i54.SignInGoogleUseCase>(
        () => _i54.SignInGoogleUseCase(gh<_i25.SignInRepository>()));
    gh.factory<_i55.SignUpCubit>(() => _i55.SignUpCubit(
          gh<_i48.RegisterApplicantUseCase>(),
          gh<_i49.RegisterBusinessUseCase>(),
          gh<_i50.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i56.SyncPostDataUseCase>(
        () => _i56.SyncPostDataUseCase(gh<_i33.ViewPostRepository>()));
    gh.factory<_i57.ViewJobCubit>(
        () => _i57.ViewJobCubit(gh<_i44.FetchJobUseCase>()));
    gh.factory<_i58.ViewPostBloc>(() => _i58.ViewPostBloc(
          gh<_i42.FetchDataCommentFirstLevelUseCase>(),
          gh<_i40.FavouriteCommentUseCase>(),
          gh<_i41.FavouritePostUseCase>(),
          gh<_i52.SendCommentUseCase>(),
          gh<_i56.SyncPostDataUseCase>(),
          gh<_i51.ReplyCommentUseCase>(),
          gh<_i45.GetReplyCommentUseCase>(),
          gh<_i39.DeleteCommentUseCase>(),
        ));
    gh.factory<_i59.ConnectionCubit>(() => _i59.ConnectionCubit(
          gh<_i17.FetchPostUseCase>(),
          gh<_i41.FavouritePostUseCase>(),
        ));
    gh.factory<_i60.SignInCubit>(() => _i60.SignInCubit(
          gh<_i53.SignInEmailPasswordUseCase>(),
          gh<_i54.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i61.InjectionModule {}
