import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
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
            _buildAbout(),
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
    return ProfileItem(
      icon: AppImages.archive,
      title: AppLocal.text.applicant_profile_page_appreciation,
      onAdd: () {},
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          //TODO hard code to test
          return ProfileSubItem(
            title: "Wireless Symposium (RWS)",
            subtitle: "Young Scientist",
            time: "2014",
            onEdit: () {},
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: 2,
      ),
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
    return ProfileItem(
      icon: AppImages.graduationCap,
      title: AppLocal.text.applicant_profile_page_education,
      onAdd: () {},
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          //TODO hard code to test
          return ProfileSubItem(
            title: "Information Technology",
            subtitle: "University of Oxford",
            time: "Sep 2010 - Aug 2013",
            onEdit: () {},
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: 2,
      ),
    );
  }

  Widget _buildWorkExperience() {
    return ProfileItem(
      icon: AppImages.bag,
      title: AppLocal.text.applicant_profile_page_work_experience,
      onAdd: () => ApplicantProfileCoordinator.showAddWorkExperience(
        onSave: (experience) {},
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          //TODO hard code to test
          return ProfileSubItem(
            title: "Manager",
            subtitle: "Amazon Inc",
            time: "Jan 2015 - Feb 2022",
            onEdit: () {},
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: 2,
      ),
    );
  }

  Widget _buildAbout() {
    return ProfileItem(
      icon: AppImages.circleProfile,
      title: AppLocal.text.applicant_profile_page_about_me,
      onAdd: () => ApplicantProfileCoordinator.showAddAboutMe(
        title: AppLocal.text.applicant_profile_page_about_me,
        description: "",
        onBack: (value) {},
      ),
      onEdit: () => ApplicantProfileCoordinator.showAddAboutMe(
        title: AppLocal.text.applicant_profile_page_about_me,
        description: PrefsUtils.getUserInfo()?.description ?? "",
        onBack: (value) {},
      ),
      child: Text(
        PrefsUtils.getUserInfo()?.description ?? "Không có",
        style: AppStyles.normalTextMulledWine,
      ),
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
