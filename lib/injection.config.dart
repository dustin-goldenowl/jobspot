// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i149;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i80;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i130;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i20;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i83;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i131;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i84;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i95;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i85;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i132;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i37;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i36;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i86;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i98;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i133;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i53;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i52;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i134;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i94;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i147;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i54;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i135;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i88;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i87;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i148;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i24;
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart'
    as _i99;
import 'package:jobspot/src/presentations/edit_applicant_profile/data/repositories/edit_applicant_profile_repository_impl.dart'
    as _i19;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart'
    as _i18;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i110;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i27;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i26;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i40;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i111;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i29;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i28;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i41;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i113;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i33;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i32;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart'
    as _i96;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i34;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i35;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i117;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i39;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i38;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i92;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i112;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i118;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i43;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i42;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i103;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i119;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i46;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i45;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i143;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i49;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i48;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i120;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i121;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i122;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i51;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i50;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i114;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i124;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i68;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i67;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i90;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i73;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i145;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i75;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i74;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i107;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i109;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i125;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i77;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i76;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i126;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i79;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i78;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i123;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i146;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i128;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i127;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i136;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i137;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i138;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i139;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i140;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i141;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i142;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i144;
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
    gh.lazySingleton<_i12.AppreciationRepository>(
        () => _i13.AppreciationRepositoryImpl());
    gh.lazySingleton<_i14.ConnectionRepository>(
        () => _i15.ConnectionRepositoryImpl());
    gh.lazySingleton<_i16.DeleteAppreciationUseCase>(() =>
        _i16.DeleteAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i17.DeletePostUseCase>(
        () => _i17.DeletePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i18.EditApplicantProfileRepository>(
        () => _i19.EditApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i20.EducationRepository>(
        () => _i21.EducationRepositoryImpl());
    gh.lazySingleton<_i22.ExperienceRepository>(
        () => _i23.ExperienceRepositoryImpl());
    gh.lazySingleton<_i24.FetchPostUseCase>(
        () => _i24.FetchPostUseCase(gh<_i14.ConnectionRepository>()));
    gh.factory<_i25.GetSkillUseCase>(
        () => _i25.GetSkillUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i26.HomeRepository>(() => _i27.HomeRepositoryImpl());
    gh.lazySingleton<_i28.JobPositionRepository>(
        () => _i29.JobPositionRepositoryImpl());
    gh.lazySingleton<_i30.LanguageRepository>(
        () => _i31.LanguageRepositoryImpl());
    gh.lazySingleton<_i32.NotificationRepository>(
        () => _i33.NotificationRepositoryImpl());
    gh.lazySingleton<_i34.ReadAllNotificationUseCase>(() =>
        _i34.ReadAllNotificationUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i35.ReadNotificationUseCase>(
        () => _i35.ReadNotificationUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i36.ResumeRepository>(() => _i37.ResumeRepositoryImpl());
    gh.lazySingleton<_i38.SaveJobRepository>(
        () => _i39.SaveJobRepositoryImpl());
    gh.lazySingleton<_i40.SaveJobUseCase>(
        () => _i40.SaveJobUseCase(gh<_i26.HomeRepository>()));
    gh.factory<_i41.SearchJobPositionUseCase>(
        () => _i41.SearchJobPositionUseCase(gh<_i28.JobPositionRepository>()));
    gh.lazySingleton<_i42.SearchLanguageRepository>(
        () => _i43.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i44.SendNotificationUseCase>(
        () => _i44.SendNotificationUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i45.SettingRepository>(
        () => _i46.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i47.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i48.SignInRepository>(() => _i49.LoginRepositoryImpl());
    gh.lazySingleton<_i50.SignUpRepository>(() => _i51.SignUpRepositoryImpl());
    gh.lazySingleton<_i52.SkillRepository>(() => _i53.SkillRepositoryImpl());
    gh.lazySingleton<_i54.StreamAppreciationUseCase>(() =>
        _i54.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i55.StreamEducationUseCase>(() =>
        _i55.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i56.StreamListPostUseCase>(() =>
        _i56.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i57.StreamNotificationUseCase>(() =>
        _i57.StreamNotificationUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i58.StreamResumeUseCase>(
        () => _i58.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i59.StreamUserInfoUseCase>(() =>
        _i59.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i60.StreamWorkExperienceUseCase>(() =>
        _i60.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i61.UpdateAboutMeUseCase>(
        () => _i61.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i62.UpdateAppreciationUseCase>(() =>
        _i62.UpdateAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i63.UpdateEducationUseCase>(
        () => _i63.UpdateEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i64.UpdateExperienceUseCase>(
        () => _i64.UpdateExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i65.UpdateJobUseCase>(
        () => _i65.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i66.UpdateLanguageUseCase>(
        () => _i66.UpdateLanguageUseCase(gh<_i30.LanguageRepository>()));
    gh.lazySingleton<_i67.UpdatePasswordRepository>(
        () => _i68.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i69.UpdatePostUseCase>(
        () => _i69.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i70.UpdateSkillUseCase>(
        () => _i70.UpdateSkillUseCase(gh<_i52.SkillRepository>()));
    gh.lazySingleton<_i71.UpdateTokenUseCase>(
        () => _i71.UpdateTokenUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i72.UpdateUserInfoUseCase>(() =>
        _i72.UpdateUserInfoUseCase(gh<_i18.EditApplicantProfileRepository>()));
    gh.lazySingleton<_i73.ValidatePassworkUseCase>(() =>
        _i73.ValidatePassworkUseCase(gh<_i67.UpdatePasswordRepository>()));
    gh.lazySingleton<_i74.ViewApplicantProfileRepository>(
        () => _i75.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i76.ViewJobRepository>(
        () => _i77.ViewJobRepositoryImpl());
    gh.lazySingleton<_i78.ViewLanguageRepository>(
        () => _i79.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i80.AddAppreciationUseCase>(
        () => _i80.AddAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i81.AddEducationUseCase>(
        () => _i81.AddEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i82.AddExperienceUseCase>(
        () => _i82.AddExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i83.AddJobCubit>(() => _i83.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i65.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i84.AddLanguageUseCase>(
        () => _i84.AddLanguageUseCase(gh<_i30.LanguageRepository>()));
    gh.factory<_i85.AddPostCubit>(() => _i85.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i69.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i86.AddResumeUseCase>(
        () => _i86.AddResumeUseCase(gh<_i36.ResumeRepository>()));
    gh.lazySingleton<_i87.ApplyJobRepository>(
        () => _i88.ApplyJobRepositoryImpl(gh<_i44.SendNotificationUseCase>()));
    gh.lazySingleton<_i89.ApplyJobUseCase>(
        () => _i89.ApplyJobUseCase(gh<_i87.ApplyJobRepository>()));
    gh.lazySingleton<_i90.ChangePasswordUseCase>(
        () => _i90.ChangePasswordUseCase(gh<_i67.UpdatePasswordRepository>()));
    gh.lazySingleton<_i91.DeleteAccountUseCase>(
        () => _i91.DeleteAccountUseCase(gh<_i45.SettingRepository>()));
    gh.lazySingleton<_i92.DeleteAllSaveJobUseCase>(
        () => _i92.DeleteAllSaveJobUseCase(gh<_i38.SaveJobRepository>()));
    gh.lazySingleton<_i93.DeleteEducationUseCase>(
        () => _i93.DeleteEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i94.DeleteExperienceUseCase>(
        () => _i94.DeleteExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.lazySingleton<_i95.DeleteLanguageUseCase>(
        () => _i95.DeleteLanguageUseCase(gh<_i30.LanguageRepository>()));
    gh.lazySingleton<_i96.DeleteNotificationFromIDUseCase>(() =>
        _i96.DeleteNotificationFromIDUseCase(
            gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i97.DeleteNotificationUseCase>(() =>
        _i97.DeleteNotificationUseCase(gh<_i32.NotificationRepository>()));
    gh.lazySingleton<_i98.DeleteResumeUseCase>(
        () => _i98.DeleteResumeUseCase(gh<_i36.ResumeRepository>()));
    gh.factory<_i99.EditApplicantProfileCubit>(
        () => _i99.EditApplicantProfileCubit(gh<_i72.UpdateUserInfoUseCase>()));
    gh.lazySingleton<_i100.FetchJobUseCase>(
        () => _i100.FetchJobUseCase(gh<_i76.ViewJobRepository>()));
    gh.lazySingleton<_i101.FetchJobUseCase>(
        () => _i101.FetchJobUseCase(gh<_i26.HomeRepository>()));
    gh.lazySingleton<_i102.GetAppreciationUseCase>(() =>
        _i102.GetAppreciationUseCase(
            gh<_i74.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i103.GetCountriesUseCase>(
        () => _i103.GetCountriesUseCase(gh<_i42.SearchLanguageRepository>()));
    gh.factory<_i104.GetEducationUseCase>(() =>
        _i104.GetEducationUseCase(gh<_i74.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i105.GetLanguageUseCase>(() =>
        _i105.GetLanguageUseCase(gh<_i74.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i106.GetListSkillUseCase>(
        () => _i106.GetListSkillUseCase(gh<_i52.SkillRepository>()));
    gh.lazySingleton<_i107.GetResumeUseCase>(() =>
        _i107.GetResumeUseCase(gh<_i74.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i108.GetUserInfoUseCase>(() =>
        _i108.GetUserInfoUseCase(gh<_i74.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i109.GetWorkExperienceUseCase>(() =>
        _i109.GetWorkExperienceUseCase(
            gh<_i74.ViewApplicantProfileRepository>()));
    gh.factory<_i110.HomeCubit>(() => _i110.HomeCubit(
          gh<_i101.FetchJobUseCase>(),
          gh<_i40.SaveJobUseCase>(),
        ));
    gh.factory<_i111.JobPositionCubit>(
        () => _i111.JobPositionCubit(gh<_i41.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i112.ListenSaveJobUseCase>(
        () => _i112.ListenSaveJobUseCase(gh<_i38.SaveJobRepository>()));
    gh.factory<_i113.NotificationCubit>(() => _i113.NotificationCubit(
          gh<_i57.StreamNotificationUseCase>(),
          gh<_i35.ReadNotificationUseCase>(),
          gh<_i34.ReadAllNotificationUseCase>(),
          gh<_i96.DeleteNotificationFromIDUseCase>(),
        ));
    gh.lazySingleton<_i114.RegisterApplicantUseCase>(
        () => _i114.RegisterApplicantUseCase(gh<_i50.SignUpRepository>()));
    gh.lazySingleton<_i115.RegisterBusinessUseCase>(
        () => _i115.RegisterBusinessUseCase(gh<_i50.SignUpRepository>()));
    gh.lazySingleton<_i116.RegisterGoogleUseCase>(
        () => _i116.RegisterGoogleUseCase(gh<_i50.SignUpRepository>()));
    gh.factory<_i117.SaveJobCubit>(() => _i117.SaveJobCubit(
          gh<_i112.ListenSaveJobUseCase>(),
          gh<_i92.DeleteAllSaveJobUseCase>(),
          gh<_i40.SaveJobUseCase>(),
        ));
    gh.factory<_i118.SearchLanguageCubit>(
        () => _i118.SearchLanguageCubit(gh<_i103.GetCountriesUseCase>()));
    gh.factory<_i119.SettingCubit>(() => _i119.SettingCubit(
          gh<_i91.DeleteAccountUseCase>(),
          gh<_i71.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i120.SignInEmailPasswordUseCase>(
        () => _i120.SignInEmailPasswordUseCase(gh<_i48.SignInRepository>()));
    gh.lazySingleton<_i121.SignInGoogleUseCase>(
        () => _i121.SignInGoogleUseCase(gh<_i48.SignInRepository>()));
    gh.factory<_i122.SignUpCubit>(() => _i122.SignUpCubit(
          gh<_i114.RegisterApplicantUseCase>(),
          gh<_i115.RegisterBusinessUseCase>(),
          gh<_i116.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i123.StreamLanguagesUseCase>(
        () => _i123.StreamLanguagesUseCase(gh<_i78.ViewLanguageRepository>()));
    gh.factory<_i124.UpdatePasswordCubit>(() => _i124.UpdatePasswordCubit(
          gh<_i90.ChangePasswordUseCase>(),
          gh<_i73.ValidatePassworkUseCase>(),
        ));
    gh.factory<_i125.ViewJobCubit>(
        () => _i125.ViewJobCubit(gh<_i100.FetchJobUseCase>()));
    gh.factory<_i126.ViewLanguageCubit>(() => _i126.ViewLanguageCubit(
          gh<_i123.StreamLanguagesUseCase>(),
          gh<_i95.DeleteLanguageUseCase>(),
        ));
    gh.lazySingleton<_i127.ViewPostRepository>(
        () => _i128.ViewPostRepositoryImpl(
              gh<_i44.SendNotificationUseCase>(),
              gh<_i97.DeleteNotificationUseCase>(),
            ));
    gh.factory<_i129.AddAppreciationCubit>(() => _i129.AddAppreciationCubit(
          gh<_i80.AddAppreciationUseCase>(),
          gh<_i62.UpdateAppreciationUseCase>(),
          gh<_i16.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i130.AddEducationCubit>(() => _i130.AddEducationCubit(
          gh<_i81.AddEducationUseCase>(),
          gh<_i93.DeleteEducationUseCase>(),
          gh<_i63.UpdateEducationUseCase>(),
        ));
    gh.factory<_i131.AddLanguageCubit>(() => _i131.AddLanguageCubit(
          gh<_i84.AddLanguageUseCase>(),
          gh<_i66.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i132.AddResumeCubit>(
        () => _i132.AddResumeCubit(gh<_i86.AddResumeUseCase>()));
    gh.factory<_i133.AddSkillCubit>(() => _i133.AddSkillCubit(
          gh<_i106.GetListSkillUseCase>(),
          gh<_i70.UpdateSkillUseCase>(),
        ));
    gh.factory<_i134.AddWorkExperienceCubit>(() => _i134.AddWorkExperienceCubit(
          gh<_i82.AddExperienceUseCase>(),
          gh<_i64.UpdateExperienceUseCase>(),
          gh<_i94.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i135.ApplyJobCubit>(
        () => _i135.ApplyJobCubit(gh<_i89.ApplyJobUseCase>()));
    gh.lazySingleton<_i136.DeleteCommentUseCase>(
        () => _i136.DeleteCommentUseCase(gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i137.FavouriteCommentUseCase>(
        () => _i137.FavouriteCommentUseCase(gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i138.FavouritePostUseCase>(
        () => _i138.FavouritePostUseCase(gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i139.FetchDataCommentFirstLevelUseCase>(() =>
        _i139.FetchDataCommentFirstLevelUseCase(
            gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i140.GetReplyCommentUseCase>(
        () => _i140.GetReplyCommentUseCase(gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i141.ReplyCommentUseCase>(
        () => _i141.ReplyCommentUseCase(gh<_i127.ViewPostRepository>()));
    gh.lazySingleton<_i142.SendCommentUseCase>(
        () => _i142.SendCommentUseCase(gh<_i127.ViewPostRepository>()));
    gh.factory<_i143.SignInCubit>(() => _i143.SignInCubit(
          gh<_i120.SignInEmailPasswordUseCase>(),
          gh<_i121.SignInGoogleUseCase>(),
          gh<_i71.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i144.SyncPostDataUseCase>(
        () => _i144.SyncPostDataUseCase(gh<_i127.ViewPostRepository>()));
    gh.factory<_i145.ViewApplicantProfileCubit>(
        () => _i145.ViewApplicantProfileCubit(
              gh<_i102.GetAppreciationUseCase>(),
              gh<_i104.GetEducationUseCase>(),
              gh<_i105.GetLanguageUseCase>(),
              gh<_i107.GetResumeUseCase>(),
              gh<_i25.GetSkillUseCase>(),
              gh<_i108.GetUserInfoUseCase>(),
              gh<_i109.GetWorkExperienceUseCase>(),
              gh<_i56.StreamListPostUseCase>(),
              gh<_i138.FavouritePostUseCase>(),
            ));
    gh.factory<_i146.ViewPostBloc>(() => _i146.ViewPostBloc(
          gh<_i139.FetchDataCommentFirstLevelUseCase>(),
          gh<_i137.FavouriteCommentUseCase>(),
          gh<_i138.FavouritePostUseCase>(),
          gh<_i142.SendCommentUseCase>(),
          gh<_i144.SyncPostDataUseCase>(),
          gh<_i141.ReplyCommentUseCase>(),
          gh<_i140.GetReplyCommentUseCase>(),
          gh<_i136.DeleteCommentUseCase>(),
        ));
    gh.factory<_i147.ApplicantProfileCubit>(() => _i147.ApplicantProfileCubit(
          gh<_i17.DeletePostUseCase>(),
          gh<_i98.DeleteResumeUseCase>(),
          gh<_i56.StreamListPostUseCase>(),
          gh<_i60.StreamWorkExperienceUseCase>(),
          gh<_i55.StreamEducationUseCase>(),
          gh<_i54.StreamAppreciationUseCase>(),
          gh<_i58.StreamResumeUseCase>(),
          gh<_i25.GetSkillUseCase>(),
          gh<_i59.StreamUserInfoUseCase>(),
          gh<_i123.StreamLanguagesUseCase>(),
          gh<_i61.UpdateAboutMeUseCase>(),
          gh<_i138.FavouritePostUseCase>(),
        ));
    gh.factory<_i148.ConnectionCubit>(() => _i148.ConnectionCubit(
          gh<_i24.FetchPostUseCase>(),
          gh<_i138.FavouritePostUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i149.InjectionModule {}
