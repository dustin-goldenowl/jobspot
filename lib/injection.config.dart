// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jobspot/injection.dart' as _i204;
import 'package:jobspot/src/core/config/router/app_router.dart' as _i9;
import 'package:jobspot/src/core/service/network_service.dart' as _i43;
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart'
    as _i176;
import 'package:jobspot/src/presentations/add_appreciation/data/repositories/appreciation_repository_impl.dart'
    as _i13;
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart'
    as _i12;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart'
    as _i100;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart'
    as _i76;
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart'
    as _i177;
import 'package:jobspot/src/presentations/add_education/data/repositories/education_repository_impl.dart'
    as _i24;
import 'package:jobspot/src/presentations/add_education/domain/repositories/education_repository.dart'
    as _i23;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart'
    as _i101;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart'
    as _i117;
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart'
    as _i78;
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart'
    as _i103;
import 'package:jobspot/src/presentations/add_job/data/repositories/add_job_repository_impl.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart'
    as _i81;
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart'
    as _i178;
import 'package:jobspot/src/presentations/add_language/data/repositories/language_repository_impl.dart'
    as _i42;
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart'
    as _i41;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart'
    as _i104;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart'
    as _i119;
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart'
    as _i82;
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart'
    as _i105;
import 'package:jobspot/src/presentations/add_post/data/repositories/add_post_repository_impl.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_post/domain/repositories/add_post_repository.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/add_post_use_case.dart'
    as _i8;
import 'package:jobspot/src/presentations/add_post/domain/use_cases/update_post_use_case.dart'
    as _i85;
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart'
    as _i179;
import 'package:jobspot/src/presentations/add_resume/data/repositories/resume_repository_impl.dart'
    as _i51;
import 'package:jobspot/src/presentations/add_resume/domain/repositories/resume_repository.dart'
    as _i50;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart'
    as _i107;
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/delete_resume_use_case.dart'
    as _i122;
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart'
    as _i180;
import 'package:jobspot/src/presentations/add_skill/data/repositories/skill_repository_impl.dart'
    as _i65;
import 'package:jobspot/src/presentations/add_skill/domain/repositories/skill_repository.dart'
    as _i64;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart'
    as _i138;
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart'
    as _i86;
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart'
    as _i181;
import 'package:jobspot/src/presentations/add_work_experience/data/repositories/experience_repository_impl.dart'
    as _i26;
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart'
    as _i25;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart'
    as _i102;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart'
    as _i118;
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart'
    as _i79;
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart'
    as _i201;
import 'package:jobspot/src/presentations/applicant_profile/data/repositories/applicant_profile_repository_impl.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart'
    as _i10;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/delete_post_use_case.dart'
    as _i18;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_share_post_use_case.dart'
    as _i30;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_user_use_case.dart'
    as _i31;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_skill_use_case.dart'
    as _i32;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_appreciation_use_case.dart'
    as _i66;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_education_use_case.dart'
    as _i67;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_list_post_use_case.dart'
    as _i68;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_resume_use_case.dart'
    as _i70;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_user_info_use_case.dart'
    as _i71;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/stream_work_experience_use_case.dart'
    as _i72;
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/update_about_me_use_case.dart'
    as _i75;
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart'
    as _i182;
import 'package:jobspot/src/presentations/apply_job/data/repositories/apply_job_repository_impl.dart'
    as _i109;
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart'
    as _i108;
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart'
    as _i110;
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart'
    as _i202;
import 'package:jobspot/src/presentations/company_profile/data/repositories/company_profile_repository_impl.dart'
    as _i15;
import 'package:jobspot/src/presentations/company_profile/domain/repositories/company_profile_repository.dart'
    as _i14;
import 'package:jobspot/src/presentations/company_profile/domain/use_cases/delete_job_use_case.dart'
    as _i17;
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as _i203;
import 'package:jobspot/src/presentations/connection/data/repositories/connection_repository_impl.dart'
    as _i113;
import 'package:jobspot/src/presentations/connection/domain/repositories/connection_repository.dart'
    as _i112;
import 'package:jobspot/src/presentations/connection/domain/use_cases/fetch_post_use_case.dart'
    as _i127;
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart'
    as _i159;
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart'
    as _i123;
import 'package:jobspot/src/presentations/edit_applicant_profile/data/repositories/edit_applicant_profile_repository_impl.dart'
    as _i20;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart'
    as _i19;
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/use_cases/update_user_info_use_case.dart'
    as _i88;
import 'package:jobspot/src/presentations/edit_company_profile/cubit/edit_company_profile_cubit.dart'
    as _i124;
import 'package:jobspot/src/presentations/edit_company_profile/data/repositories/edit_company_profile_repository_impl.dart'
    as _i22;
import 'package:jobspot/src/presentations/edit_company_profile/domain/repositories/edit_company_profile_repository.dart'
    as _i21;
import 'package:jobspot/src/presentations/edit_company_profile/domain/use_cases/update_company_info_use_case.dart'
    as _i77;
