import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/view_company_profile/widgets/profile_title_info.dart';

@RoutePage()
class ViewCompanyAboutTab extends StatelessWidget {
  const ViewCompanyAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileTitleInfo(
              title: "About Company",
              isJustify: true,
              content:
                  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \n\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas .",
            ),
            const SizedBox(height: 20),
            ProfileTitleInfo(
              title: "Website",
              content: "https://www.google.com",
              contentColor: AppColors.deepSaffron,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Industry",
              content: "Internet product",
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Employee size",
              content: "132,121 Employees",
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Head office",
              content: "Mountain View, California, Amerika Serikat",
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Type",
              content: "Multinational company",
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Since",
              content: "1998",
            ),
            const SizedBox(height: 20),
            const ProfileTitleInfo(
              title: "Specialization",
              content:
                  "Search technology, Web computing, Software and Online advertising",
            ),
          ],
        ),
      ),
    );
  }
}
