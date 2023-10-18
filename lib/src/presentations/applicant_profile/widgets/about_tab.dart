import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/router/applicant_profile_coordinator.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_item.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_subitem.dart';

//TODO hard code to test
List<String> skill = [
  "Leadership",
  "Teamwork",
  "Visioner",
  "Target oriented",
  "Consistent",
  "Leadership",
  "Teamwork",
  "Visioner",
  "Target oriented",
  "Consistent",
];

@RoutePage()
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

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
    return ProfileItem(
      icon: AppImages.resume,
      title: AppLocal.text.applicant_profile_page_resume,
      onAdd: () {},
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildItemResume();
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: 2,
      ),
    );
  }

  Widget _buildListAppreciation() {
    return BlocBuilder<ApplicantProfileCubit, ApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listAppreciation != current.listAppreciation,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.archive,
          title: AppLocal.text.applicant_profile_page_appreciation,
          onAdd: ApplicantProfileCoordinator.showAddAppreciation,
          child:
              state.listAppreciation != null && state.listAppreciation!.isEmpty
                  ? null
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
                            onEdit: () =>
                                ApplicantProfileCoordinator.showAddAppreciation(
                                    appreciation: item),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 15),
                      itemCount: state.listAppreciation?.length ?? 10,
                    ),
        );
      },
    );
  }

  Widget _buildListLanguage() {
    return ProfileItem(
      icon: AppImages.language,
      title: AppLocal.text.applicant_profile_page_language,
      onAdd: () {},
      onEdit: () {},
      child: Column(
        children: [
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(
              skill.length,
              (index) => _buildItem(skill[index]),
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Text(AppLocal.text.applicant_profile_page_see_more),
          ),
        ],
      ),
    );
  }

  Widget _buildListSkill() {
    return ProfileItem(
      icon: AppImages.skill,
      title: AppLocal.text.applicant_profile_page_skill,
      onAdd: () {},
      onEdit: () {},
      child: Column(
        children: [
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(
              skill.length,
              (index) => _buildItem(skill[index]),
            ),
          ),
          const SizedBox(height: 15),
          TextButton(
            onPressed: () {},
            child: Text(AppLocal.text.applicant_profile_page_see_more),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation() {
    return BlocBuilder<ApplicantProfileCubit, ApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listEducation != current.listEducation,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.graduationCap,
          title: AppLocal.text.applicant_profile_page_education,
          onAdd: ApplicantProfileCoordinator.showAddEducation,
          child: state.listEducation != null && state.listEducation!.isEmpty
              ? null
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
                    return const CircularProgressIndicator();
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemCount: state.listEducation?.length ?? 10,
                ),
        );
      },
    );
  }

  Widget _buildWorkExperience() {
    return BlocBuilder<ApplicantProfileCubit, ApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.listExperience != current.listExperience,
      builder: (context, state) {
        return ProfileItem(
          icon: AppImages.bag,
          title: AppLocal.text.applicant_profile_page_work_experience,
          onAdd: ApplicantProfileCoordinator.showAddWorkExperience,
          child: state.listExperience != null && state.listExperience!.isEmpty
              ? null
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
                    return const CircularProgressIndicator();
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 15),
                  itemCount: state.listExperience?.length ?? 10,
                ),
        );
      },
    );
  }

  Widget _buildAboutMe() {
    UserModel? user = PrefsUtils.getUserInfo();
    return ProfileItem(
      icon: AppImages.circleProfile,
      title: AppLocal.text.applicant_profile_page_about_me,
      onAdd: () => ApplicantProfileCoordinator.showAddAboutMe(
        title: AppLocal.text.applicant_profile_page_about_me,
        description: "",
        onBack: (value) {},
      ),
      onEdit: user == null || user.description.isEmpty
          ? null
          : () => ApplicantProfileCoordinator.showAddAboutMe(
                title: AppLocal.text.applicant_profile_page_about_me,
                description: user.description,
                onBack: (value) {},
              ),
      child: user == null || user.description.isEmpty
          ? null
          : Text(user.description, style: AppStyles.normalTextMulledWine),
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

  Widget _buildItemResume() {
    return Row(
      children: [
        SvgPicture.asset(AppImages.pdf),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jamet kudasi - CV - UI/UX Designer", //TODO hard code to test
                style: AppStyles.normalTextHaiti,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                "867 Kb . 14 Feb 2022 at 11:30 am", //TODO hard code to test
                style: TextStyle(color: AppColors.romanSilver),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            AppImages.trash,
            colorFilter: const ColorFilter.mode(
              Color(0xFFFC4646),
              BlendMode.srcIn,
            ),
          ),
        )
      ],
    );
  }
}
