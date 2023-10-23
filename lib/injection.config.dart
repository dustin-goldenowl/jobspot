// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i142;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i133;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i63;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i134;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i64;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i84;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i135;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i32;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i31;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i95;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i86;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i136;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i96;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i137;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i54;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i53;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i138;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i94;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i65;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i139;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i26;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i57;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i60;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i61;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i88;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i14;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i140;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i18;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i25;
import 'package:jobspot/src/presentations/home/cubit/home_cubit.dart' as _i111;
import 'package:jobspot/src/presentations/home/data/repositories/home_repository_impl.dart'
    as _i28;
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart'
    as _i27;
import 'package:jobspot/src/presentations/home/domain/use_cases/fetch_job_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/home/domain/use_cases/save_job_use_case.dart'
    as _i41;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i112;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i30;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i29;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i42;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i114;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i35;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i36;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i45;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i58;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i119;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i113;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i120;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i44;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i43;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i103;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i122;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i47;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i46;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i90;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i141;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i50;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i49;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i123;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i124;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i125;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i52;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i51;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i117;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i128;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i69;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i68;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i74;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i73;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i109;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i110;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i130;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i76;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i75;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i131;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i78;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i77;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i126;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i132;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i80;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i79;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i92;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i97;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i98;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i99;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i107;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i118;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i121;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i127;
