// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i194;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/core/service/network_service.dart' as _i44;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i170;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i18;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i80;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i171;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i26;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i25;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i105;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i119;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i107;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i172;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i43;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i42;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i108;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i121;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i86;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i109;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i173;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i52;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i51;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i110;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i124;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i174;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i71;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i70;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i137;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i90;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i175;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i28;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i27;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i120;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i83;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i191;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i20;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i33;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i73;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i74;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i176;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i112;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i111;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i113;
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart'
    as _i192;
import 'package:jobspot/src/presentations/company_profile/data/repositories/company_profile_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/company_profile/domain/repositories/company_profile_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/company_profile/domain/use_cases/delete_job_use_case.dart'
    as _i19;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i193;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i16;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart'
    as _i125;
import 'package:jobspot/src/presentations/edit_applicant_profile/data/repositories/edit_applicant_profile_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart'
    as _i92;
import 'package:jobspot/src/presentations/edit_company_profile/cubit/edit_company_profile_cubit.dart'
    as _i126;
import 'package:jobspot/src/presentations/edit_company_profile/data/repositories/edit_company_profile_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/edit_company_profile/domain/repositories/edit_company_profile_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/edit_company_profile/domain/use_cases/update_company_info_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/follow/cubit/follow_cubit.dart'
    as _i129;
import 'package:jobspot/src/presentations/follow/data/repositories/follow_repository_impl.dart'
    as _i31;
import 'package:jobspot/src/presentations/follow/domain/repositories/follow_repository.dart'
    as _i30;
import 'package:jobspot/src/presentations/follow/domain/use_cases/get_list_follow_use_case.dart'
    as _i32;
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart'
    as _i141;
import 'package:jobspot/src/presentations/home_admin/data/repositories/home_admin_repository_impl.dart'
    as _i35;
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart'
    as _i34;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/consider_company_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/get_list_company_pending_use_case.dart'
    as _i135;
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart'
    as _i142;
import 'package:jobspot/src/presentations/home_applicant/data/repositories/home_applicant_repository_impl.dart'
    as _i37;
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart'
    as _i36;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/fetch_job_use_case.dart'
    as _i128;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart'
    as _i55;
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart'
    as _i143;
import 'package:jobspot/src/presentations/home_company/data/repositories/home_company_repository_impl.dart'
    as _i39;
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart'
    as _i38;
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart'
    as _i136;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i144;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i41;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i40;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart' as _i146;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i147;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i46;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i45;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart'
    as _i122;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart'
    as _i123;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i48;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i62;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart'
    as _i91;
import 'package:jobspot/src/presentations/register_google/cubit/register_google_cubit.dart'
    as _i150;
import 'package:jobspot/src/presentations/register_google/data/repositories/register_google_repository_impl.dart'
    as _i50;
import 'package:jobspot/src/presentations/register_google/domain/repositories/register_google_repository.dart'
    as _i49;
import 'package:jobspot/src/presentations/register_google/domain/use_cases/update_info_user_use_case.dart'
    as _i84;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i152;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i54;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i53;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i118;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i145;
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart'
    as _i153;
import 'package:jobspot/src/presentations/search_job/data/repositories/search_job_repository_impl.dart'
    as _i58;
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart'
    as _i57;
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart'
    as _i59;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i154;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i61;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i60;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i131;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i155;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i64;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i63;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i117;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i186;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i67;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i66;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i156;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i157;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i158;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i69;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i68;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i148;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i149;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i151;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i160;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i88;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i87;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i114;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i93;
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart'
    as _i162;
import 'package:jobspot/src/presentations/verify_business/data/repositories/verify_business_repository_impl.dart'
    as _i95;
import 'package:jobspot/src/presentations/verify_business/domain/repositories/verify_business_repository.dart'
    as _i94;
import 'package:jobspot/src/presentations/verify_business/domain/use_cases/upload_file_verify_business_use_case.dart'
    as _i161;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i188;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i97;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i96;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i130;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i132;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i133;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i138;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i139;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i140;
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart'
    as _i189;
