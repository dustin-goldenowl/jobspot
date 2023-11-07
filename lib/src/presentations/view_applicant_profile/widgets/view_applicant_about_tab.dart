import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/router/applicant_profile_coordinator.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_item.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_subitem.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/router/view_applicant_profile_coordinator.dart';

@RoutePage()
class ViewApplicantAboutTab extends StatelessWidget {
  const ViewApplicantAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          children: [
            _buildAboutMe(),
            const SizedBox(height: 10),
            _buildWorkExperience(),
            const SizedBox(height: 10),
            _buildEducation(),
            const SizedBox(height: 10),
            _buildListSkill(),
            const SizedBox(height: 10),
            _buildListLanguage(),
            const SizedBox(height: 10),
            _buildListAppreciation(),
            const SizedBox(height: 10),
            _buildListResume(),
          ],
        ),
      ),
    );
  }

  Widget _buildListResume() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listResume != current.listResume,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.resume,
          title: AppLocal.text.applicant_profile_page_resume,
          child: state.listResume != null && state.listResume!.isEmpty
              ? _noData
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (state.listResume != null) {
                      return _buildItemResume(resume: state.listResume![index]);
                    }
                    return _itemLoading;
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemCount: state.listResume?.length ?? 5,
                ),
        );
      },
    );
  }

  Widget _buildListAppreciation() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listAppreciation != current.listAppreciation,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.archive,
          title: AppLocal.text.applicant_profile_page_appreciation,
          child:
              state.listAppreciation != null && state.listAppreciation!.isEmpty
                  ? _noData
                  : ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (state.listAppreciation != null) {
                          final item = state.listAppreciation![index];
                          return ProfileSubItem(
                            title: item.awardName,
                            subtitle: item.achievement,
                            time: DateTimeUtils.formatMonthYear(item.endDate),
                          );
                        }
                        return _itemLoading;
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 15),
                      itemCount: state.listAppreciation?.length ?? 5,
                    ),
        );
      },
    );
  }

  Widget _buildListLanguage() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listLanguage != current.listLanguage,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.language,
          title: AppLocal.text.applicant_profile_page_language,
          child: state.listLanguage == null
              ? _buildListLoading()
              : state.listLanguage != null && state.listLanguage!.isNotEmpty
                  ? Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: state.listLanguage!
                          .map((e) => _buildItem(e.name))
                          .toList(),
                    )
                  : _noData,
        );
      },
    );
  }

  Widget _buildListSkill() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) => previous.listSkill != current.listSkill,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.skill,
          title: AppLocal.text.applicant_profile_page_skill,
          child: state.listSkill == null
              ? _buildListLoading()
              : state.listSkill != null && state.listSkill!.isNotEmpty
                  ? Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: state.listSkill!
                          .map((e) => _buildItem(e.title))
                          .toList(),
                    )
                  : _noData,
        );
      },
    );
  }

  Widget _buildEducation() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listEducation != current.listEducation,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.graduationCap,
          title: AppLocal.text.applicant_profile_page_education,
          child: state.listEducation != null && state.listEducation!.isEmpty
              ? _noData
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (state.listEducation != null) {
                      final item = state.listEducation![index];
                      return ProfileSubItem(
                        title: item.fieldStudy,
                        subtitle: item.institutionName,
                        time: DateTimeUtils.fromDateToDate(
                          item.startDate,
                          item.isEduNow ? null : item.endDate,
                        ),
                        onEdit: () =>
                            ApplicantProfileCoordinator.showAddEducation(
                                education: item),
                      );
                    }
                    return _itemLoading;
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemCount: state.listEducation?.length ?? 5,
                ),
        );
      },
    );
  }

  Widget _buildWorkExperience() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listExperience != current.listExperience,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.bag,
          title: AppLocal.text.applicant_profile_page_work_experience,
          child: state.listExperience != null && state.listExperience!.isEmpty
              ? _noData
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (state.listExperience != null) {
                      final item = state.listExperience![index];
                      return ProfileSubItem(
                        title: item.jobTitle,
                        subtitle: item.companyName,
                        time: DateTimeUtils.fromDateToDate(
                          item.startDate,
                          item.isWorkNow ? null : item.endDate,
                        ),
                        onEdit: () =>
                            ApplicantProfileCoordinator.showAddWorkExperience(
                                experience: item),
                      );
                    }
                    return _itemLoading;
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemCount: state.listExperience?.length ?? 5,
                ),
        );
      },
    );
  }

  Widget _buildAboutMe() {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.circleProfile,
          title: AppLocal.text.applicant_profile_page_about_me,
          child: state.user == null
              ? _buildListLoading()
              : Text(
                  state.user!.description.isEmpty
                      ? AppLocal.text.view_applicant_profile_page_no_description
                      : state.user!.description,
                  style: AppStyles.normalTextMulledWine,
                ),
        );
      },
    );
  }

  Widget _buildItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.ghost.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: AppStyles.normalTextMulledWine),
    );
  }

  Widget _buildItemResume({required ResumeEntity resume}) {
    return GestureDetector(
      onTap: () => ViewApplicantProfileCoordinator.viewPDF(
          url: resume.filePath, title: resume.fileName),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.pdf),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resume.fileName,
                  maxLines: 1,
                  style: AppStyles.normalTextHaiti,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  "${resume.size.getFileSizeString()} . ${DateTimeUtils.formatCVTime(resume.createAt)}",
                  maxLines: 1,
                  style: TextStyle(color: AppColors.romanSilver),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _itemLoading =>
      const ItemLoading(width: double.infinity, height: 16, radius: 5);

  Widget _buildListLoading() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _itemLoading,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemCount: 5,
    );
  }

  Widget get _noData => Text(
        AppLocal.text.view_applicant_profile_page_no_data,
        style: AppStyles.normalTextMulledWine,
      );
}
