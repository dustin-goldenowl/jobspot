// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i117;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i108;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i109;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i71;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i110;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i80;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i73;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i111;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i74;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i112;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i53;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i52;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i113;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i114;
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
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i75;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i115;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i91;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i43;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i92;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i36;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i35;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i98;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i42;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i41;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i99;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i46;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i45;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i116;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i49;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i48;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i103;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i51;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i50;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i94;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i95;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i96;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i105;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i63;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i62;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i86;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i106;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i65;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i64;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/get_language_use_case.dart'
    as _i88;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i107;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i67;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i66;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i84;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i90;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i104;
import 'package:shared_preferences/shared_preferences.dart' as _i47;

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
    gh.lazySingleton<_i37.LanguageRepository>(
        () => _i38.LanguageRepositoryImpl());
    gh.lazySingleton<_i39.ResumeRepository>(() => _i40.ResumeRepositoryImpl());
    gh.lazySingleton<_i41.SaveJobRepository>(
        () => _i42.SaveJobRepositoryImpl());
    gh.lazySingleton<_i43.SaveJobUseCase>(
        () => _i43.SaveJobUseCase(gh<_i33.HomeRepository>()));
    gh.factory<_i44.SearchJobPositionUseCase>(
        () => _i44.SearchJobPositionUseCase(gh<_i35.JobPositionRepository>()));
    gh.lazySingleton<_i45.SearchLanguageRepository>(
        () => _i46.SearchLanguageRepositoryImpl());
    await gh.lazySingletonAsync<_i47.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i48.SignInRepository>(() => _i49.LoginRepositoryImpl());
    gh.lazySingleton<_i50.SignUpRepository>(() => _i51.SignUpRepositoryImpl());
    gh.lazySingleton<_i52.SkillRepository>(() => _i53.SkillRepositoryImpl());
    gh.lazySingleton<_i54.UpdateAboutMeUseCase>(
        () => _i54.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i55.UpdateAppreciationUseCase>(() =>
        _i55.UpdateAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i56.UpdateEducationUseCase>(
        () => _i56.UpdateEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i57.UpdateExperienceUseCase>(
        () => _i57.UpdateExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i58.UpdateJobUseCase>(
        () => _i58.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i59.UpdateLanguageUseCase>(
        () => _i59.UpdateLanguageUseCase(gh<_i37.LanguageRepository>()));
    gh.lazySingleton<_i60.UpdatePostUseCase>(
        () => _i60.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i61.UpdateSkillUseCase>(
        () => _i61.UpdateSkillUseCase(gh<_i52.SkillRepository>()));
    gh.lazySingleton<_i62.ViewJobRepository>(
        () => _i63.ViewJobRepositoryImpl());
    gh.lazySingleton<_i64.ViewLanguageRepository>(
        () => _i65.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i66.ViewPostRepository>(
        () => _i67.ViewPostRepositoryImpl());
    gh.lazySingleton<_i68.AddAppreciationUseCase>(
        () => _i68.AddAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i69.AddEducationUseCase>(
        () => _i69.AddEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i70.AddExperienceUseCase>(
        () => _i70.AddExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i71.AddJobCubit>(() => _i71.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i58.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i72.AddLanguageUseCase>(
        () => _i72.AddLanguageUseCase(gh<_i37.LanguageRepository>()));
    gh.factory<_i73.AddPostCubit>(() => _i73.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i60.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i74.AddResumeUseCase>(
        () => _i74.AddResumeUseCase(gh<_i39.ResumeRepository>()));
    gh.factory<_i75.ApplyJobCubit>(
        () => _i75.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i76.DeleteAllSaveJobUseCase>(
        () => _i76.DeleteAllSaveJobUseCase(gh<_i41.SaveJobRepository>()));
    gh.lazySingleton<_i77.DeleteCommentUseCase>(
        () => _i77.DeleteCommentUseCase(gh<_i66.ViewPostRepository>()));
    gh.lazySingleton<_i78.DeleteEducationUseCase>(
        () => _i78.DeleteEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i79.DeleteExperienceUseCase>(
        () => _i79.DeleteExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.lazySingleton<_i80.DeleteLanguageUseCase>(
        () => _i80.DeleteLanguageUseCase(gh<_i37.LanguageRepository>()));
    gh.lazySingleton<_i81.DeleteResumeUseCase>(
        () => _i81.DeleteResumeUseCase(gh<_i39.ResumeRepository>()));
    gh.lazySingleton<_i82.FavouriteCommentUseCase>(
        () => _i82.FavouriteCommentUseCase(gh<_i66.ViewPostRepository>()));
    gh.lazySingleton<_i83.FavouritePostUseCase>(
        () => _i83.FavouritePostUseCase(gh<_i66.ViewPostRepository>()));
    gh.lazySingleton<_i84.FetchDataCommentFirstLevelUseCase>(() =>
        _i84.FetchDataCommentFirstLevelUseCase(gh<_i66.ViewPostRepository>()));
    gh.lazySingleton<_i85.FetchJobUseCase>(
        () => _i85.FetchJobUseCase(gh<_i33.HomeRepository>()));
    gh.lazySingleton<_i86.FetchJobUseCase>(
        () => _i86.FetchJobUseCase(gh<_i62.ViewJobRepository>()));
    gh.lazySingleton<_i87.GetCountriesUseCase>(
        () => _i87.GetCountriesUseCase(gh<_i45.SearchLanguageRepository>()));
    gh.lazySingleton<_i88.GetLanguagesUseCase>(
        () => _i88.GetLanguagesUseCase(gh<_i64.ViewLanguageRepository>()));
    gh.lazySingleton<_i89.GetListSkillUseCase>(
        () => _i89.GetListSkillUseCase(gh<_i52.SkillRepository>()));
    gh.lazySingleton<_i90.GetReplyCommentUseCase>(
        () => _i90.GetReplyCommentUseCase(gh<_i66.ViewPostRepository>()));
    gh.factory<_i91.HomeCubit>(() => _i91.HomeCubit(
          gh<_i85.FetchJobUseCase>(),
          gh<_i43.SaveJobUseCase>(),
        ));
    gh.factory<_i92.JobPositionCubit>(
        () => _i92.JobPositionCubit(gh<_i44.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i93.ListenSaveJobUseCase>(
        () => _i93.ListenSaveJobUseCase(gh<_i41.SaveJobRepository>()));
    gh.lazySingleton<_i94.RegisterApplicantUseCase>(
        () => _i94.RegisterApplicantUseCase(gh<_i50.SignUpRepository>()));
    gh.lazySingleton<_i95.RegisterBusinessUseCase>(
        () => _i95.RegisterBusinessUseCase(gh<_i50.SignUpRepository>()));
    gh.lazySingleton<_i96.RegisterGoogleUseCase>(
        () => _i96.RegisterGoogleUseCase(gh<_i50.SignUpRepository>()));
    gh.lazySingleton<_i97.ReplyCommentUseCase>(
        () => _i97.ReplyCommentUseCase(gh<_i66.ViewPostRepository>()));
    gh.factory<_i98.SaveJobCubit>(() => _i98.SaveJobCubit(
          gh<_i93.ListenSaveJobUseCase>(),
          gh<_i76.DeleteAllSaveJobUseCase>(),
          gh<_i43.SaveJobUseCase>(),
        ));
    gh.factory<_i99.SearchLanguageCubit>(
        () => _i99.SearchLanguageCubit(gh<_i87.GetCountriesUseCase>()));
    gh.lazySingleton<_i100.SendCommentUseCase>(
        () => _i100.SendCommentUseCase(gh<_i66.ViewPostRepository>()));
    gh.lazySingleton<_i101.SignInEmailPasswordUseCase>(
        () => _i101.SignInEmailPasswordUseCase(gh<_i48.SignInRepository>()));
    gh.lazySingleton<_i102.SignInGoogleUseCase>(
        () => _i102.SignInGoogleUseCase(gh<_i48.SignInRepository>()));
    gh.factory<_i103.SignUpCubit>(() => _i103.SignUpCubit(
          gh<_i94.RegisterApplicantUseCase>(),
          gh<_i95.RegisterBusinessUseCase>(),
          gh<_i96.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i104.SyncPostDataUseCase>(
        () => _i104.SyncPostDataUseCase(gh<_i66.ViewPostRepository>()));
    gh.factory<_i105.ViewJobCubit>(
        () => _i105.ViewJobCubit(gh<_i86.FetchJobUseCase>()));
    gh.factory<_i106.ViewLanguageCubit>(() => _i106.ViewLanguageCubit(
          gh<_i88.GetLanguagesUseCase>(),
          gh<_i80.DeleteLanguageUseCase>(),
        ));
    gh.factory<_i107.ViewPostBloc>(() => _i107.ViewPostBloc(
          gh<_i84.FetchDataCommentFirstLevelUseCase>(),
          gh<_i82.FavouriteCommentUseCase>(),
          gh<_i83.FavouritePostUseCase>(),
          gh<_i100.SendCommentUseCase>(),
          gh<_i104.SyncPostDataUseCase>(),
          gh<_i97.ReplyCommentUseCase>(),
          gh<_i90.GetReplyCommentUseCase>(),
          gh<_i77.DeleteCommentUseCase>(),
        ));
    gh.factory<_i108.AddAppreciationCubit>(() => _i108.AddAppreciationCubit(
          gh<_i68.AddAppreciationUseCase>(),
          gh<_i55.UpdateAppreciationUseCase>(),
          gh<_i19.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i109.AddEducationCubit>(() => _i109.AddEducationCubit(
          gh<_i69.AddEducationUseCase>(),
          gh<_i78.DeleteEducationUseCase>(),
          gh<_i56.UpdateEducationUseCase>(),
        ));
    gh.factory<_i110.AddLanguageCubit>(() => _i110.AddLanguageCubit(
          gh<_i72.AddLanguageUseCase>(),
          gh<_i59.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i111.AddResumeCubit>(
        () => _i111.AddResumeCubit(gh<_i74.AddResumeUseCase>()));
    gh.factory<_i112.AddSkillCubit>(() => _i112.AddSkillCubit(
          gh<_i89.GetListSkillUseCase>(),
          gh<_i61.UpdateSkillUseCase>(),
        ));
    gh.factory<_i113.AddWorkExperienceCubit>(() => _i113.AddWorkExperienceCubit(
          gh<_i70.AddExperienceUseCase>(),
          gh<_i57.UpdateExperienceUseCase>(),
          gh<_i79.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i114.ApplicantProfileCubit>(() => _i114.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i81.DeleteResumeUseCase>(),
          gh<_i28.GetListPostUseCase>(),
          gh<_i32.GetWorkExperienceUseCase>(),
          gh<_i27.GetEducationUseCase>(),
          gh<_i26.GetAppreciationUseCase>(),
          gh<_i29.GetResumeUseCase>(),
          gh<_i30.GetSkillUseCase>(),
          gh<_i31.GetUserInfoUseCase>(),
          gh<_i88.GetLanguagesUseCase>(),
          gh<_i54.UpdateAboutMeUseCase>(),
        ));
    gh.factory<_i115.ConnectionCubit>(() => _i115.ConnectionCubit(
          gh<_i25.FetchPostUseCase>(),
          gh<_i83.FavouritePostUseCase>(),
        ));
    gh.factory<_i116.SignInCubit>(() => _i116.SignInCubit(
          gh<_i101.SignInEmailPasswordUseCase>(),
          gh<_i102.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i117.InjectionModule {}
