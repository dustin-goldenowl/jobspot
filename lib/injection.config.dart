// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i176;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i153;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i154;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i20;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i92;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i94;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i155;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i35;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i34;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i95;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i73;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i96;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i156;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i41;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i40;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i111;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i157;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i60;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i59;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i122;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i158;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i107;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i174;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i159;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i99;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i98;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i175;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i24;
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart'
    as _i112;
import 'package:jobspot/src/presentations/edit_applicant_profile/data/repositories/edit_applicant_profile_repository_impl.dart'
    as _i19;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart'
    as _i18;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart'
    as _i126;
import 'package:jobspot/src/presentations/home_admin/data/repositories/home_admin_repository_impl.dart'
    as _i27;
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart'
    as _i26;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/consider_company_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/get_list_company_pending_use_case.dart'
    as _i120;
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart'
    as _i127;
import 'package:jobspot/src/presentations/home_applicant/data/repositories/home_applicant_repository_impl.dart'
    as _i29;
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart'
    as _i28;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/fetch_job_use_case.dart'
    as _i113;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart'
    as _i44;
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart'
    as _i128;
import 'package:jobspot/src/presentations/home_company/data/repositories/home_company_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart'
    as _i121;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i33;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i32;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i45;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i131;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i37;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i36;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart'
    as _i109;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart'
    as _i110;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i38;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i39;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i51;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i135;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i43;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i42;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i130;
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart'
    as _i136;
import 'package:jobspot/src/presentations/search_job/data/repositories/search_job_repository_impl.dart'
    as _i47;
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart'
    as _i46;
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i137;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i50;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i49;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i138;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i53;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i52;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i169;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i56;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i55;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i139;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i140;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i141;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i58;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i57;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i132;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i133;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i134;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i143;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i75;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i74;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i80;
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart'
    as _i145;
import 'package:jobspot/src/presentations/verify_business/data/repositories/verify_business_repository_impl.dart'
    as _i82;
import 'package:jobspot/src/presentations/verify_business/domain/repositories/verify_business_repository.dart'
    as _i81;
import 'package:jobspot/src/presentations/verify_business/domain/use_cases/upload_file_verify_business_use_case.dart'
    as _i144;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i171;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i84;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i83;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i117;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i118;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i123;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i124;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i125;
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart'
    as _i172;
import 'package:jobspot/src/presentations/view_company_profile/data/repositories/view_company_profile_repository_impl.dart'
    as _i147;
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart'
    as _i146;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/follow_user_use_case.dart'
    as _i164;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart'
    as _i165;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i149;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i88;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i87;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i114;
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart'
    as _i148;
import 'package:jobspot/src/presentations/view_job_applicant/data/repositories/view_job_applicant_repository_impl.dart'
    as _i86;
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart'
    as _i85;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart'
    as _i103;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart'
    as _i119;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i150;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i90;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i89;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i142;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i173;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i152;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i151;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i160;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i161;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i162;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i163;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i166;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i167;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i168;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i170;