import 'package:jobspot/src/presentations/follow/cubit/follow_cubit.dart'
    as _i128;
import 'package:jobspot/src/presentations/follow/data/repositories/follow_repository_impl.dart'
    as _i28;
import 'package:jobspot/src/presentations/follow/domain/repositories/follow_repository.dart'
    as _i27;
import 'package:jobspot/src/presentations/follow/domain/use_cases/get_list_follow_use_case.dart'
    as _i29;
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart'
    as _i142;
import 'package:jobspot/src/presentations/home_admin/data/repositories/home_admin_repository_impl.dart'
    as _i34;
import 'package:jobspot/src/presentations/home_admin/domain/repositories/home_admin_repository.dart'
    as _i33;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/consider_company_use_case.dart'
    as _i114;
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/get_list_company_pending_use_case.dart'
    as _i134;
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart'
    as _i143;
import 'package:jobspot/src/presentations/home_applicant/data/repositories/home_applicant_repository_impl.dart'
    as _i36;
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart'
    as _i35;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/fetch_job_use_case.dart'
    as _i126;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/get_list_company_use_case.dart'
    as _i135;
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart'
    as _i52;
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart'
    as _i144;
import 'package:jobspot/src/presentations/home_company/data/repositories/home_company_repository_impl.dart'
    as _i38;
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart'
    as _i37;
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart'
    as _i136;
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart'
    as _i145;
import 'package:jobspot/src/presentations/job_position/data/repositories/job_position_repository_impl.dart'
    as _i40;
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart'
    as _i39;
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart'
    as _i53;
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart' as _i146;
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart'
    as _i147;
import 'package:jobspot/src/presentations/notification/data/repositories/notification_repository_impl.dart'
    as _i45;
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart'
    as _i44;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart'
    as _i120;
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart'
    as _i121;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart'
    as _i46;
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart'
    as _i47;
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart'
    as _i56;
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart'
    as _i69;
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart'
    as _i87;
import 'package:jobspot/src/presentations/register_google/cubit/register_google_cubit.dart'
    as _i150;
import 'package:jobspot/src/presentations/register_google/data/repositories/register_google_repository_impl.dart'
    as _i49;
import 'package:jobspot/src/presentations/register_google/domain/repositories/register_google_repository.dart'
    as _i48;
import 'package:jobspot/src/presentations/register_google/domain/use_cases/update_info_user_use_case.dart'
    as _i80;
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart'
    as _i193;
import 'package:jobspot/src/presentations/save_job/data/repositories/save_job_repository_impl.dart'
    as _i153;
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart'
    as _i152;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart'
    as _i183;
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart'
    as _i191;
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart'
    as _i194;
import 'package:jobspot/src/presentations/search_job/data/repositories/search_job_repository_impl.dart'
    as _i155;
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart'
    as _i154;
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart'
    as _i156;
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart'
    as _i157;
import 'package:jobspot/src/presentations/search_language/data/repositories/search_language_repository_impl.dart'
    as _i55;
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart'
    as _i54;
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart'
    as _i130;
import 'package:jobspot/src/presentations/setting/cubit/setting_cubit.dart'
    as _i158;
import 'package:jobspot/src/presentations/setting/data/repositories/setting_repository_impl.dart'
    as _i58;
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart'
    as _i57;
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart'
    as _i116;
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart'
    as _i196;
import 'package:jobspot/src/presentations/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i61;
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart'
    as _i60;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart'
    as _i160;
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart'
    as _i161;
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart'
    as _i162;
import 'package:jobspot/src/presentations/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i63;
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart'
    as _i62;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart'
    as _i148;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart'
    as _i149;
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart'
    as _i151;
import 'package:jobspot/src/presentations/test_iq/cubit/test_iq_cubit.dart'
    as _i164;
import 'package:jobspot/src/presentations/test_iq/data/repositories/test_iq_repository_impl.dart'
    as _i74;
import 'package:jobspot/src/presentations/test_iq/domain/repositories/test_iq_repository.dart'
    as _i73;
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/add_result_test_iq_use_case.dart'
    as _i106;
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/get_list_question_use_case.dart'
    as _i137;
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart'
    as _i165;
import 'package:jobspot/src/presentations/update_password/data/repositories/update_password_repository_impl.dart'
    as _i84;
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart'
    as _i83;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart'
    as _i111;
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart'
    as _i89;
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart'
    as _i167;
import 'package:jobspot/src/presentations/verify_business/data/repositories/verify_business_repository_impl.dart'
    as _i91;
import 'package:jobspot/src/presentations/verify_business/domain/repositories/verify_business_repository.dart'
    as _i90;
import 'package:jobspot/src/presentations/verify_business/domain/use_cases/upload_file_verify_business_use_case.dart'
    as _i166;
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart'
    as _i198;
