import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/show_full_image.dart';
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
                title: AppLocal.text.view_company_profile_page_about_company,
                isJustify: true,
                content: (state.user?.description ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_no_description
                    : state.user!.description,
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_website,
                content: (state.user?.website ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_not_provided
                    : state.user!.website!,
                contentColor: (state.user?.website ?? "").isNotEmpty
                    ? AppColors.deepSaffron
                    : null,
                onTap: () {
                  if ((state.user?.website ?? "").isNotEmpty) {
                    context.read<ViewCompanyProfileCubit>().openWebsite();
                  }
                },
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_industry,
                content: (state.user?.industry ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_not_provided
                    : state.user!.industry!,
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_employee_size,
                content: AppLocal.text.view_company_profile_page_employee(
                    state.user?.employeeSize ?? 0),
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_head_office,
                content: (state.user?.address ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_not_provided
                    : state.user!.address,
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_type,
                content: (state.user?.type ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_not_provided
                    : state.user!.type!,
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_since,
                content: state.user?.birthday.year.toString() ?? "",
              ),
              const SizedBox(height: 20),
              ProfileTitleInfo(
                title: AppLocal.text.view_company_profile_page_specialization,
                content: (state.user?.specialization ?? "").isEmpty
                    ? AppLocal.text.view_company_profile_page_not_provided
                    : state.user!.specialization!,
              ),
              const SizedBox(height: 20),
              if ((state.user?.images?.length ?? 0) > 0)
                _buildCompanyGallery(state.user!.images!)
            ],
          );
        }
        return _buildLoading();
      },
    );
  }

  Widget _buildCompanyGallery(List<String> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.view_company_profile_page_company_gallery,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    showFullImage(context, images: images, initIndex: index),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    height: 150,
                    placeholder: (context, url) =>
                        const ItemLoading(width: 200, height: 150, radius: 10),
                  ),
                ),
              );
            },
          ),
        )
      ],
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