import 'package:shared_preferences/shared_preferences.dart' as _i48;

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
    gh.lazySingleton<_i33.NotificationRepository>(
        () => _i34.NotificationRepositoryImpl());
    gh.lazySingleton<_i35.ReadAllNotificationUseCase>(() =>
        _i35.ReadAllNotificationUseCase(gh<_i33.NotificationRepository>()));
    gh.lazySingleton<_i36.ReadNotificationUseCase>(
        () => _i36.ReadNotificationUseCase(gh<_i33.NotificationRepository>()));
    gh.lazySingleton<_i37.ResumeRepository>(() => _i38.ResumeRepositoryImpl());
    gh.lazySingleton<_i39.SaveJobRepository>(
        () => _i40.SaveJobRepositoryImpl());
    gh.lazySingleton<_i41.SaveJobUseCase>(
        () => _i41.SaveJobUseCase(gh<_i27.HomeRepository>()));
    gh.factory<_i42.SearchJobPositionUseCase>(
        () => _i42.SearchJobPositionUseCase(gh<_i29.JobPositionRepository>()));
    gh.lazySingleton<_i43.SearchLanguageRepository>(
        () => _i44.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i45.SendNotificationUseCase>(
        () => _i45.SendNotificationUseCase(gh<_i33.NotificationRepository>()));
    gh.lazySingleton<_i46.SettingRepository>(
        () => _i47.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i48.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i49.SignInRepository>(() => _i50.LoginRepositoryImpl());
    gh.lazySingleton<_i51.SignUpRepository>(() => _i52.SignUpRepositoryImpl());
    gh.lazySingleton<_i53.SkillRepository>(() => _i54.SkillRepositoryImpl());
    gh.lazySingleton<_i55.StreamAppreciationUseCase>(() =>
        _i55.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i56.StreamEducationUseCase>(() =>
        _i56.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i57.StreamListPostUseCase>(() =>
        _i57.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i58.StreamNotificationUseCase>(() =>
        _i58.StreamNotificationUseCase(gh<_i33.NotificationRepository>()));
    gh.lazySingleton<_i59.StreamResumeUseCase>(
        () => _i59.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i60.StreamUserInfoUseCase>(() =>
        _i60.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i61.StreamWorkExperienceUseCase>(() =>
        _i61.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i62.UpdateAboutMeUseCase>(
        () => _i62.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i63.UpdateAppreciationUseCase>(() =>
        _i63.UpdateAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i64.UpdateEducationUseCase>(
        () => _i64.UpdateEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i65.UpdateExperienceUseCase>(
        () => _i65.UpdateExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i66.UpdateJobUseCase>(
        () => _i66.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i67.UpdateLanguageUseCase>(
        () => _i67.UpdateLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.lazySingleton<_i68.UpdatePasswordRepository>(
        () => _i69.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i70.UpdatePostUseCase>(
        () => _i70.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i71.UpdateSkillUseCase>(
        () => _i71.UpdateSkillUseCase(gh<_i53.SkillRepository>()));
    gh.lazySingleton<_i72.ValidatePassworkUseCase>(() =>
        _i72.ValidatePassworkUseCase(gh<_i68.UpdatePasswordRepository>()));
    gh.lazySingleton<_i73.ViewApplicantProfileRepository>(
        () => _i74.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i75.ViewJobRepository>(
        () => _i76.ViewJobRepositoryImpl());
    gh.lazySingleton<_i77.ViewLanguageRepository>(
        () => _i78.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i79.ViewPostRepository>(
        () => _i80.ViewPostRepositoryImpl(gh<_i45.SendNotificationUseCase>()));
    gh.lazySingleton<_i81.AddAppreciationUseCase>(
        () => _i81.AddAppreciationUseCase(gh<_i15.AppreciationRepository>()));
    gh.lazySingleton<_i82.AddEducationUseCase>(
        () => _i82.AddEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i83.AddExperienceUseCase>(
        () => _i83.AddExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.factory<_i84.AddJobCubit>(() => _i84.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i66.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i85.AddLanguageUseCase>(
        () => _i85.AddLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.factory<_i86.AddPostCubit>(() => _i86.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i70.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i87.AddResumeUseCase>(
        () => _i87.AddResumeUseCase(gh<_i37.ResumeRepository>()));
    gh.factory<_i88.ApplyJobCubit>(
        () => _i88.ApplyJobCubit(gh<_i14.ApplyJobUseCase>()));
    gh.lazySingleton<_i89.ChangePasswordUseCase>(
        () => _i89.ChangePasswordUseCase(gh<_i68.UpdatePasswordRepository>()));
    gh.lazySingleton<_i90.DeleteAccountUseCase>(
        () => _i90.DeleteAccountUseCase(gh<_i46.SettingRepository>()));
    gh.lazySingleton<_i91.DeleteAllSaveJobUseCase>(
        () => _i91.DeleteAllSaveJobUseCase(gh<_i39.SaveJobRepository>()));
    gh.lazySingleton<_i92.DeleteCommentUseCase>(
        () => _i92.DeleteCommentUseCase(gh<_i79.ViewPostRepository>()));
    gh.lazySingleton<_i93.DeleteEducationUseCase>(
        () => _i93.DeleteEducationUseCase(gh<_i21.EducationRepository>()));
    gh.lazySingleton<_i94.DeleteExperienceUseCase>(
        () => _i94.DeleteExperienceUseCase(gh<_i23.ExperienceRepository>()));
    gh.lazySingleton<_i95.DeleteLanguageUseCase>(
        () => _i95.DeleteLanguageUseCase(gh<_i31.LanguageRepository>()));
    gh.lazySingleton<_i96.DeleteResumeUseCase>(
        () => _i96.DeleteResumeUseCase(gh<_i37.ResumeRepository>()));
    gh.lazySingleton<_i97.FavouriteCommentUseCase>(
        () => _i97.FavouriteCommentUseCase(gh<_i79.ViewPostRepository>()));
    gh.lazySingleton<_i98.FavouritePostUseCase>(
        () => _i98.FavouritePostUseCase(gh<_i79.ViewPostRepository>()));
    gh.lazySingleton<_i99.FetchDataCommentFirstLevelUseCase>(() =>
        _i99.FetchDataCommentFirstLevelUseCase(gh<_i79.ViewPostRepository>()));
    gh.lazySingleton<_i100.FetchJobUseCase>(
        () => _i100.FetchJobUseCase(gh<_i27.HomeRepository>()));
    gh.lazySingleton<_i101.FetchJobUseCase>(
        () => _i101.FetchJobUseCase(gh<_i75.ViewJobRepository>()));
    gh.lazySingleton<_i102.GetAppreciationUseCase>(() =>
        _i102.GetAppreciationUseCase(
            gh<_i73.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i103.GetCountriesUseCase>(
        () => _i103.GetCountriesUseCase(gh<_i43.SearchLanguageRepository>()));
    gh.factory<_i104.GetEducationUseCase>(() =>
        _i104.GetEducationUseCase(gh<_i73.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i105.GetLanguageUseCase>(() =>
        _i105.GetLanguageUseCase(gh<_i73.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i106.GetListSkillUseCase>(
        () => _i106.GetListSkillUseCase(gh<_i53.SkillRepository>()));
    gh.lazySingleton<_i107.GetReplyCommentUseCase>(
        () => _i107.GetReplyCommentUseCase(gh<_i79.ViewPostRepository>()));
    gh.lazySingleton<_i108.GetResumeUseCase>(() =>
        _i108.GetResumeUseCase(gh<_i73.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i109.GetUserInfoUseCase>(() =>
        _i109.GetUserInfoUseCase(gh<_i73.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i110.GetWorkExperienceUseCase>(() =>
        _i110.GetWorkExperienceUseCase(
            gh<_i73.ViewApplicantProfileRepository>()));
    gh.factory<_i111.HomeCubit>(() => _i111.HomeCubit(
          gh<_i100.FetchJobUseCase>(),
          gh<_i41.SaveJobUseCase>(),
        ));
    gh.factory<_i112.JobPositionCubit>(
        () => _i112.JobPositionCubit(gh<_i42.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i113.ListenSaveJobUseCase>(
        () => _i113.ListenSaveJobUseCase(gh<_i39.SaveJobRepository>()));
    gh.factory<_i114.NotificationCubit>(() => _i114.NotificationCubit(
          gh<_i58.StreamNotificationUseCase>(),
          gh<_i36.ReadNotificationUseCase>(),
          gh<_i35.ReadAllNotificationUseCase>(),
        ));
    gh.lazySingleton<_i115.RegisterApplicantUseCase>(
        () => _i115.RegisterApplicantUseCase(gh<_i51.SignUpRepository>()));
    gh.lazySingleton<_i116.RegisterBusinessUseCase>(
        () => _i116.RegisterBusinessUseCase(gh<_i51.SignUpRepository>()));
    gh.lazySingleton<_i117.RegisterGoogleUseCase>(
        () => _i117.RegisterGoogleUseCase(gh<_i51.SignUpRepository>()));
    gh.lazySingleton<_i118.ReplyCommentUseCase>(
        () => _i118.ReplyCommentUseCase(gh<_i79.ViewPostRepository>()));
    gh.factory<_i119.SaveJobCubit>(() => _i119.SaveJobCubit(
          gh<_i113.ListenSaveJobUseCase>(),
          gh<_i91.DeleteAllSaveJobUseCase>(),
          gh<_i41.SaveJobUseCase>(),
        ));
    gh.factory<_i120.SearchLanguageCubit>(
        () => _i120.SearchLanguageCubit(gh<_i103.GetCountriesUseCase>()));
    gh.lazySingleton<_i121.SendCommentUseCase>(
        () => _i121.SendCommentUseCase(gh<_i79.ViewPostRepository>()));
    gh.factory<_i122.SettingCubit>(
        () => _i122.SettingCubit(gh<_i90.DeleteAccountUseCase>()));
    gh.lazySingleton<_i123.SignInEmailPasswordUseCase>(
        () => _i123.SignInEmailPasswordUseCase(gh<_i49.SignInRepository>()));
    gh.lazySingleton<_i124.SignInGoogleUseCase>(
        () => _i124.SignInGoogleUseCase(gh<_i49.SignInRepository>()));
    gh.factory<_i125.SignUpCubit>(() => _i125.SignUpCubit(
          gh<_i115.RegisterApplicantUseCase>(),
          gh<_i116.RegisterBusinessUseCase>(),
          gh<_i117.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i126.StreamLanguagesUseCase>(
        () => _i126.StreamLanguagesUseCase(gh<_i77.ViewLanguageRepository>()));
    gh.lazySingleton<_i127.SyncPostDataUseCase>(
        () => _i127.SyncPostDataUseCase(gh<_i79.ViewPostRepository>()));
    gh.factory<_i128.UpdatePasswordCubit>(() => _i128.UpdatePasswordCubit(
          gh<_i89.ChangePasswordUseCase>(),
          gh<_i72.ValidatePassworkUseCase>(),
        ));
    gh.factory<_i129.ViewApplicantProfileCubit>(
        () => _i129.ViewApplicantProfileCubit(
              gh<_i102.GetAppreciationUseCase>(),
              gh<_i104.GetEducationUseCase>(),
              gh<_i105.GetLanguageUseCase>(),
              gh<_i108.GetResumeUseCase>(),
              gh<_i26.GetSkillUseCase>(),
              gh<_i109.GetUserInfoUseCase>(),
              gh<_i110.GetWorkExperienceUseCase>(),
              gh<_i57.StreamListPostUseCase>(),
              gh<_i98.FavouritePostUseCase>(),
            ));
    gh.factory<_i130.ViewJobCubit>(
        () => _i130.ViewJobCubit(gh<_i101.FetchJobUseCase>()));
    gh.factory<_i131.ViewLanguageCubit>(() => _i131.ViewLanguageCubit(
          gh<_i126.StreamLanguagesUseCase>(),
          gh<_i95.DeleteLanguageUseCase>(),
        ));
    gh.factory<_i132.ViewPostBloc>(() => _i132.ViewPostBloc(
          gh<_i99.FetchDataCommentFirstLevelUseCase>(),
          gh<_i97.FavouriteCommentUseCase>(),
          gh<_i98.FavouritePostUseCase>(),
          gh<_i121.SendCommentUseCase>(),
          gh<_i127.SyncPostDataUseCase>(),
          gh<_i118.ReplyCommentUseCase>(),
          gh<_i107.GetReplyCommentUseCase>(),
          gh<_i92.DeleteCommentUseCase>(),
        ));
    gh.factory<_i133.AddAppreciationCubit>(() => _i133.AddAppreciationCubit(
          gh<_i81.AddAppreciationUseCase>(),
          gh<_i63.UpdateAppreciationUseCase>(),
          gh<_i19.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i134.AddEducationCubit>(() => _i134.AddEducationCubit(
          gh<_i82.AddEducationUseCase>(),
          gh<_i93.DeleteEducationUseCase>(),
          gh<_i64.UpdateEducationUseCase>(),
        ));
    gh.factory<_i135.AddLanguageCubit>(() => _i135.AddLanguageCubit(
          gh<_i85.AddLanguageUseCase>(),
          gh<_i67.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i136.AddResumeCubit>(
        () => _i136.AddResumeCubit(gh<_i87.AddResumeUseCase>()));
    gh.factory<_i137.AddSkillCubit>(() => _i137.AddSkillCubit(
          gh<_i106.GetListSkillUseCase>(),
          gh<_i71.UpdateSkillUseCase>(),
        ));
    gh.factory<_i138.AddWorkExperienceCubit>(() => _i138.AddWorkExperienceCubit(
          gh<_i83.AddExperienceUseCase>(),
          gh<_i65.UpdateExperienceUseCase>(),
          gh<_i94.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i139.ApplicantProfileCubit>(() => _i139.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i96.DeleteResumeUseCase>(),
          gh<_i57.StreamListPostUseCase>(),
          gh<_i61.StreamWorkExperienceUseCase>(),
          gh<_i56.StreamEducationUseCase>(),
          gh<_i55.StreamAppreciationUseCase>(),
          gh<_i59.StreamResumeUseCase>(),
          gh<_i26.GetSkillUseCase>(),
          gh<_i60.StreamUserInfoUseCase>(),
          gh<_i126.StreamLanguagesUseCase>(),
          gh<_i62.UpdateAboutMeUseCase>(),
          gh<_i98.FavouritePostUseCase>(),
        ));
    gh.factory<_i140.ConnectionCubit>(() => _i140.ConnectionCubit(
          gh<_i25.FetchPostUseCase>(),
          gh<_i98.FavouritePostUseCase>(),
        ));
    gh.factory<_i141.SignInCubit>(() => _i141.SignInCubit(
          gh<_i123.SignInEmailPasswordUseCase>(),
          gh<_i124.SignInGoogleUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i142.InjectionModule {}
