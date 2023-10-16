import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_item.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_subitem.dart';

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
      child: Column(
        children: [
          ProfileItem(
            icon: AppImages.circleProfile,
            title: "About me",
            onAdd: () {},
            onEdit: () {},
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lectus id commodo egestas metus interdum dolor.",
              style: TextStyle(
                color: AppColors.mulledWine,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.bag,
            title: "Work experience",
            onAdd: () {},
            onEdit: () {},
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.graduationCap,
            title: "Education",
            onAdd: () {},
            onEdit: () {},
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.skill,
            title: "Skill",
            onAdd: () {},
            onEdit: () {},
            child: Column(
              children: [
                Wrap(
                  // maxLines: 2,
                  runSpacing: 10,
                  spacing: 10,
                  // overflowWidget: const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   child: Text("+5 more"),
                  // ),
                  children: List.generate(
                    skill.length,
                    (index) => _buildItem(skill[index]),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: const Text("See more"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.language,
            title: "Language",
            onAdd: () {},
            onEdit: () {},
            child: Column(
              children: [
                Wrap(
                  // maxLines: 2,
                  runSpacing: 10,
                  spacing: 10,
                  // overflowWidget: const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 10),
                  //   child: Text("+5 more"),
                  // ),
                  children: List.generate(
                    skill.length,
                    (index) => _buildItem(skill[index]),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: const Text("See more"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.archive,
            title: "Appreciation",
            onAdd: () {},
            onEdit: () {},
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
          ),
          const SizedBox(height: 10),
          ProfileItem(
            icon: AppImages.resume,
            title: "Resume",
            onAdd: () {},
            onEdit: () {},
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildItemResume();
              },
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemCount: 2,
            ),
          ),
        ],
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
      child: Text(text, style: TextStyle(color: AppColors.mulledWine)),
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
                "Jamet kudasi - CV - UI/UX Designer",
                style: TextStyle(color: AppColors.haiti),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              const Text(
                "867 Kb . 14 Feb 2022 at 11:30 am",
                style: TextStyle(color: Color(0xFF8983A3)),
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
