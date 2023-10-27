// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i167;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i144;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i145;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i20;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i88;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i90;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i146;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i33;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i32;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i103;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i92;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i74;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i147;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i39;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i38;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i148;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i58;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i57;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i149;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i165;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i150;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i95;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i94;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i96;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i166;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i24;
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart'
    as _i107;
import 'package:jobspot/src/presentations/edit_applicant_profile/data/repositories/edit_applicant_profile_repository_impl.dart'
    as _i19;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart'
    as _i18;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart'
    as _i120;
import 'package:jobspot/src/presentations/home_applicant/data/repositories/home_applicant_repository_impl.dart'
    as _i27;
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart'
    as _i26;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/fetch_job_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart'
    as _i42;
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart'
    as _i121;
import 'package:jobspot/src/presentations/home_company/data/repositories/home_company_repository_impl.dart'
    as _i29;
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart'
    as _i28;
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i122;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i43;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i124;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i35;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i34;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i36;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i37;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i49;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i128;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i41;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i40;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i123;
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/search_job/data/repositories/search_job_repository_impl.dart'
    as _i45;
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart'
    as _i44;
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart'
    as _i46;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i130;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i48;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i47;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i111;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i131;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i51;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i50;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i99;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i160;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i54;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i53;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i132;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i133;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i134;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i56;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i55;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i125;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i126;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i127;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i136;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i73;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i72;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i162;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i80;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i79;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i110;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i112;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i113;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i117;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i118;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i119;
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart'
    as _i163;
import 'package:jobspot/src/presentations/view_company_profile/data/repositories/view_company_profile_repository_impl.dart'
    as _i138;
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart'
    as _i137;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/follow_user_use_case.dart'
    as _i155;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart'
    as _i156;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i140;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i84;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i83;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i109;
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart'
    as _i139;
