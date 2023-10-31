import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/edit_company_profile/cubit/edit_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';

class EditCompanyProfileView extends StatelessWidget {
  const EditCompanyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: context.read<EditCompanyProfileCubit>().scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) => [_buildAppBar()],
          body: BlocListener<EditCompanyProfileCubit, EditCompanyProfileState>(
            listenWhen: (previous, current) {
              if (previous.isLoading) Navigator.of(context).pop();

              if (previous.isLoading && current.error == null) {
                context.router.pop();
              }
              return true;
            },
            listener: (context, state) {
              if (state.isLoading) loadingAnimation(context);

              if (state.error != null) {
                customToast(context, text: state.error ?? "");
              }
            },
            child: Form(
              key: context.read<EditCompanyProfileCubit>().formKey,
              child: _buildBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          children: [
            CustomTitleTextInput(
              title: AppLocal.text.edit_applicant_profile_page_fullname,
              controller:
                  context.read<EditCompanyProfileCubit>().nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.edit_company_profile_page_name_validate;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.view_company_profile_page_website,
              controller:
                  context.read<EditCompanyProfileCubit>().websiteController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.edit_company_profile_page_website_blank;
                }
                if (!value.isLink) {
                  return AppLocal.text.edit_company_profile_page_website_path;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.view_company_profile_page_industry,
              controller:
                  context.read<EditCompanyProfileCubit>().industryController,
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.employee_size,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: context
                  .read<EditCompanyProfileCubit>()
                  .employeeSizeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal
                      .text.edit_company_profile_page_employee_size_validate;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildBirthday(),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              onTap: () {}, // ontap => set readonly
              title: AppLocal.text.edit_applicant_profile_page_email,
              controller:
                  context.read<EditCompanyProfileCubit>().emailController,
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.view_company_profile_page_type,
              controller:
                  context.read<EditCompanyProfileCubit>().typeController,
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.view_company_profile_page_head_office,
              controller:
                  context.read<EditCompanyProfileCubit>().headOfficeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal
                      .text.edit_company_profile_page_head_office_validate;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocal.text.view_company_profile_page_specialization,
              maxLines: 3,
              controller: context
                  .read<EditCompanyProfileCubit>()
                  .specializationController,
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              maxLines: 8,
              title: AppLocal.text.edit_company_profile_page_description,
              controller:
                  context.read<EditCompanyProfileCubit>().descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal
                      .text.edit_company_profile_page_description_validate;
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            _buildImage(),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: CustomButton(
                onPressed:
                    context.read<EditCompanyProfileCubit>().updateCompanyInfo,
                title: AppLocal.text.edit_applicant_profile_page_save
                    .toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return BlocBuilder<EditCompanyProfileCubit, EditCompanyProfileState>(
      buildWhen: (previous, current) =>
          previous.images != current.images ||
          previous.removeImages != current.removeImages,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocal.text.view_company_profile_page_company_gallery,
                  style: AppStyles.boldTextNightBlue,
                ),
                IconButton(
                  onPressed: () => context
                      .read<EditCompanyProfileCubit>()
                      .showPickImage(context),
                  icon: Icon(
                    FontAwesomeIcons.paperclip,
                    color: AppColors.deepSaffron,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            state.images.isNotEmpty
                ? ImageWidget(
                    radius: 20,
                    padding: 20,
                    images: state.images,
                    onDelete:
                        context.read<EditCompanyProfileCubit>().removeImage,
                    showDelete: true,
                  )
                : Text(
                    AppLocal.text.edit_company_profile_page_no_images,
                    style: AppStyles.normalTextMulledWine,
                  ),
          ],
        );
      },
    );
  }

  Widget _buildBirthday() {
    final now = DateTime.now();
    return BlocBuilder<EditCompanyProfileCubit, EditCompanyProfileState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return BirthdayWidget(
          title: AppLocal.text.view_company_profile_page_since,
          onChange: (date) {},
          selectedDate: state.birthday,
          lastDate: DateTime(now.year - 18, now.month, now.day),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return BlocBuilder<EditCompanyProfileCubit, EditCompanyProfileState>(
      builder: (context, state) {
        double width = MediaQuery.sizeOf(context).width;
        return SliverAppBar(
          leading: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          backgroundColor: state.isTop ? AppColors.primary : Colors.transparent,
          elevation: 0,
          pinned: true,
          centerTitle: true,
          stretch: true,
          expandedHeight: 0.6 * width,
          title: AnimatedOpacity(
            opacity: !state.isTop ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              context.read<EditCompanyProfileCubit>().nameController.text,
              style: AppStyles.normalTextWhite
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(context),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      height: 0.6 * width,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                gradient: const LinearGradient(
                  colors: [Color(0xFF130160), Color(0xFF36353C)],
                  transform: GradientRotation(0.2),
                ),
              ),
              width: width,
              height: 0.6 * width,
              child: SvgPicture.asset(AppImages.profileBackground),
            ),
            Container(
              width: width,
              height: 0.6 * width,
              padding: const EdgeInsets.all(AppDimens.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildAvatar(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => context
                        .read<EditCompanyProfileCubit>()
                        .showPickAvatar(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Text(
                        AppLocal.text.edit_applicant_profile_page_change_image,
                        style: AppStyles.normalTextWhite.copyWith(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return BlocBuilder<EditCompanyProfileCubit, EditCompanyProfileState>(
      buildWhen: (previous, current) => previous.avatar != current.avatar,
      builder: (context, state) {
        return Hero(
          tag: AppTags.avatar,
          child: ClipOval(
            child: state.avatar.isLink || state.avatar.isEmpty
                ? CachedNetworkImage(
                    imageUrl: state.avatar,
                    height: 100,
                    width: 100,
                    placeholder: (context, url) =>
                        const ItemLoading(width: 100, height: 100, radius: 90),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppImages.logo),
                  )
                : Image.file(File(state.avatar), height: 100, width: 100),
          ),
        );
      },
    );
  }
}