import 'package:jobspot/src/presentations/view_company_profile/data/repositories/view_company_profile_repository_impl.dart'
    as _i164;
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart'
    as _i163;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/follow_user_use_case.dart'
    as _i181;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart'
    as _i182;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i166;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i101;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i100;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i127;
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart'
    as _i165;
import 'package:jobspot/src/presentations/view_job_applicant/data/repositories/view_job_applicant_repository_impl.dart'
    as _i99;
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart'
    as _i98;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart'
    as _i134;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i167;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i103;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i102;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i159;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i190;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i169;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i168;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i177;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i178;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i179;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i180;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i183;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i184;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i185;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i187;
import 'package:shared_preferences/shared_preferences.dart' as _i65;

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
    gh.lazySingleton<_i14.CompanyProfileRepository>(
        () => _i15.CompanyProfileRepositoryImpl());
    gh.lazySingleton<_i16.ConnectionRepository>(
        () => _i17.ConnectionRepositoryImpl());
    gh.lazySingleton<_i18.DeleteAppreciationUseCase>(() =>
        _i18.DeleteAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i19.DeleteJobUseCase>(
        () => _i19.DeleteJobUseCase(gh<_i14.CompanyProfileRepository>()));
    gh.lazySingleton<_i20.DeletePostUseCase>(
        () => _i20.DeletePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i21.EditApplicantProfileRepository>(
        () => _i22.EditApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i23.EditCompanyProfileRepository>(
        () => _i24.EditCompanyProfileRepositoryImpl());
    gh.lazySingleton<_i25.EducationRepository>(
        () => _i26.EducationRepositoryImpl());
    gh.lazySingleton<_i27.ExperienceRepository>(
        () => _i28.ExperienceRepositoryImpl());
    gh.lazySingleton<_i29.FetchPostUseCase>(
        () => _i29.FetchPostUseCase(gh<_i16.ConnectionRepository>()));
    gh.lazySingleton<_i30.FollowRepository>(() => _i31.FollowRepositoryImpl());
    gh.lazySingleton<_i32.GetListFollowUseCase>(
        () => _i32.GetListFollowUseCase(gh<_i30.FollowRepository>()));
    gh.factory<_i33.GetSkillUseCase>(
        () => _i33.GetSkillUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i34.HomeAdminRepository>(
        () => _i35.HomeAdminRepositoryImpl());
    gh.lazySingleton<_i36.HomeApplicantRepository>(
        () => _i37.HomeApplicantRepositoryImpl());
    gh.lazySingleton<_i38.HomeCompanyRepository>(
        () => _i39.HomeCompanyRepositoryImpl());
    gh.lazySingleton<_i40.JobPositionRepository>(
        () => _i41.JobPositionRepositoryImpl());
    gh.lazySingleton<_i42.LanguageRepository>(
        () => _i43.LanguageRepositoryImpl());
    gh.lazySingleton<_i44.NetworkService>(() => _i44.NetworkService());
    gh.lazySingleton<_i45.NotificationRepository>(
        () => _i46.NotificationRepositoryImpl());
    gh.lazySingleton<_i47.ReadAllNotificationUseCase>(() =>
        _i47.ReadAllNotificationUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i48.ReadNotificationUseCase>(
        () => _i48.ReadNotificationUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i49.RegisterGoogleRepository>(
        () => _i50.RegisterGoogleRepositoryImpl());
    gh.lazySingleton<_i51.ResumeRepository>(() => _i52.ResumeRepositoryImpl());
    gh.lazySingleton<_i53.SaveJobRepository>(
        () => _i54.SaveJobRepositoryImpl());
    gh.lazySingleton<_i55.SaveJobUseCase>(
        () => _i55.SaveJobUseCase(gh<_i36.HomeApplicantRepository>()));
    gh.factory<_i56.SearchJobPositionUseCase>(
        () => _i56.SearchJobPositionUseCase(gh<_i40.JobPositionRepository>()));
    gh.lazySingleton<_i57.SearchJobRepository>(
        () => _i58.SearchJobRepositoryImpl());
    gh.lazySingleton<_i59.SearchJobUseCase>(
        () => _i59.SearchJobUseCase(gh<_i57.SearchJobRepository>()));
    gh.lazySingleton<_i60.SearchLanguageRepository>(
        () => _i61.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i62.SendNotificationUseCase>(
        () => _i62.SendNotificationUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i63.SettingRepository>(
        () => _i64.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i65.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i66.SignInRepository>(() => _i67.LoginRepositoryImpl());
    gh.lazySingleton<_i68.SignUpRepository>(() => _i69.SignUpRepositoryImpl());
    gh.lazySingleton<_i70.SkillRepository>(() => _i71.SkillRepositoryImpl());
    gh.lazySingleton<_i72.StreamAppreciationUseCase>(() =>
        _i72.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i73.StreamEducationUseCase>(() =>
        _i73.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i74.StreamListPostUseCase>(() =>
        _i74.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i75.StreamNotificationUseCase>(() =>
        _i75.StreamNotificationUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i76.StreamResumeUseCase>(
        () => _i76.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i77.StreamUserInfoUseCase>(() =>
        _i77.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i78.StreamWorkExperienceUseCase>(() =>
        _i78.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i79.UpdateAboutMeUseCase>(
        () => _i79.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i80.UpdateAppreciationUseCase>(() =>
        _i80.UpdateAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i81.UpdateCompanyInfoUseCase>(() =>
        _i81.UpdateCompanyInfoUseCase(gh<_i23.EditCompanyProfileRepository>()));
    gh.lazySingleton<_i82.UpdateEducationUseCase>(
        () => _i82.UpdateEducationUseCase(gh<_i25.EducationRepository>()));
    gh.lazySingleton<_i83.UpdateExperienceUseCase>(
        () => _i83.UpdateExperienceUseCase(gh<_i27.ExperienceRepository>()));
    gh.lazySingleton<_i84.UpdateInfoUserUseCase>(
        () => _i84.UpdateInfoUserUseCase(gh<_i49.RegisterGoogleRepository>()));
    gh.factory<_i85.UpdateJobUseCase>(
        () => _i85.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i86.UpdateLanguageUseCase>(
        () => _i86.UpdateLanguageUseCase(gh<_i42.LanguageRepository>()));
    gh.lazySingleton<_i87.UpdatePasswordRepository>(
        () => _i88.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i89.UpdatePostUseCase>(
        () => _i89.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i90.UpdateSkillUseCase>(
        () => _i90.UpdateSkillUseCase(gh<_i70.SkillRepository>()));
    gh.lazySingleton<_i91.UpdateTokenUseCase>(
        () => _i91.UpdateTokenUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i92.UpdateUserInfoUseCase>(() =>
        _i92.UpdateUserInfoUseCase(gh<_i21.EditApplicantProfileRepository>()));
    gh.lazySingleton<_i93.ValidatePassworkUseCase>(() =>
        _i93.ValidatePassworkUseCase(gh<_i87.UpdatePasswordRepository>()));
    gh.lazySingleton<_i94.VerifyBusinessRepository>(
        () => _i95.VerifyBusinessRepositoryImpl());
    gh.lazySingleton<_i96.ViewApplicantProfileRepository>(
        () => _i97.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i98.ViewJobApplicantRepository>(() =>
        _i99.ViewJobApplicantRepositoryImpl(
            gh<_i62.SendNotificationUseCase>()));
    gh.lazySingleton<_i100.ViewJobRepository>(
        () => _i101.ViewJobRepositoryImpl());
    gh.lazySingleton<_i102.ViewLanguageRepository>(
        () => _i103.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i104.AddAppreciationUseCase>(
        () => _i104.AddAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i105.AddEducationUseCase>(
        () => _i105.AddEducationUseCase(gh<_i25.EducationRepository>()));
    gh.lazySingleton<_i106.AddExperienceUseCase>(
        () => _i106.AddExperienceUseCase(gh<_i27.ExperienceRepository>()));
    gh.factory<_i107.AddJobCubit>(() => _i107.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i85.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i108.AddLanguageUseCase>(
        () => _i108.AddLanguageUseCase(gh<_i42.LanguageRepository>()));
    gh.factory<_i109.AddPostCubit>(() => _i109.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i89.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i110.AddResumeUseCase>(
        () => _i110.AddResumeUseCase(gh<_i51.ResumeRepository>()));
    gh.lazySingleton<_i111.ApplyJobRepository>(
        () => _i112.ApplyJobRepositoryImpl(
              gh<_i62.SendNotificationUseCase>(),
              gh<_i110.AddResumeUseCase>(),
            ));
    gh.lazySingleton<_i113.ApplyJobUseCase>(
        () => _i113.ApplyJobUseCase(gh<_i111.ApplyJobRepository>()));
    gh.lazySingleton<_i114.ChangePasswordUseCase>(
        () => _i114.ChangePasswordUseCase(gh<_i87.UpdatePasswordRepository>()));
    gh.lazySingleton<_i115.ConsiderCompanyUseCase>(
        () => _i115.ConsiderCompanyUseCase(gh<_i34.HomeAdminRepository>()));
    gh.lazySingleton<_i116.ConsiderResumeUseCase>(() =>
        _i116.ConsiderResumeUseCase(gh<_i98.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i117.DeleteAccountUseCase>(
        () => _i117.DeleteAccountUseCase(gh<_i63.SettingRepository>()));
    gh.lazySingleton<_i118.DeleteAllSaveJobUseCase>(
        () => _i118.DeleteAllSaveJobUseCase(gh<_i53.SaveJobRepository>()));
    gh.lazySingleton<_i119.DeleteEducationUseCase>(
        () => _i119.DeleteEducationUseCase(gh<_i25.EducationRepository>()));
    gh.lazySingleton<_i120.DeleteExperienceUseCase>(
        () => _i120.DeleteExperienceUseCase(gh<_i27.ExperienceRepository>()));
    gh.lazySingleton<_i121.DeleteLanguageUseCase>(
        () => _i121.DeleteLanguageUseCase(gh<_i42.LanguageRepository>()));
    gh.lazySingleton<_i122.DeleteNotificationFromIDUseCase>(() =>
        _i122.DeleteNotificationFromIDUseCase(
            gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i123.DeleteNotificationUseCase>(() =>
        _i123.DeleteNotificationUseCase(gh<_i45.NotificationRepository>()));
    gh.lazySingleton<_i124.DeleteResumeUseCase>(
        () => _i124.DeleteResumeUseCase(gh<_i51.ResumeRepository>()));
    gh.factory<_i125.EditApplicantProfileCubit>(() =>
        _i125.EditApplicantProfileCubit(gh<_i92.UpdateUserInfoUseCase>()));
    gh.factory<_i126.EditCompanyProfileCubit>(() =>
        _i126.EditCompanyProfileCubit(gh<_i81.UpdateCompanyInfoUseCase>()));
    gh.lazySingleton<_i127.FetchJobUseCase>(
        () => _i127.FetchJobUseCase(gh<_i100.ViewJobRepository>()));
    gh.lazySingleton<_i128.FetchJobUseCase>(
        () => _i128.FetchJobUseCase(gh<_i36.HomeApplicantRepository>()));
    gh.factory<_i129.FollowCubit>(
        () => _i129.FollowCubit(gh<_i32.GetListFollowUseCase>()));
    gh.lazySingleton<_i130.GetAppreciationUseCase>(() =>
        _i130.GetAppreciationUseCase(
            gh<_i96.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i131.GetCountriesUseCase>(
        () => _i131.GetCountriesUseCase(gh<_i60.SearchLanguageRepository>()));
    gh.factory<_i132.GetEducationUseCase>(() =>
        _i132.GetEducationUseCase(gh<_i96.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i133.GetLanguageUseCase>(() =>
        _i133.GetLanguageUseCase(gh<_i96.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i134.GetListApplicantUseCase>(() =>
        _i134.GetListApplicantUseCase(gh<_i98.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i135.GetListCompanyPendingUseCase>(() =>
        _i135.GetListCompanyPendingUseCase(gh<_i34.HomeAdminRepository>()));
    gh.lazySingleton<_i136.GetListMyJobUseCase>(
        () => _i136.GetListMyJobUseCase(gh<_i38.HomeCompanyRepository>()));
    gh.lazySingleton<_i137.GetListSkillUseCase>(
        () => _i137.GetListSkillUseCase(gh<_i70.SkillRepository>()));
    gh.lazySingleton<_i138.GetResumeUseCase>(() =>
        _i138.GetResumeUseCase(gh<_i96.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i139.GetUserInfoUseCase>(() =>
        _i139.GetUserInfoUseCase(gh<_i96.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i140.GetWorkExperienceUseCase>(() =>
        _i140.GetWorkExperienceUseCase(
            gh<_i96.ViewApplicantProfileRepository>()));
    gh.factory<_i141.HomeAdminCubit>(() => _i141.HomeAdminCubit(
          gh<_i135.GetListCompanyPendingUseCase>(),
          gh<_i115.ConsiderCompanyUseCase>(),
        ));
    gh.factory<_i142.HomeApplicantCubit>(() => _i142.HomeApplicantCubit(
          gh<_i128.FetchJobUseCase>(),
          gh<_i55.SaveJobUseCase>(),
        ));
    gh.factory<_i143.HomeCompanyCubit>(
        () => _i143.HomeCompanyCubit(gh<_i136.GetListMyJobUseCase>()));
    gh.factory<_i144.JobPositionCubit>(
        () => _i144.JobPositionCubit(gh<_i56.SearchJobPositionUseCase>()));
    gh.lazySingleton<_i145.ListenSaveJobUseCase>(
        () => _i145.ListenSaveJobUseCase(gh<_i53.SaveJobRepository>()));
    gh.factory<_i146.MainCubit>(
        () => _i146.MainCubit(gh<_i91.UpdateTokenUseCase>()));
    gh.factory<_i147.NotificationCubit>(() => _i147.NotificationCubit(
          gh<_i75.StreamNotificationUseCase>(),
          gh<_i48.ReadNotificationUseCase>(),
          gh<_i47.ReadAllNotificationUseCase>(),
          gh<_i122.DeleteNotificationFromIDUseCase>(),
        ));
    gh.lazySingleton<_i148.RegisterApplicantUseCase>(
        () => _i148.RegisterApplicantUseCase(gh<_i68.SignUpRepository>()));
    gh.lazySingleton<_i149.RegisterBusinessUseCase>(
        () => _i149.RegisterBusinessUseCase(gh<_i68.SignUpRepository>()));
    gh.factory<_i150.RegisterGoogleCubit>(
        () => _i150.RegisterGoogleCubit(gh<_i84.UpdateInfoUserUseCase>()));
    gh.lazySingleton<_i151.RegisterGoogleUseCase>(
        () => _i151.RegisterGoogleUseCase(gh<_i68.SignUpRepository>()));
    gh.factory<_i152.SaveJobCubit>(() => _i152.SaveJobCubit(
          gh<_i145.ListenSaveJobUseCase>(),
          gh<_i118.DeleteAllSaveJobUseCase>(),
          gh<_i55.SaveJobUseCase>(),
        ));
    gh.factory<_i153.SearchJobCubit>(
        () => _i153.SearchJobCubit(gh<_i59.SearchJobUseCase>()));
    gh.factory<_i154.SearchLanguageCubit>(
        () => _i154.SearchLanguageCubit(gh<_i131.GetCountriesUseCase>()));
    gh.factory<_i155.SettingCubit>(() => _i155.SettingCubit(
          gh<_i117.DeleteAccountUseCase>(),
          gh<_i91.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i156.SignInEmailPasswordUseCase>(
        () => _i156.SignInEmailPasswordUseCase(gh<_i66.SignInRepository>()));
    gh.lazySingleton<_i157.SignInGoogleUseCase>(
        () => _i157.SignInGoogleUseCase(gh<_i66.SignInRepository>()));
    gh.factory<_i158.SignUpCubit>(() => _i158.SignUpCubit(
          gh<_i148.RegisterApplicantUseCase>(),
          gh<_i149.RegisterBusinessUseCase>(),
          gh<_i151.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i159.StreamLanguagesUseCase>(
        () => _i159.StreamLanguagesUseCase(gh<_i102.ViewLanguageRepository>()));
    gh.factory<_i160.UpdatePasswordCubit>(() => _i160.UpdatePasswordCubit(
          gh<_i114.ChangePasswordUseCase>(),
          gh<_i93.ValidatePassworkUseCase>(),
        ));
    gh.lazySingleton<_i161.UploadFileVerifyBusinessUseCase>(() =>
        _i161.UploadFileVerifyBusinessUseCase(
            gh<_i94.VerifyBusinessRepository>()));
    gh.factory<_i162.VerifyBusinessCubit>(() =>
        _i162.VerifyBusinessCubit(gh<_i161.UploadFileVerifyBusinessUseCase>()));
    gh.lazySingleton<_i163.ViewCompanyProfileRepository>(
        () => _i164.ViewCompanyProfileRepositoryImpl(
              gh<_i123.DeleteNotificationUseCase>(),
              gh<_i62.SendNotificationUseCase>(),
            ));
    gh.factory<_i165.ViewJobApplicantCubit>(() => _i165.ViewJobApplicantCubit(
          gh<_i134.GetListApplicantUseCase>(),
          gh<_i116.ConsiderResumeUseCase>(),
        ));
    gh.factory<_i166.ViewJobCubit>(
        () => _i166.ViewJobCubit(gh<_i127.FetchJobUseCase>()));
    gh.factory<_i167.ViewLanguageCubit>(() => _i167.ViewLanguageCubit(
          gh<_i159.StreamLanguagesUseCase>(),
          gh<_i121.DeleteLanguageUseCase>(),
        ));
    gh.lazySingleton<_i168.ViewPostRepository>(
        () => _i169.ViewPostRepositoryImpl(
              gh<_i62.SendNotificationUseCase>(),
              gh<_i123.DeleteNotificationUseCase>(),
            ));
    gh.factory<_i170.AddAppreciationCubit>(() => _i170.AddAppreciationCubit(
          gh<_i104.AddAppreciationUseCase>(),
          gh<_i80.UpdateAppreciationUseCase>(),
          gh<_i18.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i171.AddEducationCubit>(() => _i171.AddEducationCubit(
          gh<_i105.AddEducationUseCase>(),
          gh<_i119.DeleteEducationUseCase>(),
          gh<_i82.UpdateEducationUseCase>(),
        ));
    gh.factory<_i172.AddLanguageCubit>(() => _i172.AddLanguageCubit(
          gh<_i108.AddLanguageUseCase>(),
          gh<_i86.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i173.AddResumeCubit>(
        () => _i173.AddResumeCubit(gh<_i110.AddResumeUseCase>()));
    gh.factory<_i174.AddSkillCubit>(() => _i174.AddSkillCubit(
          gh<_i137.GetListSkillUseCase>(),
          gh<_i90.UpdateSkillUseCase>(),
        ));
    gh.factory<_i175.AddWorkExperienceCubit>(() => _i175.AddWorkExperienceCubit(
          gh<_i106.AddExperienceUseCase>(),
          gh<_i83.UpdateExperienceUseCase>(),
          gh<_i120.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i176.ApplyJobCubit>(
        () => _i176.ApplyJobCubit(gh<_i113.ApplyJobUseCase>()));
    gh.lazySingleton<_i177.DeleteCommentUseCase>(
        () => _i177.DeleteCommentUseCase(gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i178.FavouriteCommentUseCase>(
        () => _i178.FavouriteCommentUseCase(gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i179.FavouritePostUseCase>(
        () => _i179.FavouritePostUseCase(gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i180.FetchDataCommentFirstLevelUseCase>(() =>
        _i180.FetchDataCommentFirstLevelUseCase(
            gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i181.FollowUserUseCase>(() =>
        _i181.FollowUserUseCase(gh<_i163.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i182.GetListJobUseCase>(() =>
        _i182.GetListJobUseCase(gh<_i163.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i183.GetReplyCommentUseCase>(
        () => _i183.GetReplyCommentUseCase(gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i184.ReplyCommentUseCase>(
        () => _i184.ReplyCommentUseCase(gh<_i168.ViewPostRepository>()));
    gh.lazySingleton<_i185.SendCommentUseCase>(
        () => _i185.SendCommentUseCase(gh<_i168.ViewPostRepository>()));
    gh.factory<_i186.SignInCubit>(() => _i186.SignInCubit(
          gh<_i156.SignInEmailPasswordUseCase>(),
          gh<_i157.SignInGoogleUseCase>(),
        ));
    gh.lazySingleton<_i187.SyncPostDataUseCase>(
        () => _i187.SyncPostDataUseCase(gh<_i168.ViewPostRepository>()));
    gh.factory<_i188.ViewApplicantProfileCubit>(
        () => _i188.ViewApplicantProfileCubit(
              gh<_i130.GetAppreciationUseCase>(),
              gh<_i132.GetEducationUseCase>(),
              gh<_i133.GetLanguageUseCase>(),
              gh<_i138.GetResumeUseCase>(),
              gh<_i33.GetSkillUseCase>(),
              gh<_i139.GetUserInfoUseCase>(),
              gh<_i140.GetWorkExperienceUseCase>(),
              gh<_i74.StreamListPostUseCase>(),
              gh<_i179.FavouritePostUseCase>(),
            ));
    gh.factory<_i189.ViewCompanyProfileCubit>(
        () => _i189.ViewCompanyProfileCubit(
              gh<_i182.GetListJobUseCase>(),
              gh<_i74.StreamListPostUseCase>(),
              gh<_i139.GetUserInfoUseCase>(),
              gh<_i179.FavouritePostUseCase>(),
              gh<_i181.FollowUserUseCase>(),
            ));
    gh.factory<_i190.ViewPostBloc>(() => _i190.ViewPostBloc(
          gh<_i180.FetchDataCommentFirstLevelUseCase>(),
          gh<_i178.FavouriteCommentUseCase>(),
          gh<_i179.FavouritePostUseCase>(),
          gh<_i185.SendCommentUseCase>(),
          gh<_i187.SyncPostDataUseCase>(),
          gh<_i184.ReplyCommentUseCase>(),
          gh<_i183.GetReplyCommentUseCase>(),
          gh<_i177.DeleteCommentUseCase>(),
        ));
    gh.factory<_i191.ApplicantProfileCubit>(() => _i191.ApplicantProfileCubit(
          gh<_i20.DeletePostUseCase>(),
          gh<_i124.DeleteResumeUseCase>(),
          gh<_i74.StreamListPostUseCase>(),
          gh<_i78.StreamWorkExperienceUseCase>(),
          gh<_i73.StreamEducationUseCase>(),
          gh<_i72.StreamAppreciationUseCase>(),
          gh<_i76.StreamResumeUseCase>(),
          gh<_i33.GetSkillUseCase>(),
          gh<_i77.StreamUserInfoUseCase>(),
          gh<_i159.StreamLanguagesUseCase>(),
          gh<_i79.UpdateAboutMeUseCase>(),
          gh<_i179.FavouritePostUseCase>(),
        ));
    gh.factory<_i192.CompanyProfileCubit>(() => _i192.CompanyProfileCubit(
          gh<_i179.FavouritePostUseCase>(),
          gh<_i77.StreamUserInfoUseCase>(),
          gh<_i74.StreamListPostUseCase>(),
          gh<_i182.GetListJobUseCase>(),
          gh<_i20.DeletePostUseCase>(),
          gh<_i19.DeleteJobUseCase>(),
        ));
    gh.factory<_i193.ConnectionCubit>(() => _i193.ConnectionCubit(
          gh<_i29.FetchPostUseCase>(),
          gh<_i179.FavouritePostUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i194.InjectionModule {}
