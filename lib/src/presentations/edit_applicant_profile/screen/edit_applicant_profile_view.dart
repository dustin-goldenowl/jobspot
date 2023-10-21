import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/gender_widget.dart';

class EditApplicantProfileView extends StatelessWidget {
  const EditApplicantProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller:
              context.read<EditApplicantProfileCubit>().scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [_buildAppBar(context)],
          body: BlocListener<EditApplicantProfileCubit,
              EditApplicantProfileState>(
            listenWhen: (previous, current) {
              if (previous.isLoading) {
                Navigator.of(context).pop();
              }
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
            child: _buildBody(context),
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
              title: AppLocalizations.of(context)!
                  .edit_applicant_profile_page_fullname,
              controller:
                  context.read<EditApplicantProfileCubit>().nameController,
            ),
            const SizedBox(height: 15),
            _buildBirthday(),
            const SizedBox(height: 15),
            _buildGender(),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              onTap: () {}, // ontap => set readonly
              title: AppLocalizations.of(context)!
                  .edit_applicant_profile_page_email,
              controller:
                  context.read<EditApplicantProfileCubit>().emailController,
            ),
            const SizedBox(height: 15),
            CustomTitleTextInput(
              title: AppLocalizations.of(context)!
                  .edit_applicant_profile_page_address,
              controller:
                  context.read<EditApplicantProfileCubit>().locationController,
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: CustomButton(
                onPressed:
                    context.read<EditApplicantProfileCubit>().updateUserInfo,
                title: AppLocalizations.of(context)!
                    .edit_applicant_profile_page_save
                    .toUpperCase(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBirthday() {
    final now = DateTime.now();
    return BlocBuilder<EditApplicantProfileCubit, EditApplicantProfileState>(
      buildWhen: (previous, current) => previous.birthday != current.birthday,
      builder: (context, state) {
        return BirthdayWidget(
          title: AppLocal.text.birthday,
          onChange: (date) {},
          selectedDate: state.birthday,
          lastDate: DateTime(now.year - 18, now.month, now.day),
        );
      },
    );
  }

  Widget _buildGender() {
    return BlocBuilder<EditApplicantProfileCubit, EditApplicantProfileState>(
      buildWhen: (previous, current) => previous.isMale != current.isMale,
      builder: (context, state) {
        return GenderWidget(
          isMale: state.isMale,
          onChange: context.read<EditApplicantProfileCubit>().changeGender,
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<EditApplicantProfileCubit, EditApplicantProfileState>(
      builder: (context, state) {
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
              context.read<EditApplicantProfileCubit>().nameController.text,
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
                  Hero(tag: AppTags.avatar, child: _buildAvatar()),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => context
                        .read<EditApplicantProfileCubit>()
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
                        AppLocalizations.of(context)!
                            .edit_applicant_profile_page_change_image,
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
    return BlocBuilder<EditApplicantProfileCubit, EditApplicantProfileState>(
      buildWhen: (previous, current) => previous.avatar != current.avatar,
      builder: (context, state) {
        return ClipOval(
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
        );
      },
    );
  }
}
