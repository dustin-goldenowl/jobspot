// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i102;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i94;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i50;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i95;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i51;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i63;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i64;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i96;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i97;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i49;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i48;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i98;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i99;
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
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i30;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i31;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i32;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i66;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i100;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i79;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i41;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i80;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i36;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i35;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i42;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i86;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i101;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i45;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i44;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i88;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i90;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i47;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i46;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i84;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i92;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i57;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i56;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i93;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i59;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i58;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i73;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i74;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i91;
import 'package:shared_preferences/shared_preferences.dart' as _i43;

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
    gh.factory<_i30.GetSkillUseCase>(
        () => _i30.GetSkillUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i31.GetUserInfoUseCase>(
        () => _i31.GetUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i32.GetWorkExperienceUseCase>(() =>
        _i32.GetWorkExperienceUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i33.HomeRepository>(() => _i34.HomeRepositoryImpl());
    gh.lazySingleton<_i35.JobPositionRepository>(
        () => _i36.JobPositionRepositoryImpl());
    gh.lazySingleton<_i37.ResumeRepository>(() => _i38.ResumeRepositoryImpl());
    gh.lazySingleton<_i39.SaveJobRepository>(
        () => _i40.SaveJobRepositoryImpl());
    gh.lazySingleton<_i41.SaveJobUseCase>(
        () => _i41.SaveJobUseCase(gh<_i33.HomeRepository>()));
    gh.factory<_i42.SearchJobPositionUseCase>(
        () => _i42.SearchJobPositionUseCase(gh<_i35.JobPositionRepository>()));
    await gh.lazySingletonAsync<_i43.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i44.SignInRepository>(() => _i45.LoginRepositoryImpl());
    gh.lazySingleton<_i46.SignUpRepository>(() => _i47.SignUpRepositoryImpl());
    gh.lazySingleton<_i48.SkillRepository>(() => _i49.SkillRepositoryImpl());
    gh.lazySingleton<_i50.UpdateAppreciationUseCase>(() =>
        _i50.UpdateAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i51.UpdateEducationUseCase>(
        () => _i51.UpdateEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i52.UpdateExperienceUseCase>(
        () => _i52.UpdateExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i53.UpdateJobUseCase>(
        () => _i53.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i54.UpdatePostUseCase>(
        () => _i54.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i55.UpdateSkillUseCase>(
        () => _i55.UpdateSkillUseCase(gh<_i48.SkillRepository>()));
    gh.lazySingleton<_i56.ViewJobRepository>(
        () => _i57.ViewJobRepositoryImpl());
    gh.lazySingleton<_i58.ViewPostRepository>(
        () => _i59.ViewPostRepositoryImpl());
    gh.lazySingleton<_i60.AddAppreciationUseCase>(
        () => _i60.AddAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i61.AddEducationUseCase>(
        () => _i61.AddEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i62.AddExperienceUseCase>(
        () => _i62.AddExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i63.AddJobCubit>(() => _i63.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i53.UpdateJobUseCase>(),
        ));
    gh.factory<_i64.AddPostCubit>(() => _i64.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i54.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i65.AddResumeUseCase>(
        () => _i65.AddResumeUseCase(gh<_i37.ResumeRepository>()));
    gh.factory<_i66.ApplyJobCubit>(
        () => _i66.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i67.DeleteAllSaveJobUseCase>(
        () => _i67.DeleteAllSaveJobUseCase(gh<_i39.SaveJobRepository>()));
    gh.lazySingleton<_i68.DeleteCommentUseCase>(
        () => _i68.DeleteCommentUseCase(gh<_i58.ViewPostRepository>()));
    gh.lazySingleton<_i69.DeleteEducationUseCase>(
        () => _i69.DeleteEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i70.DeleteExperienceUseCase>(
        () => _i70.DeleteExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.lazySingleton<_i71.DeleteResumeUseCase>(
        () => _i71.DeleteResumeUseCase(gh<_i37.ResumeRepository>()));
    gh.lazySingleton<_i72.FavouriteCommentUseCase>(
        () => _i72.FavouriteCommentUseCase(gh<_i58.ViewPostRepository>()));
    gh.lazySingleton<_i73.FavouritePostUseCase>(
        () => _i73.FavouritePostUseCase(gh<_i58.ViewPostRepository>()));
    gh.lazySingleton<_i74.FetchDataCommentFirstLevelUseCase>(() =>
        _i74.FetchDataCommentFirstLevelUseCase(gh<_i58.ViewPostRepository>()));
    gh.lazySingleton<_i75.FetchJobUseCase>(
        () => _i75.FetchJobUseCase(gh<_i33.HomeRepository>()));
    gh.lazySingleton<_i76.FetchJobUseCase>(
        () => _i76.FetchJobUseCase(gh<_i56.ViewJobRepository>()));
    gh.lazySingleton<_i77.GetListSkillUseCase>(
        () => _i77.GetListSkillUseCase(gh<_i48.SkillRepository>()));
    gh.lazySingleton<_i78.GetReplyCommentUseCase>(
        () => _i78.GetReplyCommentUseCase(gh<_i58.ViewPostRepository>()));
    gh.factory<_i79.HomeCubit>(() => _i79.HomeCubit(
          gh<_i75.FetchJobUseCase>(),
          gh<_i41.SaveJobUseCase>(),
        ));
    gh.factory<_i80.JobPositionCubit>(
        () => _i80.JobPositionCubit(gh<_i42.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i81.ListenSaveJobUseCase>(
        () => _i81.ListenSaveJobUseCase(gh<_i39.SaveJobRepository>()));
    gh.lazySingleton<_i82.RegisterApplicantUseCase>(
        () => _i82.RegisterApplicantUseCase(gh<_i46.SignUpRepository>()));
    gh.lazySingleton<_i83.RegisterBusinessUseCase>(
        () => _i83.RegisterBusinessUseCase(gh<_i46.SignUpRepository>()));
    gh.lazySingleton<_i84.RegisterGoogleUseCase>(
        () => _i84.RegisterGoogleUseCase(gh<_i46.SignUpRepository>()));
    gh.lazySingleton<_i85.ReplyCommentUseCase>(
        () => _i85.ReplyCommentUseCase(gh<_i58.ViewPostRepository>()));
    gh.factory<_i86.SaveJobCubit>(() => _i86.SaveJobCubit(
          gh<_i81.ListenSaveJobUseCase>(),
          gh<_i67.DeleteAllSaveJobUseCase>(),
          gh<_i41.SaveJobUseCase>(),
        ));
    gh.lazySingleton<_i87.SendCommentUseCase>(
        () => _i87.SendCommentUseCase(gh<_i58.ViewPostRepository>()));
    gh.lazySingleton<_i88.SignInEmailPasswordUseCase>(
        () => _i88.SignInEmailPasswordUseCase(gh<_i44.SignInRepository>()));
    gh.lazySingleton<_i89.SignInGoogleUseCase>(
        () => _i89.SignInGoogleUseCase(gh<_i44.SignInRepository>()));
    gh.factory<_i90.SignUpCubit>(() => _i90.SignUpCubit(
          gh<_i82.RegisterApplicantUseCase>(),
          gh<_i83.RegisterBusinessUseCase>(),
          gh<_i84.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i91.SyncPostDataUseCase>(
        () => _i91.SyncPostDataUseCase(gh<_i58.ViewPostRepository>()));
    gh.factory<_i92.ViewJobCubit>(
        () => _i92.ViewJobCubit(gh<_i76.FetchJobUseCase>()));
    gh.factory<_i93.ViewPostBloc>(() => _i93.ViewPostBloc(
          gh<_i74.FetchDataCommentFirstLevelUseCase>(),
          gh<_i72.FavouriteCommentUseCase>(),
          gh<_i73.FavouritePostUseCase>(),
          gh<_i87.SendCommentUseCase>(),
          gh<_i91.SyncPostDataUseCase>(),
          gh<_i85.ReplyCommentUseCase>(),
          gh<_i78.GetReplyCommentUseCase>(),
          gh<_i68.DeleteCommentUseCase>(),
        ));
    gh.factory<_i94.AddAppreciationCubit>(() => _i94.AddAppreciationCubit(
          gh<_i60.AddAppreciationUseCase>(),
          gh<_i50.UpdateAppreciationUseCase>(),
          gh<_i19.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i95.AddEducationCubit>(() => _i95.AddEducationCubit(
          gh<_i61.AddEducationUseCase>(),
          gh<_i69.DeleteEducationUseCase>(),
          gh<_i51.UpdateEducationUseCase>(),
        ));
    gh.factory<_i96.AddResumeCubit>(
        () => _i96.AddResumeCubit(gh<_i65.AddResumeUseCase>()));
    gh.factory<_i97.AddSkillCubit>(() => _i97.AddSkillCubit(
          gh<_i77.GetListSkillUseCase>(),
          gh<_i55.UpdateSkillUseCase>(),
        ));
    gh.factory<_i98.AddWorkExperienceCubit>(() => _i98.AddWorkExperienceCubit(
          gh<_i62.AddExperienceUseCase>(),
          gh<_i52.UpdateExperienceUseCase>(),
          gh<_i70.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i99.ApplicantProfileCubit>(() => _i99.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i71.DeleteResumeUseCase>(),
          gh<_i28.GetListPostUseCase>(),
          gh<_i32.GetWorkExperienceUseCase>(),
          gh<_i27.GetEducationUseCase>(),
          gh<_i26.GetAppreciationUseCase>(),
          gh<_i29.GetResumeUseCase>(),
          gh<_i30.GetSkillUseCase>(),
          gh<_i31.GetUserInfoUseCase>(),
        ));
    gh.factory<_i100.ConnectionCubit>(() => _i100.ConnectionCubit(
          gh<_i25.FetchPostUseCase>(),
          gh<_i73.FavouritePostUseCase>(),
        ));
    gh.factory<_i101.SignInCubit>(() => _i101.SignInCubit(
          gh<_i88.SignInEmailPasswordUseCase>(),
          gh<_i89.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i102.InjectionModule {}