import 'package:jobspot/src/presentations/view_applicant_profile/data/repositories/view_applicant_profile_repository_impl.dart'
    as _i93;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart'
    as _i92;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_appreciation_use_case.dart'
    as _i129;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_education_use_case.dart'
    as _i131;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_language_use_case.dart'
    as _i132;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart'
    as _i139;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_user_info_use_case.dart'
    as _i140;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_work_experience_use_case.dart'
    as _i141;
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart'
    as _i199;
import 'package:jobspot/src/presentations/view_company_profile/data/repositories/view_company_profile_repository_impl.dart'
    as _i169;
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart'
    as _i168;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/follow_user_use_case.dart'
    as _i188;
import 'package:jobspot/src/presentations/view_company_profile/domain/use_cases/get_list_job_use_case.dart'
    as _i189;
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart'
    as _i171;
import 'package:jobspot/src/presentations/view_job/data/repositories/view_job_repository_impl.dart'
    as _i97;
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart'
    as _i96;
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart'
    as _i125;
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart'
    as _i170;
import 'package:jobspot/src/presentations/view_job_applicant/data/repositories/view_job_applicant_repository_impl.dart'
    as _i95;
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart'
    as _i94;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart'
    as _i115;
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart'
    as _i133;
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart'
    as _i172;
import 'package:jobspot/src/presentations/view_language/data/repositories/view_language_repository_impl.dart'
    as _i99;
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart'
    as _i98;
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart'
    as _i163;
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart'
    as _i200;
import 'package:jobspot/src/presentations/view_post/data/repositories/view_post_repository_impl.dart'
    as _i174;
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart'
    as _i173;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart'
    as _i184;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart'
    as _i185;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart'
    as _i186;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart'
    as _i187;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart'
    as _i190;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart'
    as _i192;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart'
    as _i195;
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart'
    as _i197;
import 'package:jobspot/src/presentations/view_test_iq/cubit/view_test_iq_cubit.dart'
    as _i175;