import 'package:jobspot/src/presentations/view_job_applicant/data/repositories/view_job_applicant_repository_impl.dart'
    as _i82;
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart'
    as _i81;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart'
    as _i98;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart'
    as _i114;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i141;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i86;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i85;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i135;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i164;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i143;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i142;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i151;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i152;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i153;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i154;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i157;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i158;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i159;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i52;

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
    gh.lazySingleton<_i26.HomeApplicantRepository>(
        () => _i27.HomeApplicantRepositoryImpl());
    gh.lazySingleton<_i28.HomeCompanyRepository>(
        () => _i29.HomeCompanyRepositoryImpl());
    gh.lazySingleton<_i30.JobPositionRepository>(
        () => _i31.JobPositionRepositoryImpl());
    gh.lazySingleton<_i32.LanguageRepository>(
        () => _i33.LanguageRepositoryImpl());
    gh.lazySingleton<_i34.NotificationRepository>(
        () => _i35.NotificationRepositoryImpl());
    gh.lazySingleton<_i36.ReadAllNotificationUseCase>(() =>
        _i36.ReadAllNotificationUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i37.ReadNotificationUseCase>(
        () => _i37.ReadNotificationUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i38.ResumeRepository>(() => _i39.ResumeRepositoryImpl());
    gh.lazySingleton<_i40.SaveJobRepository>(
        () => _i41.SaveJobRepositoryImpl());
    gh.lazySingleton<_i42.SaveJobUseCase>(
        () => _i42.SaveJobUseCase(gh<_i26.HomeApplicantRepository>()));
    gh.factory<_i43.SearchJobPositionUseCase>(
        () => _i43.SearchJobPositionUseCase(gh<_i30.JobPositionRepository>()));
    gh.lazySingleton<_i44.SearchJobRepository>(
        () => _i45.SearchJobRepositoryImpl());
    gh.lazySingleton<_i46.SearchJobUseCase>(
        () => _i46.SearchJobUseCase(gh<_i44.SearchJobRepository>()));
    gh.lazySingleton<_i47.SearchLanguageRepository>(
        () => _i48.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i49.SendNotificationUseCase>(
        () => _i49.SendNotificationUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i50.SettingRepository>(
        () => _i51.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i52.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i53.SignInRepository>(() => _i54.LoginRepositoryImpl());
    gh.lazySingleton<_i55.SignUpRepository>(() => _i56.SignUpRepositoryImpl());
    gh.lazySingleton<_i57.SkillRepository>(() => _i58.SkillRepositoryImpl());
    gh.lazySingleton<_i59.StreamAppreciationUseCase>(() =>
        _i59.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i60.StreamEducationUseCase>(() =>
        _i60.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i61.StreamListPostUseCase>(() =>
        _i61.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i62.StreamNotificationUseCase>(() =>
        _i62.StreamNotificationUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i63.StreamResumeUseCase>(
        () => _i63.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i64.StreamUserInfoUseCase>(() =>
        _i64.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i65.StreamWorkExperienceUseCase>(() =>
        _i65.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i66.UpdateAboutMeUseCase>(
        () => _i66.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i67.UpdateAppreciationUseCase>(() =>
        _i67.UpdateAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i68.UpdateEducationUseCase>(
        () => _i68.UpdateEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i69.UpdateExperienceUseCase>(
        () => _i69.UpdateExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i70.UpdateJobUseCase>(
        () => _i70.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i71.UpdateLanguageUseCase>(
        () => _i71.UpdateLanguageUseCase(gh<_i32.LanguageRepository>()));
    gh.lazySingleton<_i72.UpdatePasswordRepository>(
        () => _i73.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i74.UpdatePostUseCase>(
        () => _i74.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i75.UpdateSkillUseCase>(
        () => _i75.UpdateSkillUseCase(gh<_i57.SkillRepository>()));
    gh.lazySingleton<_i76.UpdateTokenUseCase>(
        () => _i76.UpdateTokenUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i77.UpdateUserInfoUseCase>(() =>
        _i77.UpdateUserInfoUseCase(gh<_i18.EditApplicantProfileRepository>()));
    gh.lazySingleton<_i78.ValidatePassworkUseCase>(() =>
        _i78.ValidatePassworkUseCase(gh<_i72.UpdatePasswordRepository>()));
    gh.lazySingleton<_i79.ViewApplicantProfileRepository>(
        () => _i80.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i81.ViewJobApplicantRepository>(() =>
        _i82.ViewJobApplicantRepositoryImpl(
            gh<_i49.SendNotificationUseCase>()));
    gh.lazySingleton<_i83.ViewJobRepository>(
        () => _i84.ViewJobRepositoryImpl());
    gh.lazySingleton<_i85.ViewLanguageRepository>(
        () => _i86.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i87.AddAppreciationUseCase>(
        () => _i87.AddAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i88.AddEducationUseCase>(
        () => _i88.AddEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i89.AddExperienceUseCase>(
        () => _i89.AddExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i90.AddJobCubit>(() => _i90.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i70.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i91.AddLanguageUseCase>(
        () => _i91.AddLanguageUseCase(gh<_i32.LanguageRepository>()));
    gh.factory<_i92.AddPostCubit>(() => _i92.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i74.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i93.AddResumeUseCase>(
        () => _i93.AddResumeUseCase(gh<_i38.ResumeRepository>()));
    gh.lazySingleton<_i94.ApplyJobRepository>(() => _i95.ApplyJobRepositoryImpl(
          gh<_i49.SendNotificationUseCase>(),
          gh<_i93.AddResumeUseCase>(),
        ));
    gh.lazySingleton<_i96.ApplyJobUseCase>(
        () => _i96.ApplyJobUseCase(gh<_i94.ApplyJobRepository>()));
    gh.lazySingleton<_i97.ChangePasswordUseCase>(
        () => _i97.ChangePasswordUseCase(gh<_i72.UpdatePasswordRepository>()));
    gh.lazySingleton<_i98.ConsiderResumeUseCase>(() =>
        _i98.ConsiderResumeUseCase(gh<_i81.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i99.DeleteAccountUseCase>(
        () => _i99.DeleteAccountUseCase(gh<_i50.SettingRepository>()));
    gh.lazySingleton<_i100.DeleteAllSaveJobUseCase>(
        () => _i100.DeleteAllSaveJobUseCase(gh<_i40.SaveJobRepository>()));
    gh.lazySingleton<_i101.DeleteEducationUseCase>(
        () => _i101.DeleteEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i102.DeleteExperienceUseCase>(
        () => _i102.DeleteExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.lazySingleton<_i103.DeleteLanguageUseCase>(
        () => _i103.DeleteLanguageUseCase(gh<_i32.LanguageRepository>()));
    gh.lazySingleton<_i104.DeleteNotificationFromIDUseCase>(() =>
        _i104.DeleteNotificationFromIDUseCase(
            gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i105.DeleteNotificationUseCase>(() =>
        _i105.DeleteNotificationUseCase(gh<_i34.NotificationRepository>()));
    gh.lazySingleton<_i106.DeleteResumeUseCase>(
        () => _i106.DeleteResumeUseCase(gh<_i38.ResumeRepository>()));
    gh.factory<_i107.EditApplicantProfileCubit>(() =>
        _i107.EditApplicantProfileCubit(gh<_i77.UpdateUserInfoUseCase>()));
    gh.lazySingleton<_i108.FetchJobUseCase>(
        () => _i108.FetchJobUseCase(gh<_i26.HomeApplicantRepository>()));
    gh.lazySingleton<_i109.FetchJobUseCase>(
        () => _i109.FetchJobUseCase(gh<_i83.ViewJobRepository>()));
    gh.lazySingleton<_i110.GetAppreciationUseCase>(() =>
        _i110.GetAppreciationUseCase(
            gh<_i79.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i111.GetCountriesUseCase>(
        () => _i111.GetCountriesUseCase(gh<_i47.SearchLanguageRepository>()));
    gh.factory<_i112.GetEducationUseCase>(() =>
        _i112.GetEducationUseCase(gh<_i79.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i113.GetLanguageUseCase>(() =>
        _i113.GetLanguageUseCase(gh<_i79.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i114.GetListApplicantUseCase>(() =>
        _i114.GetListApplicantUseCase(gh<_i81.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i115.GetListMyJobUseCase>(
        () => _i115.GetListMyJobUseCase(gh<_i28.HomeCompanyRepository>()));
    gh.lazySingleton<_i116.GetListSkillUseCase>(
        () => _i116.GetListSkillUseCase(gh<_i57.SkillRepository>()));
    gh.lazySingleton<_i117.GetResumeUseCase>(() =>
        _i117.GetResumeUseCase(gh<_i79.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i118.GetUserInfoUseCase>(() =>
        _i118.GetUserInfoUseCase(gh<_i79.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i119.GetWorkExperienceUseCase>(() =>
        _i119.GetWorkExperienceUseCase(
            gh<_i79.ViewApplicantProfileRepository>()));
    gh.factory<_i120.HomeApplicantCubit>(() => _i120.HomeApplicantCubit(
          gh<_i108.FetchJobUseCase>(),
          gh<_i42.SaveJobUseCase>(),
        ));
    gh.factory<_i121.HomeCompanyCubit>(
        () => _i121.HomeCompanyCubit(gh<_i115.GetListMyJobUseCase>()));
    gh.factory<_i122.JobPositionCubit>(
        () => _i122.JobPositionCubit(gh<_i43.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i123.ListenSaveJobUseCase>(
        () => _i123.ListenSaveJobUseCase(gh<_i40.SaveJobRepository>()));
    gh.factory<_i124.NotificationCubit>(() => _i124.NotificationCubit(
          gh<_i62.StreamNotificationUseCase>(),
          gh<_i37.ReadNotificationUseCase>(),
          gh<_i36.ReadAllNotificationUseCase>(),
          gh<_i104.DeleteNotificationFromIDUseCase>(),
        ));
    gh.lazySingleton<_i125.RegisterApplicantUseCase>(
        () => _i125.RegisterApplicantUseCase(gh<_i55.SignUpRepository>()));
    gh.lazySingleton<_i126.RegisterBusinessUseCase>(
        () => _i126.RegisterBusinessUseCase(gh<_i55.SignUpRepository>()));
    gh.lazySingleton<_i127.RegisterGoogleUseCase>(
        () => _i127.RegisterGoogleUseCase(gh<_i55.SignUpRepository>()));
    gh.factory<_i128.SaveJobCubit>(() => _i128.SaveJobCubit(
          gh<_i123.ListenSaveJobUseCase>(),
          gh<_i100.DeleteAllSaveJobUseCase>(),
          gh<_i42.SaveJobUseCase>(),
        ));
    gh.factory<_i129.SearchJobCubit>(
        () => _i129.SearchJobCubit(gh<_i46.SearchJobUseCase>()));
    gh.factory<_i130.SearchLanguageCubit>(
        () => _i130.SearchLanguageCubit(gh<_i111.GetCountriesUseCase>()));
    gh.factory<_i131.SettingCubit>(() => _i131.SettingCubit(
          gh<_i99.DeleteAccountUseCase>(),
          gh<_i76.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i132.SignInEmailPasswordUseCase>(
        () => _i132.SignInEmailPasswordUseCase(gh<_i53.SignInRepository>()));
    gh.lazySingleton<_i133.SignInGoogleUseCase>(
        () => _i133.SignInGoogleUseCase(gh<_i53.SignInRepository>()));
    gh.factory<_i134.SignUpCubit>(() => _i134.SignUpCubit(
          gh<_i125.RegisterApplicantUseCase>(),
          gh<_i126.RegisterBusinessUseCase>(),
          gh<_i127.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i135.StreamLanguagesUseCase>(
        () => _i135.StreamLanguagesUseCase(gh<_i85.ViewLanguageRepository>()));
    gh.factory<_i136.UpdatePasswordCubit>(() => _i136.UpdatePasswordCubit(
          gh<_i97.ChangePasswordUseCase>(),
          gh<_i78.ValidatePassworkUseCase>(),
        ));
    gh.lazySingleton<_i137.ViewCompanyProfileRepository>(
        () => _i138.ViewCompanyProfileRepositoryImpl(
              gh<_i105.DeleteNotificationUseCase>(),
              gh<_i49.SendNotificationUseCase>(),
            ));
    gh.factory<_i139.ViewJobApplicantCubit>(() => _i139.ViewJobApplicantCubit(
          gh<_i114.GetListApplicantUseCase>(),
          gh<_i98.ConsiderResumeUseCase>(),
        ));
    gh.factory<_i140.ViewJobCubit>(
        () => _i140.ViewJobCubit(gh<_i109.FetchJobUseCase>()));
    gh.factory<_i141.ViewLanguageCubit>(() => _i141.ViewLanguageCubit(
          gh<_i135.StreamLanguagesUseCase>(),
          gh<_i103.DeleteLanguageUseCase>(),
        ));
    gh.lazySingleton<_i142.ViewPostRepository>(
        () => _i143.ViewPostRepositoryImpl(
              gh<_i49.SendNotificationUseCase>(),
              gh<_i105.DeleteNotificationUseCase>(),
            ));
    gh.factory<_i144.AddAppreciationCubit>(() => _i144.AddAppreciationCubit(
          gh<_i87.AddAppreciationUseCase>(),
          gh<_i67.UpdateAppreciationUseCase>(),
          gh<_i16.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i145.AddEducationCubit>(() => _i145.AddEducationCubit(
          gh<_i88.AddEducationUseCase>(),
          gh<_i101.DeleteEducationUseCase>(),
          gh<_i68.UpdateEducationUseCase>(),
        ));
    gh.factory<_i146.AddLanguageCubit>(() => _i146.AddLanguageCubit(
          gh<_i91.AddLanguageUseCase>(),
          gh<_i71.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i147.AddResumeCubit>(
        () => _i147.AddResumeCubit(gh<_i93.AddResumeUseCase>()));
    gh.factory<_i148.AddSkillCubit>(() => _i148.AddSkillCubit(
          gh<_i116.GetListSkillUseCase>(),
          gh<_i75.UpdateSkillUseCase>(),
        ));
    gh.factory<_i149.AddWorkExperienceCubit>(() => _i149.AddWorkExperienceCubit(
          gh<_i89.AddExperienceUseCase>(),
          gh<_i69.UpdateExperienceUseCase>(),
          gh<_i102.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i150.ApplyJobCubit>(
        () => _i150.ApplyJobCubit(gh<_i96.ApplyJobUseCase>()));
    gh.lazySingleton<_i151.DeleteCommentUseCase>(
        () => _i151.DeleteCommentUseCase(gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i152.FavouriteCommentUseCase>(
        () => _i152.FavouriteCommentUseCase(gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i153.FavouritePostUseCase>(
        () => _i153.FavouritePostUseCase(gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i154.FetchDataCommentFirstLevelUseCase>(() =>
        _i154.FetchDataCommentFirstLevelUseCase(
            gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i155.FollowUserUseCase>(() =>
        _i155.FollowUserUseCase(gh<_i137.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i156.GetListJobUseCase>(() =>
        _i156.GetListJobUseCase(gh<_i137.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i157.GetReplyCommentUseCase>(
        () => _i157.GetReplyCommentUseCase(gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i158.ReplyCommentUseCase>(
        () => _i158.ReplyCommentUseCase(gh<_i142.ViewPostRepository>()));
    gh.lazySingleton<_i159.SendCommentUseCase>(
        () => _i159.SendCommentUseCase(gh<_i142.ViewPostRepository>()));
    gh.factory<_i160.SignInCubit>(() => _i160.SignInCubit(
          gh<_i132.SignInEmailPasswordUseCase>(),
          gh<_i133.SignInGoogleUseCase>(),
          gh<_i76.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i161.SyncPostDataUseCase>(
        () => _i161.SyncPostDataUseCase(gh<_i142.ViewPostRepository>()));
    gh.factory<_i162.ViewApplicantProfileCubit>(
        () => _i162.ViewApplicantProfileCubit(
              gh<_i110.GetAppreciationUseCase>(),
              gh<_i112.GetEducationUseCase>(),
              gh<_i113.GetLanguageUseCase>(),
              gh<_i117.GetResumeUseCase>(),
              gh<_i25.GetSkillUseCase>(),
              gh<_i118.GetUserInfoUseCase>(),
              gh<_i119.GetWorkExperienceUseCase>(),
              gh<_i61.StreamListPostUseCase>(),
              gh<_i153.FavouritePostUseCase>(),
            ));
    gh.factory<_i163.ViewCompanyProfileCubit>(
        () => _i163.ViewCompanyProfileCubit(
              gh<_i156.GetListJobUseCase>(),
              gh<_i61.StreamListPostUseCase>(),
              gh<_i118.GetUserInfoUseCase>(),
              gh<_i153.FavouritePostUseCase>(),
              gh<_i155.FollowUserUseCase>(),
            ));
    gh.factory<_i164.ViewPostBloc>(() => _i164.ViewPostBloc(
          gh<_i154.FetchDataCommentFirstLevelUseCase>(),
          gh<_i152.FavouriteCommentUseCase>(),
          gh<_i153.FavouritePostUseCase>(),
          gh<_i159.SendCommentUseCase>(),
          gh<_i161.SyncPostDataUseCase>(),
          gh<_i158.ReplyCommentUseCase>(),
          gh<_i157.GetReplyCommentUseCase>(),
          gh<_i151.DeleteCommentUseCase>(),
        ));
    gh.factory<_i165.ApplicantProfileCubit>(() => _i165.ApplicantProfileCubit(
          gh<_i17.DeletePostUseCase>(),
          gh<_i106.DeleteResumeUseCase>(),
          gh<_i61.StreamListPostUseCase>(),
          gh<_i65.StreamWorkExperienceUseCase>(),
          gh<_i60.StreamEducationUseCase>(),
          gh<_i59.StreamAppreciationUseCase>(),
          gh<_i63.StreamResumeUseCase>(),
          gh<_i25.GetSkillUseCase>(),
          gh<_i64.StreamUserInfoUseCase>(),
          gh<_i135.StreamLanguagesUseCase>(),
          gh<_i66.UpdateAboutMeUseCase>(),
          gh<_i153.FavouritePostUseCase>(),
        ));
    gh.factory<_i166.ConnectionCubit>(() => _i166.ConnectionCubit(
          gh<_i24.FetchPostUseCase>(),
          gh<_i153.FavouritePostUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i167.InjectionModule {}
