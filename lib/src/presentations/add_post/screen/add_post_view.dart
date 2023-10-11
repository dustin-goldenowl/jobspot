import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(FontAwesomeIcons.xmark),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          TextButton(
            onPressed: context.read<AddPostCubit>().isEdit
                ? context.read<AddPostCubit>().updatePost
                : context.read<AddPostCubit>().addPost,
            style: TextButton.styleFrom(foregroundColor: AppColors.deepSaffron),
            child: Text(
              context.read<AddPostCubit>().isEdit
                  ? AppLocal.text.add_post_page_update
                  : AppLocal.text.add_post_page_post,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            IconButton(
              onPressed: context.read<AddPostCubit>().pickImageFromCamera,
              icon: SvgPicture.asset(AppImages.camera),
            ),
            IconButton(
              onPressed: context.read<AddPostCubit>().pickImageFromGallery,
              icon: SvgPicture.asset(AppImages.picture),
            ),
          ],
        ),
      ),
      body: BlocListener<AddPostCubit, AddPostState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();
          return true;
        },
        listener: (context, state) {
          if (state.isLoading) loadingAnimation(context);

          if (state.dataState is DataSuccess) {
            customToast(context,
                text: AppLocal.text.add_post_created_successful_post);
            context.router.pop();
          }

          if (state.dataState is DataFailed) {
            customToast(context, text: state.dataState!.error ?? "");
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final user = PrefsUtils.getUserInfo();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.read<AddPostCubit>().isEdit
                  ? AppLocal.text.add_post_page_edit_post
                  : AppLocal.text.add_post_page_add_post,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                ClipOval(
                  child: user!.avatar.isEmpty
                      ? SvgPicture.asset(AppImages.logo, height: 60, width: 60)
                      : CachedNetworkImage(
                          imageUrl: user.avatar,
                          placeholder: (_, __) => const ItemLoading(
                              width: 60, height: 60, radius: 0),
                          errorWidget: (_, __, ___) =>
                              const Icon(Icons.warning),
                          height: 60,
                          width: 60,
                        ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                    ),
                    Text(user.email, style: AppStyles.normalTextMulledWine),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            CustomTitleTextInput(
              controller: context.read<AddPostCubit>().titleController,
              title: AppLocal.text.add_post_page_post_title,
              titleFontSize: 16,
              hintText: AppLocal.text.add_post_page_post_title_hint,
            ),
            const SizedBox(height: 25),
            CustomTitleTextInput(
              controller: context.read<AddPostCubit>().descriptionController,
              title: AppLocal.text.add_post_page_description,
              titleFontSize: 16,
              hintText: AppLocal.text.add_post_page_description_hint,
              maxLines: 8,
            ),
            const SizedBox(height: 25),
            _buildImages(context)
          ],
        ),
      ),
    );
  }

  Widget _buildImages(BuildContext context) {
    return BlocBuilder<AddPostCubit, AddPostState>(
      buildWhen: (previous, current) => previous.images != current.images,
      builder: (context, state) {
        if (state.images.isNotEmpty) {
          return SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                String image = context.read<AddPostCubit>().state.images[index];
                return _buildImageItem(context, image: image, index: index);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: context.read<AddPostCubit>().state.images.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildImageItem(
    BuildContext context, {
    required String image,
    required int index,
  }) {
    return Stack(
      children: [
        if (image.isLink)
          CachedNetworkImage(
            imageUrl: image,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                const ItemLoading(width: 100, height: 100, radius: 0),
          )
        else
          Image.file(File(image), width: 100, height: 100, fit: BoxFit.fill),
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: () => context.read<AddPostCubit>().removeImage(index),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(FontAwesomeIcons.xmark, size: 12),
            ),
          ),
        )
      ],
    );
  }
}
