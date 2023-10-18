// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i95;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i88;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i46;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i89;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i58;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i59;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i50;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i90;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i36;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i35;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i91;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i92;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i27;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_post_use_case.dart'
    as _i28;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i30;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i61;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i93;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i73;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i32;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i31;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i39;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i74;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i40;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i80;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i94;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i43;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i42;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i84;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i45;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i44;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i86;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i52;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i51;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i87;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i54;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i53;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i85;
import 'package:shared_preferences/shared_preferences.dart' as _i41;

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
    gh.lazySingleton<_i15.AppreciationRepository>(
        () => _i16.AppreciationRepositoryImpl());
    gh.lazySingleton<_i17.ConnectionRepository>(
        () => _i18.ConnectionRepositoryImpl());
    gh.lazySingleton<_i19.DeleteAppreciationUseCase>(() =>
        _i19.DeleteAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i20.DeletePostUseCase>(
        () => _i20.DeletePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i21.EducationRepository>(
        () => _i22.EducationRepositoryImpl());
    gh.lazySingleton<_i23.ExperienceRepository>(
        () => _i24.ExperienceRepositoryImpl());
    gh.lazySingleton<_i25.FetchPostUseCase>(
        () => _i25.FetchPostUseCase(gh<_i17.ConnectionRepository>()));
    gh.lazySingleton<_i26.GetAppreciationUseCase>(() =>
        _i26.GetAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i27.GetEducationUseCase>(
        () => _i27.GetEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i28.GetListPostUseCase>(
        () => _i28.GetListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i29.GetResumeUseCase>(
        () => _i29.GetResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i30.GetWorkExperienceUseCase>(() =>
        _i30.GetWorkExperienceUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i31.HomeRepository>(() => _i32.HomeRepositoryImpl());
    gh.lazySingleton<_i33.JobPositionRepository>(
        () => _i34.JobPositionRepositoryImpl());
    gh.lazySingleton<_i35.ResumeRepository>(() => _i36.ResumeRepositoryImpl());
    gh.lazySingleton<_i37.SaveJobRepository>(
        () => _i38.SaveJobRepositoryImpl());
    gh.lazySingleton<_i39.SaveJobUseCase>(
        () => _i39.SaveJobUseCase(gh<_i31.HomeRepository>()));
    gh.factory<_i40.SearchJobPositionUseCase>(
        () => _i40.SearchJobPositionUseCase(gh<_i33.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i41.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i42.SignInRepository>(() => _i43.LoginRepositoryImpl());
    gh.lazySingleton<_i44.SignUpRepository>(() => _i45.SignUpRepositoryImpl());
    gh.lazySingleton<_i46.UpdateAppreciationUseCase>(() =>
        _i46.UpdateAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i47.UpdateEducationUseCase>(
        () => _i47.UpdateEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i48.UpdateExperienceUseCase>(
        () => _i48.UpdateExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i49.UpdateJobUseCase>(
        () => _i49.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i50.UpdatePostUseCase>(
        () => _i50.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.lazySingleton<_i51.ViewJobRepository>(
        () => _i52.ViewJobRepositoryImpl());
    gh.lazySingleton<_i53.ViewPostRepository>(
        () => _i54.ViewPostRepositoryImpl());
    gh.lazySingleton<_i55.AddAppreciationUseCase>(
        () => _i55.AddAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i56.AddEducationUseCase>(
        () => _i56.AddEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i57.AddExperienceUseCase>(
        () => _i57.AddExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i58.AddJobCubit>(() => _i58.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i49.UpdateJobUseCase>(),
        ));
    gh.factory<_i59.AddPostCubit>(() => _i59.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i50.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i60.AddResumeUseCase>(
        () => _i60.AddResumeUseCase(gh<_i35.ResumeRepository>()));
    gh.factory<_i61.ApplyJobCubit>(
        () => _i61.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i62.DeleteAllSaveJobUseCase>(
        () => _i62.DeleteAllSaveJobUseCase(gh<_i37.SaveJobRepository>()));
    gh.lazySingleton<_i63.DeleteCommentUseCase>(
        () => _i63.DeleteCommentUseCase(gh<_i53.ViewPostRepository>()));
    gh.lazySingleton<_i64.DeleteEducationUseCase>(
        () => _i64.DeleteEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i65.DeleteExperienceUseCase>(
        () => _i65.DeleteExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.lazySingleton<_i66.DeleteResumeUseCase>(
        () => _i66.DeleteResumeUseCase(gh<_i35.ResumeRepository>()));
    gh.lazySingleton<_i67.FavouriteCommentUseCase>(
        () => _i67.FavouriteCommentUseCase(gh<_i53.ViewPostRepository>()));
    gh.lazySingleton<_i68.FavouritePostUseCase>(
        () => _i68.FavouritePostUseCase(gh<_i53.ViewPostRepository>()));
    gh.lazySingleton<_i69.FetchDataCommentFirstLevelUseCase>(() =>
        _i69.FetchDataCommentFirstLevelUseCase(gh<_i53.ViewPostRepository>()));
    gh.lazySingleton<_i70.FetchJobUseCase>(
        () => _i70.FetchJobUseCase(gh<_i51.ViewJobRepository>()));
    gh.lazySingleton<_i71.FetchJobUseCase>(
        () => _i71.FetchJobUseCase(gh<_i31.HomeRepository>()));
    gh.lazySingleton<_i72.GetReplyCommentUseCase>(
        () => _i72.GetReplyCommentUseCase(gh<_i53.ViewPostRepository>()));
    gh.factory<_i73.HomeCubit>(() => _i73.HomeCubit(
          gh<_i71.FetchJobUseCase>(),
          gh<_i39.SaveJobUseCase>(),
        ));
    gh.factory<_i74.JobPositionCubit>(
        () => _i74.JobPositionCubit(gh<_i40.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i75.ListenSaveJobUseCase>(
        () => _i75.ListenSaveJobUseCase(gh<_i37.SaveJobRepository>()));
    gh.lazySingleton<_i76.RegisterApplicantUseCase>(
        () => _i76.RegisterApplicantUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i77.RegisterBusinessUseCase>(
        () => _i77.RegisterBusinessUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i78.RegisterGoogleUseCase>(
        () => _i78.RegisterGoogleUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i79.ReplyCommentUseCase>(
        () => _i79.ReplyCommentUseCase(gh<_i53.ViewPostRepository>()));
    gh.factory<_i80.SaveJobCubit>(() => _i80.SaveJobCubit(
          gh<_i75.ListenSaveJobUseCase>(),
          gh<_i62.DeleteAllSaveJobUseCase>(),
          gh<_i39.SaveJobUseCase>(),
        ));
    gh.lazySingleton<_i81.SendCommentUseCase>(
        () => _i81.SendCommentUseCase(gh<_i53.ViewPostRepository>()));
    gh.lazySingleton<_i82.SignInEmailPasswordUseCase>(
        () => _i82.SignInEmailPasswordUseCase(gh<_i42.SignInRepository>()));
    gh.lazySingleton<_i83.SignInGoogleUseCase>(
        () => _i83.SignInGoogleUseCase(gh<_i42.SignInRepository>()));
    gh.factory<_i84.SignUpCubit>(() => _i84.SignUpCubit(
          gh<_i76.RegisterApplicantUseCase>(),
          gh<_i77.RegisterBusinessUseCase>(),
          gh<_i78.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i85.SyncPostDataUseCase>(
        () => _i85.SyncPostDataUseCase(gh<_i53.ViewPostRepository>()));
    gh.factory<_i86.ViewJobCubit>(
        () => _i86.ViewJobCubit(gh<_i70.FetchJobUseCase>()));
    gh.factory<_i87.ViewPostBloc>(() => _i87.ViewPostBloc(
          gh<_i69.FetchDataCommentFirstLevelUseCase>(),
          gh<_i67.FavouriteCommentUseCase>(),
          gh<_i68.FavouritePostUseCase>(),
          gh<_i81.SendCommentUseCase>(),
          gh<_i85.SyncPostDataUseCase>(),
          gh<_i79.ReplyCommentUseCase>(),
          gh<_i72.GetReplyCommentUseCase>(),
          gh<_i63.DeleteCommentUseCase>(),
        ));
    gh.factory<_i88.AddAppreciationCubit>(() => _i88.AddAppreciationCubit(
          gh<_i55.AddAppreciationUseCase>(),
          gh<_i46.UpdateAppreciationUseCase>(),
          gh<_i19.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i89.AddEducationCubit>(() => _i89.AddEducationCubit(
          gh<_i56.AddEducationUseCase>(),
          gh<_i64.DeleteEducationUseCase>(),
          gh<_i47.UpdateEducationUseCase>(),
        ));
    gh.factory<_i90.AddResumeCubit>(
        () => _i90.AddResumeCubit(gh<_i60.AddResumeUseCase>()));
    gh.factory<_i91.AddWorkExperienceCubit>(() => _i91.AddWorkExperienceCubit(
          gh<_i57.AddExperienceUseCase>(),
          gh<_i48.UpdateExperienceUseCase>(),
          gh<_i65.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i92.ApplicantProfileCubit>(() => _i92.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i66.DeleteResumeUseCase>(),
          gh<_i28.GetListPostUseCase>(),
          gh<_i30.GetWorkExperienceUseCase>(),
          gh<_i27.GetEducationUseCase>(),
          gh<_i26.GetAppreciationUseCase>(),
          gh<_i29.GetResumeUseCase>(),
        ));
    gh.factory<_i93.ConnectionCubit>(() => _i93.ConnectionCubit(
          gh<_i25.FetchPostUseCase>(),
          gh<_i68.FavouritePostUseCase>(),
        ));
    gh.factory<_i94.SignInCubit>(() => _i94.SignInCubit(
          gh<_i82.SignInEmailPasswordUseCase>(),
          gh<_i83.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i95.InjectionModule {}