import 'package:shared_preferences/shared_preferences.dart' as _i54;

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
    gh.lazySingleton<_i26.HomeAdminRepository>(
        () => _i27.HomeAdminRepositoryImpl());
    gh.lazySingleton<_i28.HomeApplicantRepository>(
        () => _i29.HomeApplicantRepositoryImpl());
    gh.lazySingleton<_i30.HomeCompanyRepository>(
        () => _i31.HomeCompanyRepositoryImpl());
    gh.lazySingleton<_i32.JobPositionRepository>(
        () => _i33.JobPositionRepositoryImpl());
    gh.lazySingleton<_i34.LanguageRepository>(
        () => _i35.LanguageRepositoryImpl());
    gh.lazySingleton<_i36.NotificationRepository>(
        () => _i37.NotificationRepositoryImpl());
    gh.lazySingleton<_i38.ReadAllNotificationUseCase>(() =>
        _i38.ReadAllNotificationUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i39.ReadNotificationUseCase>(
        () => _i39.ReadNotificationUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i40.ResumeRepository>(() => _i41.ResumeRepositoryImpl());
    gh.lazySingleton<_i42.SaveJobRepository>(
        () => _i43.SaveJobRepositoryImpl());
    gh.lazySingleton<_i44.SaveJobUseCase>(
        () => _i44.SaveJobUseCase(gh<_i28.HomeApplicantRepository>()));
    gh.factory<_i45.SearchJobPositionUseCase>(
        () => _i45.SearchJobPositionUseCase(gh<_i32.JobPositionRepository>()));
    gh.lazySingleton<_i46.SearchJobRepository>(
        () => _i47.SearchJobRepositoryImpl());
    gh.lazySingleton<_i48.SearchJobUseCase>(
        () => _i48.SearchJobUseCase(gh<_i46.SearchJobRepository>()));
    gh.lazySingleton<_i49.SearchLanguageRepository>(
        () => _i50.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i51.SendNotificationUseCase>(
        () => _i51.SendNotificationUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i52.SettingRepository>(
        () => _i53.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i54.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i55.SignInRepository>(() => _i56.LoginRepositoryImpl());
    gh.lazySingleton<_i57.SignUpRepository>(() => _i58.SignUpRepositoryImpl());
    gh.lazySingleton<_i59.SkillRepository>(() => _i60.SkillRepositoryImpl());
    gh.lazySingleton<_i61.StreamAppreciationUseCase>(() =>
        _i61.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i62.StreamEducationUseCase>(() =>
        _i62.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i63.StreamListPostUseCase>(() =>
        _i63.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i64.StreamNotificationUseCase>(() =>
        _i64.StreamNotificationUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i65.StreamResumeUseCase>(
        () => _i65.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i66.StreamUserInfoUseCase>(() =>
        _i66.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i67.StreamWorkExperienceUseCase>(() =>
        _i67.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i68.UpdateAboutMeUseCase>(
        () => _i68.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i69.UpdateAppreciationUseCase>(() =>
        _i69.UpdateAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i70.UpdateEducationUseCase>(
        () => _i70.UpdateEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i71.UpdateExperienceUseCase>(
        () => _i71.UpdateExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i72.UpdateJobUseCase>(
        () => _i72.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i73.UpdateLanguageUseCase>(
        () => _i73.UpdateLanguageUseCase(gh<_i34.LanguageRepository>()));
    gh.lazySingleton<_i74.UpdatePasswordRepository>(
        () => _i75.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i76.UpdatePostUseCase>(
        () => _i76.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i77.UpdateSkillUseCase>(
        () => _i77.UpdateSkillUseCase(gh<_i59.SkillRepository>()));
    gh.lazySingleton<_i78.UpdateTokenUseCase>(
        () => _i78.UpdateTokenUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i79.UpdateUserInfoUseCase>(() =>
        _i79.UpdateUserInfoUseCase(gh<_i18.EditApplicantProfileRepository>()));
    gh.lazySingleton<_i80.ValidatePassworkUseCase>(() =>
        _i80.ValidatePassworkUseCase(gh<_i74.UpdatePasswordRepository>()));
    gh.lazySingleton<_i81.VerifyBusinessRepository>(
        () => _i82.VerifyBusinessRepositoryImpl());
    gh.lazySingleton<_i83.ViewApplicantProfileRepository>(
        () => _i84.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i85.ViewJobApplicantRepository>(() =>
        _i86.ViewJobApplicantRepositoryImpl(
            gh<_i51.SendNotificationUseCase>()));
    gh.lazySingleton<_i87.ViewJobRepository>(
        () => _i88.ViewJobRepositoryImpl());
    gh.lazySingleton<_i89.ViewLanguageRepository>(
        () => _i90.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i91.AddAppreciationUseCase>(
        () => _i91.AddAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i92.AddEducationUseCase>(
        () => _i92.AddEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i93.AddExperienceUseCase>(
        () => _i93.AddExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.factory<_i94.AddJobCubit>(() => _i94.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i72.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i95.AddLanguageUseCase>(
        () => _i95.AddLanguageUseCase(gh<_i34.LanguageRepository>()));
    gh.factory<_i96.AddPostCubit>(() => _i96.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i76.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i97.AddResumeUseCase>(
        () => _i97.AddResumeUseCase(gh<_i40.ResumeRepository>()));
    gh.lazySingleton<_i98.ApplyJobRepository>(() => _i99.ApplyJobRepositoryImpl(
          gh<_i51.SendNotificationUseCase>(),
          gh<_i97.AddResumeUseCase>(),
        ));
    gh.lazySingleton<_i100.ApplyJobUseCase>(
        () => _i100.ApplyJobUseCase(gh<_i98.ApplyJobRepository>()));
    gh.lazySingleton<_i101.ChangePasswordUseCase>(
        () => _i101.ChangePasswordUseCase(gh<_i74.UpdatePasswordRepository>()));
    gh.lazySingleton<_i102.ConsiderCompanyUseCase>(
        () => _i102.ConsiderCompanyUseCase(gh<_i26.HomeAdminRepository>()));
    gh.lazySingleton<_i103.ConsiderResumeUseCase>(() =>
        _i103.ConsiderResumeUseCase(gh<_i85.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i104.DeleteAccountUseCase>(
        () => _i104.DeleteAccountUseCase(gh<_i52.SettingRepository>()));
    gh.lazySingleton<_i105.DeleteAllSaveJobUseCase>(
        () => _i105.DeleteAllSaveJobUseCase(gh<_i42.SaveJobRepository>()));
    gh.lazySingleton<_i106.DeleteEducationUseCase>(
        () => _i106.DeleteEducationUseCase(gh<_i20.EducationRepository>()));
    gh.lazySingleton<_i107.DeleteExperienceUseCase>(
        () => _i107.DeleteExperienceUseCase(gh<_i22.ExperienceRepository>()));
    gh.lazySingleton<_i108.DeleteLanguageUseCase>(
        () => _i108.DeleteLanguageUseCase(gh<_i34.LanguageRepository>()));
    gh.lazySingleton<_i109.DeleteNotificationFromIDUseCase>(() =>
        _i109.DeleteNotificationFromIDUseCase(
            gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i110.DeleteNotificationUseCase>(() =>
        _i110.DeleteNotificationUseCase(gh<_i36.NotificationRepository>()));
    gh.lazySingleton<_i111.DeleteResumeUseCase>(
        () => _i111.DeleteResumeUseCase(gh<_i40.ResumeRepository>()));
    gh.factory<_i112.EditApplicantProfileCubit>(() =>
        _i112.EditApplicantProfileCubit(gh<_i79.UpdateUserInfoUseCase>()));
    gh.lazySingleton<_i113.FetchJobUseCase>(
        () => _i113.FetchJobUseCase(gh<_i28.HomeApplicantRepository>()));
    gh.lazySingleton<_i114.FetchJobUseCase>(
        () => _i114.FetchJobUseCase(gh<_i87.ViewJobRepository>()));
    gh.lazySingleton<_i115.GetAppreciationUseCase>(() =>
        _i115.GetAppreciationUseCase(
            gh<_i83.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i116.GetCountriesUseCase>(
        () => _i116.GetCountriesUseCase(gh<_i49.SearchLanguageRepository>()));
    gh.factory<_i117.GetEducationUseCase>(() =>
        _i117.GetEducationUseCase(gh<_i83.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i118.GetLanguageUseCase>(() =>
        _i118.GetLanguageUseCase(gh<_i83.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i119.GetListApplicantUseCase>(() =>
        _i119.GetListApplicantUseCase(gh<_i85.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i120.GetListCompanyPendingUseCase>(() =>
        _i120.GetListCompanyPendingUseCase(gh<_i26.HomeAdminRepository>()));
    gh.lazySingleton<_i121.GetListMyJobUseCase>(
        () => _i121.GetListMyJobUseCase(gh<_i30.HomeCompanyRepository>()));
    gh.lazySingleton<_i122.GetListSkillUseCase>(
        () => _i122.GetListSkillUseCase(gh<_i59.SkillRepository>()));
    gh.lazySingleton<_i123.GetResumeUseCase>(() =>
        _i123.GetResumeUseCase(gh<_i83.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i124.GetUserInfoUseCase>(() =>
        _i124.GetUserInfoUseCase(gh<_i83.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i125.GetWorkExperienceUseCase>(() =>
        _i125.GetWorkExperienceUseCase(
            gh<_i83.ViewApplicantProfileRepository>()));
    gh.factory<_i126.HomeAdminCubit>(() => _i126.HomeAdminCubit(
          gh<_i120.GetListCompanyPendingUseCase>(),
          gh<_i102.ConsiderCompanyUseCase>(),
        ));
    gh.factory<_i127.HomeApplicantCubit>(() => _i127.HomeApplicantCubit(
          gh<_i113.FetchJobUseCase>(),
          gh<_i44.SaveJobUseCase>(),
        ));
    gh.factory<_i128.HomeCompanyCubit>(
        () => _i128.HomeCompanyCubit(gh<_i121.GetListMyJobUseCase>()));
    gh.factory<_i129.JobPositionCubit>(
        () => _i129.JobPositionCubit(gh<_i45.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i130.ListenSaveJobUseCase>(
        () => _i130.ListenSaveJobUseCase(gh<_i42.SaveJobRepository>()));
    gh.factory<_i131.NotificationCubit>(() => _i131.NotificationCubit(
          gh<_i64.StreamNotificationUseCase>(),
          gh<_i39.ReadNotificationUseCase>(),
          gh<_i38.ReadAllNotificationUseCase>(),
          gh<_i109.DeleteNotificationFromIDUseCase>(),
        ));
    gh.lazySingleton<_i132.RegisterApplicantUseCase>(
        () => _i132.RegisterApplicantUseCase(gh<_i57.SignUpRepository>()));
    gh.lazySingleton<_i133.RegisterBusinessUseCase>(
        () => _i133.RegisterBusinessUseCase(gh<_i57.SignUpRepository>()));
    gh.lazySingleton<_i134.RegisterGoogleUseCase>(
        () => _i134.RegisterGoogleUseCase(gh<_i57.SignUpRepository>()));
    gh.factory<_i135.SaveJobCubit>(() => _i135.SaveJobCubit(
          gh<_i130.ListenSaveJobUseCase>(),
          gh<_i105.DeleteAllSaveJobUseCase>(),
          gh<_i44.SaveJobUseCase>(),
        ));
    gh.factory<_i136.SearchJobCubit>(
        () => _i136.SearchJobCubit(gh<_i48.SearchJobUseCase>()));
    gh.factory<_i137.SearchLanguageCubit>(
        () => _i137.SearchLanguageCubit(gh<_i116.GetCountriesUseCase>()));
    gh.factory<_i138.SettingCubit>(() => _i138.SettingCubit(
          gh<_i104.DeleteAccountUseCase>(),
          gh<_i78.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i139.SignInEmailPasswordUseCase>(
        () => _i139.SignInEmailPasswordUseCase(gh<_i55.SignInRepository>()));
    gh.lazySingleton<_i140.SignInGoogleUseCase>(
        () => _i140.SignInGoogleUseCase(gh<_i55.SignInRepository>()));
    gh.factory<_i141.SignUpCubit>(() => _i141.SignUpCubit(
          gh<_i132.RegisterApplicantUseCase>(),
          gh<_i133.RegisterBusinessUseCase>(),
          gh<_i134.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i142.StreamLanguagesUseCase>(
        () => _i142.StreamLanguagesUseCase(gh<_i89.ViewLanguageRepository>()));
    gh.factory<_i143.UpdatePasswordCubit>(() => _i143.UpdatePasswordCubit(
          gh<_i101.ChangePasswordUseCase>(),
          gh<_i80.ValidatePassworkUseCase>(),
        ));
    gh.lazySingleton<_i144.UploadFileVerifyBusinessUseCase>(() =>
        _i144.UploadFileVerifyBusinessUseCase(
            gh<_i81.VerifyBusinessRepository>()));
    gh.factory<_i145.VerifyBusinessCubit>(() =>
        _i145.VerifyBusinessCubit(gh<_i144.UploadFileVerifyBusinessUseCase>()));
    gh.lazySingleton<_i146.ViewCompanyProfileRepository>(
        () => _i147.ViewCompanyProfileRepositoryImpl(
              gh<_i110.DeleteNotificationUseCase>(),
              gh<_i51.SendNotificationUseCase>(),
            ));
    gh.factory<_i148.ViewJobApplicantCubit>(() => _i148.ViewJobApplicantCubit(
          gh<_i119.GetListApplicantUseCase>(),
          gh<_i103.ConsiderResumeUseCase>(),
        ));
    gh.factory<_i149.ViewJobCubit>(
        () => _i149.ViewJobCubit(gh<_i114.FetchJobUseCase>()));
    gh.factory<_i150.ViewLanguageCubit>(() => _i150.ViewLanguageCubit(
          gh<_i142.StreamLanguagesUseCase>(),
          gh<_i108.DeleteLanguageUseCase>(),
        ));
    gh.lazySingleton<_i151.ViewPostRepository>(
        () => _i152.ViewPostRepositoryImpl(
              gh<_i51.SendNotificationUseCase>(),
              gh<_i110.DeleteNotificationUseCase>(),
            ));
    gh.factory<_i153.AddAppreciationCubit>(() => _i153.AddAppreciationCubit(
          gh<_i91.AddAppreciationUseCase>(),
          gh<_i69.UpdateAppreciationUseCase>(),
          gh<_i16.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i154.AddEducationCubit>(() => _i154.AddEducationCubit(
          gh<_i92.AddEducationUseCase>(),
          gh<_i106.DeleteEducationUseCase>(),
          gh<_i70.UpdateEducationUseCase>(),
        ));
    gh.factory<_i155.AddLanguageCubit>(() => _i155.AddLanguageCubit(
          gh<_i95.AddLanguageUseCase>(),
          gh<_i73.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i156.AddResumeCubit>(
        () => _i156.AddResumeCubit(gh<_i97.AddResumeUseCase>()));
    gh.factory<_i157.AddSkillCubit>(() => _i157.AddSkillCubit(
          gh<_i122.GetListSkillUseCase>(),
          gh<_i77.UpdateSkillUseCase>(),
        ));
    gh.factory<_i158.AddWorkExperienceCubit>(() => _i158.AddWorkExperienceCubit(
          gh<_i93.AddExperienceUseCase>(),
          gh<_i71.UpdateExperienceUseCase>(),
          gh<_i107.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i159.ApplyJobCubit>(
        () => _i159.ApplyJobCubit(gh<_i100.ApplyJobUseCase>()));
    gh.lazySingleton<_i160.DeleteCommentUseCase>(
        () => _i160.DeleteCommentUseCase(gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i161.FavouriteCommentUseCase>(
        () => _i161.FavouriteCommentUseCase(gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i162.FavouritePostUseCase>(
        () => _i162.FavouritePostUseCase(gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i163.FetchDataCommentFirstLevelUseCase>(() =>
        _i163.FetchDataCommentFirstLevelUseCase(
            gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i164.FollowUserUseCase>(() =>
        _i164.FollowUserUseCase(gh<_i146.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i165.GetListJobUseCase>(() =>
        _i165.GetListJobUseCase(gh<_i146.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i166.GetReplyCommentUseCase>(
        () => _i166.GetReplyCommentUseCase(gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i167.ReplyCommentUseCase>(
        () => _i167.ReplyCommentUseCase(gh<_i151.ViewPostRepository>()));
    gh.lazySingleton<_i168.SendCommentUseCase>(
        () => _i168.SendCommentUseCase(gh<_i151.ViewPostRepository>()));
    gh.factory<_i169.SignInCubit>(() => _i169.SignInCubit(
          gh<_i139.SignInEmailPasswordUseCase>(),
          gh<_i140.SignInGoogleUseCase>(),
          gh<_i78.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i170.SyncPostDataUseCase>(
        () => _i170.SyncPostDataUseCase(gh<_i151.ViewPostRepository>()));
    gh.factory<_i171.ViewApplicantProfileCubit>(
        () => _i171.ViewApplicantProfileCubit(
              gh<_i115.GetAppreciationUseCase>(),
              gh<_i117.GetEducationUseCase>(),
              gh<_i118.GetLanguageUseCase>(),
              gh<_i123.GetResumeUseCase>(),
              gh<_i25.GetSkillUseCase>(),
              gh<_i124.GetUserInfoUseCase>(),
              gh<_i125.GetWorkExperienceUseCase>(),
              gh<_i63.StreamListPostUseCase>(),
              gh<_i162.FavouritePostUseCase>(),
            ));
    gh.factory<_i172.ViewCompanyProfileCubit>(
        () => _i172.ViewCompanyProfileCubit(
              gh<_i165.GetListJobUseCase>(),
              gh<_i63.StreamListPostUseCase>(),
              gh<_i124.GetUserInfoUseCase>(),
              gh<_i162.FavouritePostUseCase>(),
              gh<_i164.FollowUserUseCase>(),
            ));
    gh.factory<_i173.ViewPostBloc>(() => _i173.ViewPostBloc(
          gh<_i163.FetchDataCommentFirstLevelUseCase>(),
          gh<_i161.FavouriteCommentUseCase>(),
          gh<_i162.FavouritePostUseCase>(),
          gh<_i168.SendCommentUseCase>(),
          gh<_i170.SyncPostDataUseCase>(),
          gh<_i167.ReplyCommentUseCase>(),
          gh<_i166.GetReplyCommentUseCase>(),
          gh<_i160.DeleteCommentUseCase>(),
        ));
    gh.factory<_i174.ApplicantProfileCubit>(() => _i174.ApplicantProfileCubit(
          gh<_i17.DeletePostUseCase>(),
          gh<_i111.DeleteResumeUseCase>(),
          gh<_i63.StreamListPostUseCase>(),
          gh<_i67.StreamWorkExperienceUseCase>(),
          gh<_i62.StreamEducationUseCase>(),
          gh<_i61.StreamAppreciationUseCase>(),
          gh<_i65.StreamResumeUseCase>(),
          gh<_i25.GetSkillUseCase>(),
          gh<_i66.StreamUserInfoUseCase>(),
          gh<_i142.StreamLanguagesUseCase>(),
          gh<_i68.UpdateAboutMeUseCase>(),
          gh<_i162.FavouritePostUseCase>(),
        ));
    gh.factory<_i175.ConnectionCubit>(() => _i175.ConnectionCubit(
          gh<_i24.FetchPostUseCase>(),
          gh<_i162.FavouritePostUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i176.InjectionModule {}
