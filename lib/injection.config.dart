// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i131;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i122;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i73;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i123;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i74;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i84;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i76;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i124;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i32;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i31;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i86;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i78;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i125;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i126;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i47;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i46;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i127;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i128;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i50;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i51;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i80;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i102;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i28;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i27;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i92;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i37;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i103;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i30;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i29;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i38;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i109;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i36;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i35;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i110;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i94;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i130;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i43;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i42;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i112;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i113;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i114;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i45;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i44;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i107;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i117;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i61;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i60;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i118;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i66;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i65;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i95;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i96;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i99;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i119;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i68;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i67;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i120;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i70;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i69;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i121;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i72;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i71;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i88;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i90;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i98;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i111;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i116;
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
    gh.factory<_i26.GetSkillUseCase>(
        () => _i26.GetSkillUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i27.HomeRepository>(() => _i28.HomeRepositoryImpl());
    gh.lazySingleton<_i29.JobPositionRepository>(
        () => _i30.JobPositionRepositoryImpl());
    gh.lazySingleton<_i31.LanguageRepository>(
        () => _i32.LanguageRepositoryImpl());
    gh.lazySingleton<_i33.ResumeRepository>(() => _i34.ResumeRepositoryImpl());
    gh.lazySingleton<_i35.SaveJobRepository>(
        () => _i36.SaveJobRepositoryImpl());
    gh.lazySingleton<_i37.SaveJobUseCase>(
        () => _i37.SaveJobUseCase(gh<_i27.HomeRepository>()));
    gh.factory<_i38.SearchJobPositionUseCase>(
        () => _i38.SearchJobPositionUseCase(gh<_i29.JobPositionRepository>()));
    gh.lazySingleton<_i39.SearchLanguageRepository>(
        () => _i40.SearchLanguageRepositoryImpl());
    await gh.lazySingletonAsync<_i41.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i42.SignInRepository>(() => _i43.LoginRepositoryImpl());
    gh.lazySingleton<_i44.SignUpRepository>(() => _i45.SignUpRepositoryImpl());
    gh.lazySingleton<_i46.SkillRepository>(() => _i47.SkillRepositoryImpl());
    gh.lazySingleton<_i48.StreamAppreciationUseCase>(() =>
        _i48.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i49.StreamEducationUseCase>(() =>
        _i49.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i50.StreamListPostUseCase>(() =>
        _i50.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i51.StreamResumeUseCase>(
        () => _i51.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i52.StreamUserInfoUseCase>(() =>
        _i52.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i53.StreamWorkExperienceUseCase>(() =>
        _i53.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
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
        () => _i59.UpdateLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.lazySingleton<_i60.UpdatePasswordRepository>(
        () => _i61.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i62.UpdatePostUseCase>(
        () => _i62.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i63.UpdateSkillUseCase>(
        () => _i63.UpdateSkillUseCase(gh<_i46.SkillRepository>()));
    gh.lazySingleton<_i64.ValidatePassworkUseCase>(() =>
        _i64.ValidatePassworkUseCase(gh<_i60.UpdatePasswordRepository>()));
    gh.lazySingleton<_i65.ViewApplicantProfileRepository>(
        () => _i66.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i67.ViewJobRepository>(
        () => _i68.ViewJobRepositoryImpl());
    gh.lazySingleton<_i69.ViewLanguageRepository>(
        () => _i70.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i71.ViewPostRepository>(
        () => _i72.ViewPostRepositoryImpl());
    gh.lazySingleton<_i73.AddAppreciationUseCase>(
        () => _i73.AddAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i74.AddEducationUseCase>(
        () => _i74.AddEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i75.AddExperienceUseCase>(
        () => _i75.AddExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i76.AddJobCubit>(() => _i76.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i58.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i77.AddLanguageUseCase>(
        () => _i77.AddLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.factory<_i78.AddPostCubit>(() => _i78.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i62.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i79.AddResumeUseCase>(
        () => _i79.AddResumeUseCase(gh<_i33.ResumeRepository>()));
    gh.factory<_i80.ApplyJobCubit>(
        () => _i80.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i81.ChangePasswordUseCase>(
        () => _i81.ChangePasswordUseCase(gh<_i60.UpdatePasswordRepository>()));
    gh.lazySingleton<_i82.DeleteAllSaveJobUseCase>(
        () => _i82.DeleteAllSaveJobUseCase(gh<_i35.SaveJobRepository>()));
    gh.lazySingleton<_i83.DeleteCommentUseCase>(
        () => _i83.DeleteCommentUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i84.DeleteEducationUseCase>(
        () => _i84.DeleteEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i85.DeleteExperienceUseCase>(
        () => _i85.DeleteExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.lazySingleton<_i86.DeleteLanguageUseCase>(
        () => _i86.DeleteLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.lazySingleton<_i87.DeleteResumeUseCase>(
        () => _i87.DeleteResumeUseCase(gh<_i33.ResumeRepository>()));
    gh.lazySingleton<_i88.FavouriteCommentUseCase>(
        () => _i88.FavouriteCommentUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i89.FavouritePostUseCase>(
        () => _i89.FavouritePostUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i90.FetchDataCommentFirstLevelUseCase>(() =>
        _i90.FetchDataCommentFirstLevelUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i91.FetchJobUseCase>(
        () => _i91.FetchJobUseCase(gh<_i67.ViewJobRepository>()));
    gh.lazySingleton<_i92.FetchJobUseCase>(
        () => _i92.FetchJobUseCase(gh<_i27.HomeRepository>()));
    gh.lazySingleton<_i93.GetAppreciationUseCase>(() =>
        _i93.GetAppreciationUseCase(gh<_i65.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i94.GetCountriesUseCase>(
        () => _i94.GetCountriesUseCase(gh<_i39.SearchLanguageRepository>()));
    gh.factory<_i95.GetEducationUseCase>(() =>
        _i95.GetEducationUseCase(gh<_i65.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i96.GetLanguageUseCase>(() =>
        _i96.GetLanguageUseCase(gh<_i65.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i97.GetListSkillUseCase>(
        () => _i97.GetListSkillUseCase(gh<_i46.SkillRepository>()));
    gh.lazySingleton<_i98.GetReplyCommentUseCase>(
        () => _i98.GetReplyCommentUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i99.GetResumeUseCase>(
        () => _i99.GetResumeUseCase(gh<_i65.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i100.GetUserInfoUseCase>(() =>
        _i100.GetUserInfoUseCase(gh<_i65.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i101.GetWorkExperienceUseCase>(() =>
        _i101.GetWorkExperienceUseCase(
            gh<_i65.ViewApplicantProfileRepository>()));
    gh.factory<_i102.HomeCubit>(() => _i102.HomeCubit(
          gh<_i92.FetchJobUseCase>(),
          gh<_i37.SaveJobUseCase>(),
        ));
    gh.factory<_i103.JobPositionCubit>(
        () => _i103.JobPositionCubit(gh<_i38.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i104.ListenSaveJobUseCase>(
        () => _i104.ListenSaveJobUseCase(gh<_i35.SaveJobRepository>()));
    gh.lazySingleton<_i105.RegisterApplicantUseCase>(
        () => _i105.RegisterApplicantUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i106.RegisterBusinessUseCase>(
        () => _i106.RegisterBusinessUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i107.RegisterGoogleUseCase>(
        () => _i107.RegisterGoogleUseCase(gh<_i44.SignUpRepository>()));
    gh.lazySingleton<_i108.ReplyCommentUseCase>(
        () => _i108.ReplyCommentUseCase(gh<_i71.ViewPostRepository>()));
    gh.factory<_i109.SaveJobCubit>(() => _i109.SaveJobCubit(
          gh<_i104.ListenSaveJobUseCase>(),
          gh<_i82.DeleteAllSaveJobUseCase>(),
          gh<_i37.SaveJobUseCase>(),
        ));
    gh.factory<_i110.SearchLanguageCubit>(
        () => _i110.SearchLanguageCubit(gh<_i94.GetCountriesUseCase>()));
    gh.lazySingleton<_i111.SendCommentUseCase>(
        () => _i111.SendCommentUseCase(gh<_i71.ViewPostRepository>()));
    gh.lazySingleton<_i112.SignInEmailPasswordUseCase>(
        () => _i112.SignInEmailPasswordUseCase(gh<_i42.SignInRepository>()));
    gh.lazySingleton<_i113.SignInGoogleUseCase>(
        () => _i113.SignInGoogleUseCase(gh<_i42.SignInRepository>()));
    gh.factory<_i114.SignUpCubit>(() => _i114.SignUpCubit(
          gh<_i105.RegisterApplicantUseCase>(),
          gh<_i106.RegisterBusinessUseCase>(),
          gh<_i107.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i115.StreamLanguagesUseCase>(
        () => _i115.StreamLanguagesUseCase(gh<_i69.ViewLanguageRepository>()));
    gh.lazySingleton<_i116.SyncPostDataUseCase>(
        () => _i116.SyncPostDataUseCase(gh<_i71.ViewPostRepository>()));
    gh.factory<_i117.UpdatePasswordCubit>(() => _i117.UpdatePasswordCubit(
          gh<_i81.ChangePasswordUseCase>(),
          gh<_i64.ValidatePassworkUseCase>(),
        ));
    gh.factory<_i118.ViewApplicantProfileCubit>(
        () => _i118.ViewApplicantProfileCubit(
              gh<_i93.GetAppreciationUseCase>(),
              gh<_i95.GetEducationUseCase>(),
              gh<_i96.GetLanguageUseCase>(),
              gh<_i99.GetResumeUseCase>(),
              gh<_i26.GetSkillUseCase>(),
              gh<_i100.GetUserInfoUseCase>(),
              gh<_i101.GetWorkExperienceUseCase>(),
              gh<_i50.StreamListPostUseCase>(),
              gh<_i89.FavouritePostUseCase>(),
            ));
    gh.factory<_i119.ViewJobCubit>(
        () => _i119.ViewJobCubit(gh<_i91.FetchJobUseCase>()));
    gh.factory<_i120.ViewLanguageCubit>(() => _i120.ViewLanguageCubit(
          gh<_i115.StreamLanguagesUseCase>(),
          gh<_i86.DeleteLanguageUseCase>(),
        ));
    gh.factory<_i121.ViewPostBloc>(() => _i121.ViewPostBloc(
          gh<_i90.FetchDataCommentFirstLevelUseCase>(),
          gh<_i88.FavouriteCommentUseCase>(),
          gh<_i89.FavouritePostUseCase>(),
          gh<_i111.SendCommentUseCase>(),
          gh<_i116.SyncPostDataUseCase>(),
          gh<_i108.ReplyCommentUseCase>(),
          gh<_i98.GetReplyCommentUseCase>(),
          gh<_i83.DeleteCommentUseCase>(),
        ));
    gh.factory<_i122.AddAppreciationCubit>(() => _i122.AddAppreciationCubit(
          gh<_i73.AddAppreciationUseCase>(),
          gh<_i55.UpdateAppreciationUseCase>(),
          gh<_i19.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i123.AddEducationCubit>(() => _i123.AddEducationCubit(
          gh<_i74.AddEducationUseCase>(),
          gh<_i84.DeleteEducationUseCase>(),
          gh<_i56.UpdateEducationUseCase>(),
        ));
    gh.factory<_i124.AddLanguageCubit>(() => _i124.AddLanguageCubit(
          gh<_i77.AddLanguageUseCase>(),
          gh<_i59.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i125.AddResumeCubit>(
        () => _i125.AddResumeCubit(gh<_i79.AddResumeUseCase>()));
    gh.factory<_i126.AddSkillCubit>(() => _i126.AddSkillCubit(
          gh<_i97.GetListSkillUseCase>(),
          gh<_i63.UpdateSkillUseCase>(),
        ));
    gh.factory<_i127.AddWorkExperienceCubit>(() => _i127.AddWorkExperienceCubit(
          gh<_i75.AddExperienceUseCase>(),
          gh<_i57.UpdateExperienceUseCase>(),
          gh<_i85.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i128.ApplicantProfileCubit>(() => _i128.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i87.DeleteResumeUseCase>(),
          gh<_i50.StreamListPostUseCase>(),
          gh<_i53.StreamWorkExperienceUseCase>(),
          gh<_i49.StreamEducationUseCase>(),
          gh<_i48.StreamAppreciationUseCase>(),
          gh<_i51.StreamResumeUseCase>(),
          gh<_i26.GetSkillUseCase>(),
          gh<_i52.StreamUserInfoUseCase>(),
          gh<_i115.StreamLanguagesUseCase>(),
          gh<_i54.UpdateAboutMeUseCase>(),
          gh<_i89.FavouritePostUseCase>(),
        ));
    gh.factory<_i129.ConnectionCubit>(() => _i129.ConnectionCubit(
          gh<_i25.FetchPostUseCase>(),
          gh<_i89.FavouritePostUseCase>(),
        ));
    gh.factory<_i130.SignInCubit>(() => _i130.SignInCubit(
          gh<_i112.SignInEmailPasswordUseCase>(),
          gh<_i113.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i131.InjectionModule {}