import 'package:shared_preferences/shared_preferences.dart' as _i59;

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
    gh.lazySingleton<_i16.DeleteAppreciationUseCase>(() =>
        _i16.DeleteAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i17.DeleteJobUseCase>(
        () => _i17.DeleteJobUseCase(gh<_i14.CompanyProfileRepository>()));
    gh.lazySingleton<_i18.DeletePostUseCase>(
        () => _i18.DeletePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i19.EditApplicantProfileRepository>(
        () => _i20.EditApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i21.EditCompanyProfileRepository>(
        () => _i22.EditCompanyProfileRepositoryImpl());
    gh.lazySingleton<_i23.EducationRepository>(
        () => _i24.EducationRepositoryImpl());
    gh.lazySingleton<_i25.ExperienceRepository>(
        () => _i26.ExperienceRepositoryImpl());
    gh.lazySingleton<_i27.FollowRepository>(() => _i28.FollowRepositoryImpl());
    gh.lazySingleton<_i29.GetListFollowUseCase>(
        () => _i29.GetListFollowUseCase(gh<_i27.FollowRepository>()));
    gh.lazySingleton<_i30.GetListSharePostUseCase>(() =>
        _i30.GetListSharePostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i31.GetListUserUseCase>(
        () => _i31.GetListUserUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i32.GetSkillUseCase>(
        () => _i32.GetSkillUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i33.HomeAdminRepository>(
        () => _i34.HomeAdminRepositoryImpl());
    gh.lazySingleton<_i35.HomeApplicantRepository>(
        () => _i36.HomeApplicantRepositoryImpl());
    gh.lazySingleton<_i37.HomeCompanyRepository>(
        () => _i38.HomeCompanyRepositoryImpl());
    gh.lazySingleton<_i39.JobPositionRepository>(
        () => _i40.JobPositionRepositoryImpl());
    gh.lazySingleton<_i41.LanguageRepository>(
        () => _i42.LanguageRepositoryImpl());
    gh.lazySingleton<_i43.NetworkService>(() => _i43.NetworkService());
    gh.lazySingleton<_i44.NotificationRepository>(
        () => _i45.NotificationRepositoryImpl(gh<_i31.GetListUserUseCase>()));
    gh.lazySingleton<_i46.ReadAllNotificationUseCase>(() =>
        _i46.ReadAllNotificationUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i47.ReadNotificationUseCase>(
        () => _i47.ReadNotificationUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i48.RegisterGoogleRepository>(
        () => _i49.RegisterGoogleRepositoryImpl());
    gh.lazySingleton<_i50.ResumeRepository>(() => _i51.ResumeRepositoryImpl());
    gh.lazySingleton<_i52.SaveJobUseCase>(
        () => _i52.SaveJobUseCase(gh<_i35.HomeApplicantRepository>()));
    gh.factory<_i53.SearchJobPositionUseCase>(
        () => _i53.SearchJobPositionUseCase(gh<_i39.JobPositionRepository>()));
    gh.lazySingleton<_i54.SearchLanguageRepository>(
        () => _i55.SearchLanguageRepositoryImpl());
    gh.lazySingleton<_i56.SendNotificationUseCase>(
        () => _i56.SendNotificationUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i57.SettingRepository>(
        () => _i58.SettingRepositoryImpl());
    await gh.lazySingletonAsync<_i59.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i60.SignInRepository>(() => _i61.LoginRepositoryImpl());
    gh.lazySingleton<_i62.SignUpRepository>(() => _i63.SignUpRepositoryImpl());
    gh.lazySingleton<_i64.SkillRepository>(() => _i65.SkillRepositoryImpl());
    gh.lazySingleton<_i66.StreamAppreciationUseCase>(() =>
        _i66.StreamAppreciationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.factory<_i67.StreamEducationUseCase>(() =>
        _i67.StreamEducationUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i68.StreamListPostUseCase>(() =>
        _i68.StreamListPostUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i69.StreamNotificationUseCase>(() =>
        _i69.StreamNotificationUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i70.StreamResumeUseCase>(
        () => _i70.StreamResumeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i71.StreamUserInfoUseCase>(() =>
        _i71.StreamUserInfoUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i72.StreamWorkExperienceUseCase>(() =>
        _i72.StreamWorkExperienceUseCase(
            gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i73.TestIQRepository>(() => _i74.TestIQRepositoryImpl());
    gh.lazySingleton<_i75.UpdateAboutMeUseCase>(
        () => _i75.UpdateAboutMeUseCase(gh<_i10.ApplicantProfileRepository>()));
    gh.lazySingleton<_i76.UpdateAppreciationUseCase>(() =>
        _i76.UpdateAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i77.UpdateCompanyInfoUseCase>(() =>
        _i77.UpdateCompanyInfoUseCase(gh<_i21.EditCompanyProfileRepository>()));
    gh.lazySingleton<_i78.UpdateEducationUseCase>(
        () => _i78.UpdateEducationUseCase(gh<_i23.EducationRepository>()));
    gh.lazySingleton<_i79.UpdateExperienceUseCase>(
        () => _i79.UpdateExperienceUseCase(gh<_i25.ExperienceRepository>()));
    gh.lazySingleton<_i80.UpdateInfoUserUseCase>(
        () => _i80.UpdateInfoUserUseCase(gh<_i48.RegisterGoogleRepository>()));
    gh.factory<_i81.UpdateJobUseCase>(
        () => _i81.UpdateJobUseCase(gh<_i3.AddJobRepository>()));
    gh.lazySingleton<_i82.UpdateLanguageUseCase>(
        () => _i82.UpdateLanguageUseCase(gh<_i41.LanguageRepository>()));
    gh.lazySingleton<_i83.UpdatePasswordRepository>(
        () => _i84.UpdatePasswordRepositoryImpl());
    gh.lazySingleton<_i85.UpdatePostUseCase>(
        () => _i85.UpdatePostUseCase(gh<_i6.AddPostRepository>()));
    gh.factory<_i86.UpdateSkillUseCase>(
        () => _i86.UpdateSkillUseCase(gh<_i64.SkillRepository>()));
    gh.lazySingleton<_i87.UpdateTokenUseCase>(
        () => _i87.UpdateTokenUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i88.UpdateUserInfoUseCase>(() =>
        _i88.UpdateUserInfoUseCase(gh<_i19.EditApplicantProfileRepository>()));
    gh.lazySingleton<_i89.ValidatePassworkUseCase>(() =>
        _i89.ValidatePassworkUseCase(gh<_i83.UpdatePasswordRepository>()));
    gh.lazySingleton<_i90.VerifyBusinessRepository>(
        () => _i91.VerifyBusinessRepositoryImpl());
    gh.lazySingleton<_i92.ViewApplicantProfileRepository>(
        () => _i93.ViewApplicantProfileRepositoryImpl());
    gh.lazySingleton<_i94.ViewJobApplicantRepository>(
        () => _i95.ViewJobApplicantRepositoryImpl(
              gh<_i56.SendNotificationUseCase>(),
              gh<_i31.GetListUserUseCase>(),
            ));
    gh.lazySingleton<_i96.ViewJobRepository>(
        () => _i97.ViewJobRepositoryImpl());
    gh.lazySingleton<_i98.ViewLanguageRepository>(
        () => _i99.ViewLanguageRepositoryImpl());
    gh.lazySingleton<_i100.AddAppreciationUseCase>(
        () => _i100.AddAppreciationUseCase(gh<_i12.AppreciationRepository>()));
    gh.lazySingleton<_i101.AddEducationUseCase>(
        () => _i101.AddEducationUseCase(gh<_i23.EducationRepository>()));
    gh.lazySingleton<_i102.AddExperienceUseCase>(
        () => _i102.AddExperienceUseCase(gh<_i25.ExperienceRepository>()));
    gh.factory<_i103.AddJobCubit>(() => _i103.AddJobCubit(
          gh<_i5.AddJobUseCase>(),
          gh<_i81.UpdateJobUseCase>(),
        ));
    gh.lazySingleton<_i104.AddLanguageUseCase>(
        () => _i104.AddLanguageUseCase(gh<_i41.LanguageRepository>()));
    gh.factory<_i105.AddPostCubit>(() => _i105.AddPostCubit(
          gh<_i8.AddPostUseCase>(),
          gh<_i85.UpdatePostUseCase>(),
        ));
    gh.lazySingleton<_i106.AddResultTestIQUseCase>(
        () => _i106.AddResultTestIQUseCase(gh<_i73.TestIQRepository>()));
    gh.lazySingleton<_i107.AddResumeUseCase>(
        () => _i107.AddResumeUseCase(gh<_i50.ResumeRepository>()));
    gh.lazySingleton<_i108.ApplyJobRepository>(
        () => _i109.ApplyJobRepositoryImpl(
              gh<_i56.SendNotificationUseCase>(),
              gh<_i107.AddResumeUseCase>(),
            ));
    gh.lazySingleton<_i110.ApplyJobUseCase>(
        () => _i110.ApplyJobUseCase(gh<_i108.ApplyJobRepository>()));
    gh.lazySingleton<_i111.ChangePasswordUseCase>(
        () => _i111.ChangePasswordUseCase(gh<_i83.UpdatePasswordRepository>()));
    gh.lazySingleton<_i112.ConnectionRepository>(
        () => _i113.ConnectionRepositoryImpl(
              gh<_i56.SendNotificationUseCase>(),
              gh<_i31.GetListUserUseCase>(),
              gh<_i30.GetListSharePostUseCase>(),
            ));
    gh.lazySingleton<_i114.ConsiderCompanyUseCase>(
        () => _i114.ConsiderCompanyUseCase(gh<_i33.HomeAdminRepository>()));
    gh.lazySingleton<_i115.ConsiderResumeUseCase>(() =>
        _i115.ConsiderResumeUseCase(gh<_i94.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i116.DeleteAccountUseCase>(
        () => _i116.DeleteAccountUseCase(gh<_i57.SettingRepository>()));
    gh.lazySingleton<_i117.DeleteEducationUseCase>(
        () => _i117.DeleteEducationUseCase(gh<_i23.EducationRepository>()));
    gh.lazySingleton<_i118.DeleteExperienceUseCase>(
        () => _i118.DeleteExperienceUseCase(gh<_i25.ExperienceRepository>()));
    gh.lazySingleton<_i119.DeleteLanguageUseCase>(
        () => _i119.DeleteLanguageUseCase(gh<_i41.LanguageRepository>()));
    gh.lazySingleton<_i120.DeleteNotificationFromIDUseCase>(() =>
        _i120.DeleteNotificationFromIDUseCase(
            gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i121.DeleteNotificationUseCase>(() =>
        _i121.DeleteNotificationUseCase(gh<_i44.NotificationRepository>()));
    gh.lazySingleton<_i122.DeleteResumeUseCase>(
        () => _i122.DeleteResumeUseCase(gh<_i50.ResumeRepository>()));
    gh.factory<_i123.EditApplicantProfileCubit>(() =>
        _i123.EditApplicantProfileCubit(gh<_i88.UpdateUserInfoUseCase>()));
    gh.factory<_i124.EditCompanyProfileCubit>(() =>
        _i124.EditCompanyProfileCubit(gh<_i77.UpdateCompanyInfoUseCase>()));
    gh.lazySingleton<_i125.FetchJobUseCase>(
        () => _i125.FetchJobUseCase(gh<_i96.ViewJobRepository>()));
    gh.lazySingleton<_i126.FetchJobUseCase>(
        () => _i126.FetchJobUseCase(gh<_i35.HomeApplicantRepository>()));
    gh.lazySingleton<_i127.FetchPostUseCase>(
        () => _i127.FetchPostUseCase(gh<_i112.ConnectionRepository>()));
    gh.factory<_i128.FollowCubit>(
        () => _i128.FollowCubit(gh<_i29.GetListFollowUseCase>()));
    gh.lazySingleton<_i129.GetAppreciationUseCase>(() =>
        _i129.GetAppreciationUseCase(
            gh<_i92.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i130.GetCountriesUseCase>(
        () => _i130.GetCountriesUseCase(gh<_i54.SearchLanguageRepository>()));
    gh.factory<_i131.GetEducationUseCase>(() =>
        _i131.GetEducationUseCase(gh<_i92.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i132.GetLanguageUseCase>(() =>
        _i132.GetLanguageUseCase(gh<_i92.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i133.GetListApplicantUseCase>(() =>
        _i133.GetListApplicantUseCase(gh<_i94.ViewJobApplicantRepository>()));
    gh.lazySingleton<_i134.GetListCompanyPendingUseCase>(() =>
        _i134.GetListCompanyPendingUseCase(gh<_i33.HomeAdminRepository>()));
    gh.lazySingleton<_i135.GetListCompanyUseCase>(
        () => _i135.GetListCompanyUseCase(gh<_i35.HomeApplicantRepository>()));
    gh.lazySingleton<_i136.GetListMyJobUseCase>(
        () => _i136.GetListMyJobUseCase(gh<_i37.HomeCompanyRepository>()));
    gh.lazySingleton<_i137.GetListQuestionUseCase>(
        () => _i137.GetListQuestionUseCase(gh<_i73.TestIQRepository>()));
    gh.lazySingleton<_i138.GetListSkillUseCase>(
        () => _i138.GetListSkillUseCase(gh<_i64.SkillRepository>()));
    gh.lazySingleton<_i139.GetResumeUseCase>(() =>
        _i139.GetResumeUseCase(gh<_i92.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i140.GetUserInfoUseCase>(() =>
        _i140.GetUserInfoUseCase(gh<_i92.ViewApplicantProfileRepository>()));
    gh.lazySingleton<_i141.GetWorkExperienceUseCase>(() =>
        _i141.GetWorkExperienceUseCase(
            gh<_i92.ViewApplicantProfileRepository>()));
    gh.factory<_i142.HomeAdminCubit>(() => _i142.HomeAdminCubit(
          gh<_i134.GetListCompanyPendingUseCase>(),
          gh<_i114.ConsiderCompanyUseCase>(),
        ));
    gh.factory<_i143.HomeApplicantCubit>(() => _i143.HomeApplicantCubit(
          gh<_i126.FetchJobUseCase>(),
          gh<_i52.SaveJobUseCase>(),
        ));
    gh.factory<_i144.HomeCompanyCubit>(
        () => _i144.HomeCompanyCubit(gh<_i136.GetListMyJobUseCase>()));
    gh.factory<_i145.JobPositionCubit>(
        () => _i145.JobPositionCubit(gh<_i53.SearchJobPositionUseCase>()));
    gh.factory<_i146.MainCubit>(
        () => _i146.MainCubit(gh<_i87.UpdateTokenUseCase>()));
    gh.factory<_i147.NotificationCubit>(() => _i147.NotificationCubit(
          gh<_i69.StreamNotificationUseCase>(),
          gh<_i47.ReadNotificationUseCase>(),
          gh<_i46.ReadAllNotificationUseCase>(),
          gh<_i120.DeleteNotificationFromIDUseCase>(),
        ));
    gh.lazySingleton<_i148.RegisterApplicantUseCase>(
        () => _i148.RegisterApplicantUseCase(gh<_i62.SignUpRepository>()));
    gh.lazySingleton<_i149.RegisterBusinessUseCase>(
        () => _i149.RegisterBusinessUseCase(gh<_i62.SignUpRepository>()));
    gh.factory<_i150.RegisterGoogleCubit>(
        () => _i150.RegisterGoogleCubit(gh<_i80.UpdateInfoUserUseCase>()));
    gh.lazySingleton<_i151.RegisterGoogleUseCase>(
        () => _i151.RegisterGoogleUseCase(gh<_i62.SignUpRepository>()));
    gh.lazySingleton<_i152.SaveJobRepository>(
        () => _i153.SaveJobRepositoryImpl(gh<_i135.GetListCompanyUseCase>()));
    gh.lazySingleton<_i154.SearchJobRepository>(
        () => _i155.SearchJobRepositoryImpl(gh<_i135.GetListCompanyUseCase>()));
    gh.lazySingleton<_i156.SearchJobUseCase>(
        () => _i156.SearchJobUseCase(gh<_i154.SearchJobRepository>()));
    gh.factory<_i157.SearchLanguageCubit>(
        () => _i157.SearchLanguageCubit(gh<_i130.GetCountriesUseCase>()));
    gh.factory<_i158.SettingCubit>(() => _i158.SettingCubit(
          gh<_i116.DeleteAccountUseCase>(),
          gh<_i87.UpdateTokenUseCase>(),
        ));
    gh.lazySingleton<_i159.SharePostUseCase>(
        () => _i159.SharePostUseCase(gh<_i112.ConnectionRepository>()));
    gh.lazySingleton<_i160.SignInEmailPasswordUseCase>(
        () => _i160.SignInEmailPasswordUseCase(gh<_i60.SignInRepository>()));
    gh.lazySingleton<_i161.SignInGoogleUseCase>(
        () => _i161.SignInGoogleUseCase(gh<_i60.SignInRepository>()));
    gh.factory<_i162.SignUpCubit>(() => _i162.SignUpCubit(
          gh<_i148.RegisterApplicantUseCase>(),
          gh<_i149.RegisterBusinessUseCase>(),
          gh<_i151.RegisterGoogleUseCase>(),
        ));
    gh.lazySingleton<_i163.StreamLanguagesUseCase>(
        () => _i163.StreamLanguagesUseCase(gh<_i98.ViewLanguageRepository>()));
    gh.factory<_i164.TestIQCubit>(() => _i164.TestIQCubit(
          gh<_i137.GetListQuestionUseCase>(),
          gh<_i106.AddResultTestIQUseCase>(),
        ));
    gh.factory<_i165.UpdatePasswordCubit>(() => _i165.UpdatePasswordCubit(
          gh<_i111.ChangePasswordUseCase>(),
          gh<_i89.ValidatePassworkUseCase>(),
        ));
    gh.lazySingleton<_i166.UploadFileVerifyBusinessUseCase>(() =>
        _i166.UploadFileVerifyBusinessUseCase(
            gh<_i90.VerifyBusinessRepository>()));
    gh.factory<_i167.VerifyBusinessCubit>(() =>
        _i167.VerifyBusinessCubit(gh<_i166.UploadFileVerifyBusinessUseCase>()));
    gh.lazySingleton<_i168.ViewCompanyProfileRepository>(
        () => _i169.ViewCompanyProfileRepositoryImpl(
              gh<_i121.DeleteNotificationUseCase>(),
              gh<_i56.SendNotificationUseCase>(),
            ));
    gh.factory<_i170.ViewJobApplicantCubit>(() => _i170.ViewJobApplicantCubit(
          gh<_i133.GetListApplicantUseCase>(),
          gh<_i115.ConsiderResumeUseCase>(),
        ));
    gh.factory<_i171.ViewJobCubit>(() => _i171.ViewJobCubit(
          gh<_i125.FetchJobUseCase>(),
          gh<_i52.SaveJobUseCase>(),
        ));
    gh.factory<_i172.ViewLanguageCubit>(() => _i172.ViewLanguageCubit(
          gh<_i163.StreamLanguagesUseCase>(),
          gh<_i119.DeleteLanguageUseCase>(),
        ));
    gh.lazySingleton<_i173.ViewPostRepository>(
        () => _i174.ViewPostRepositoryImpl(
              gh<_i56.SendNotificationUseCase>(),
              gh<_i121.DeleteNotificationUseCase>(),
              gh<_i31.GetListUserUseCase>(),
            ));
    gh.factory<_i175.ViewTestIQCubit>(
        () => _i175.ViewTestIQCubit(gh<_i137.GetListQuestionUseCase>()));
    gh.factory<_i176.AddAppreciationCubit>(() => _i176.AddAppreciationCubit(
          gh<_i100.AddAppreciationUseCase>(),
          gh<_i76.UpdateAppreciationUseCase>(),
          gh<_i16.DeleteAppreciationUseCase>(),
        ));
    gh.factory<_i177.AddEducationCubit>(() => _i177.AddEducationCubit(
          gh<_i101.AddEducationUseCase>(),
          gh<_i117.DeleteEducationUseCase>(),
          gh<_i78.UpdateEducationUseCase>(),
        ));
    gh.factory<_i178.AddLanguageCubit>(() => _i178.AddLanguageCubit(
          gh<_i104.AddLanguageUseCase>(),
          gh<_i82.UpdateLanguageUseCase>(),
        ));
    gh.factory<_i179.AddResumeCubit>(
        () => _i179.AddResumeCubit(gh<_i107.AddResumeUseCase>()));
    gh.factory<_i180.AddSkillCubit>(() => _i180.AddSkillCubit(
          gh<_i138.GetListSkillUseCase>(),
          gh<_i86.UpdateSkillUseCase>(),
        ));
    gh.factory<_i181.AddWorkExperienceCubit>(() => _i181.AddWorkExperienceCubit(
          gh<_i102.AddExperienceUseCase>(),
          gh<_i79.UpdateExperienceUseCase>(),
          gh<_i118.DeleteExperienceUseCase>(),
        ));
    gh.factory<_i182.ApplyJobCubit>(() => _i182.ApplyJobCubit(
          gh<_i110.ApplyJobUseCase>(),
          gh<_i139.GetResumeUseCase>(),
        ));
    gh.lazySingleton<_i183.DeleteAllSaveJobUseCase>(
        () => _i183.DeleteAllSaveJobUseCase(gh<_i152.SaveJobRepository>()));
    gh.lazySingleton<_i184.DeleteCommentUseCase>(
        () => _i184.DeleteCommentUseCase(gh<_i173.ViewPostRepository>()));
    gh.lazySingleton<_i185.FavouriteCommentUseCase>(
        () => _i185.FavouriteCommentUseCase(gh<_i173.ViewPostRepository>()));
    gh.lazySingleton<_i186.FavouritePostUseCase>(
        () => _i186.FavouritePostUseCase(gh<_i173.ViewPostRepository>()));
    gh.lazySingleton<_i187.FetchDataCommentFirstLevelUseCase>(() =>
        _i187.FetchDataCommentFirstLevelUseCase(
            gh<_i173.ViewPostRepository>()));
    gh.lazySingleton<_i188.FollowUserUseCase>(() =>
        _i188.FollowUserUseCase(gh<_i168.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i189.GetListJobUseCase>(() =>
        _i189.GetListJobUseCase(gh<_i168.ViewCompanyProfileRepository>()));
    gh.lazySingleton<_i190.GetReplyCommentUseCase>(
        () => _i190.GetReplyCommentUseCase(gh<_i173.ViewPostRepository>()));
    gh.lazySingleton<_i191.ListenSaveJobUseCase>(
        () => _i191.ListenSaveJobUseCase(gh<_i152.SaveJobRepository>()));
    gh.lazySingleton<_i192.ReplyCommentUseCase>(
        () => _i192.ReplyCommentUseCase(gh<_i173.ViewPostRepository>()));
    gh.factory<_i193.SaveJobCubit>(() => _i193.SaveJobCubit(
          gh<_i191.ListenSaveJobUseCase>(),
          gh<_i183.DeleteAllSaveJobUseCase>(),
          gh<_i52.SaveJobUseCase>(),
        ));
    gh.factory<_i194.SearchJobCubit>(() => _i194.SearchJobCubit(
          gh<_i156.SearchJobUseCase>(),
          gh<_i52.SaveJobUseCase>(),
        ));
    gh.lazySingleton<_i195.SendCommentUseCase>(
        () => _i195.SendCommentUseCase(gh<_i173.ViewPostRepository>()));
    gh.factory<_i196.SignInCubit>(() => _i196.SignInCubit(
          gh<_i160.SignInEmailPasswordUseCase>(),
          gh<_i161.SignInGoogleUseCase>(),
        ));
    gh.lazySingleton<_i197.SyncPostDataUseCase>(
        () => _i197.SyncPostDataUseCase(gh<_i173.ViewPostRepository>()));
    gh.factory<_i198.ViewApplicantProfileCubit>(
        () => _i198.ViewApplicantProfileCubit(
              gh<_i129.GetAppreciationUseCase>(),
              gh<_i131.GetEducationUseCase>(),
              gh<_i132.GetLanguageUseCase>(),
              gh<_i139.GetResumeUseCase>(),
              gh<_i32.GetSkillUseCase>(),
              gh<_i140.GetUserInfoUseCase>(),
              gh<_i141.GetWorkExperienceUseCase>(),
              gh<_i68.StreamListPostUseCase>(),
              gh<_i186.FavouritePostUseCase>(),
              gh<_i159.SharePostUseCase>(),
            ));
    gh.factory<_i199.ViewCompanyProfileCubit>(
        () => _i199.ViewCompanyProfileCubit(
              gh<_i189.GetListJobUseCase>(),
              gh<_i68.StreamListPostUseCase>(),
              gh<_i140.GetUserInfoUseCase>(),
              gh<_i186.FavouritePostUseCase>(),
              gh<_i188.FollowUserUseCase>(),
              gh<_i159.SharePostUseCase>(),
              gh<_i52.SaveJobUseCase>(),
            ));
    gh.factory<_i200.ViewPostBloc>(() => _i200.ViewPostBloc(
          gh<_i187.FetchDataCommentFirstLevelUseCase>(),
          gh<_i185.FavouriteCommentUseCase>(),
          gh<_i186.FavouritePostUseCase>(),
          gh<_i195.SendCommentUseCase>(),
          gh<_i197.SyncPostDataUseCase>(),
          gh<_i192.ReplyCommentUseCase>(),
          gh<_i190.GetReplyCommentUseCase>(),
          gh<_i184.DeleteCommentUseCase>(),
          gh<_i159.SharePostUseCase>(),
          gh<_i18.DeletePostUseCase>(),
        ));
    gh.factory<_i201.ApplicantProfileCubit>(() => _i201.ApplicantProfileCubit(
          gh<_i18.DeletePostUseCase>(),
          gh<_i122.DeleteResumeUseCase>(),
          gh<_i68.StreamListPostUseCase>(),
          gh<_i72.StreamWorkExperienceUseCase>(),
          gh<_i67.StreamEducationUseCase>(),
          gh<_i66.StreamAppreciationUseCase>(),
          gh<_i70.StreamResumeUseCase>(),
          gh<_i32.GetSkillUseCase>(),
          gh<_i71.StreamUserInfoUseCase>(),
          gh<_i163.StreamLanguagesUseCase>(),
          gh<_i75.UpdateAboutMeUseCase>(),
          gh<_i186.FavouritePostUseCase>(),
          gh<_i159.SharePostUseCase>(),
        ));
    gh.factory<_i202.CompanyProfileCubit>(() => _i202.CompanyProfileCubit(
          gh<_i186.FavouritePostUseCase>(),
          gh<_i71.StreamUserInfoUseCase>(),
          gh<_i68.StreamListPostUseCase>(),
          gh<_i189.GetListJobUseCase>(),
          gh<_i18.DeletePostUseCase>(),
          gh<_i17.DeleteJobUseCase>(),
          gh<_i159.SharePostUseCase>(),
          gh<_i52.SaveJobUseCase>(),
        ));
    gh.factory<_i203.ConnectionCubit>(() => _i203.ConnectionCubit(
          gh<_i127.FetchPostUseCase>(),
          gh<_i186.FavouritePostUseCase>(),
          gh<_i159.SharePostUseCase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i204.InjectionModule {}
