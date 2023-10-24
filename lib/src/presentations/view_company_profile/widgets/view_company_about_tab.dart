import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        if (state.user != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileTitleInfo(
                title: "About Company",
                isJustify: true,
                content: state.user?.description ?? "",
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: "Website",
                content: state.user?.website ?? "",
                contentColor: AppColors.deepSaffron,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              const ProfileTitleInfo(
                title: "Industry",
                content: "Internet product",
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: "Employee size",
                content: "${state.user?.employeeSize} Employees",
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: "Head office",
                content: state.user?.address ?? "",
              ),
              const SizedBox(height: 20),
              const ProfileTitleInfo(
                title: "Type",
                content: "Multinational company",
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: "Since",
                content: state.user?.birthday.year.toString() ?? "",
              ),
              const SizedBox(height: 20),
              const ProfileTitleInfo(
                title: "Specialization",
                content:
                    "Search technology, Web computing, Software and Online advertising",
              ),
            ],
          );
        }
        return _buildLoading();
      },
    );
  }

  Widget _buildLoading() {
    Random random = Random();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemLoading(width: random.nextInt(50) + 70, height: 20, radius: 5),
            const SizedBox(height: 8),
            ...List.generate(
              random.nextInt(3) + 5,
              (index) => const Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: ItemLoading(
                  width: double.infinity,
                  height: 16,
                  radius: 5,
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
