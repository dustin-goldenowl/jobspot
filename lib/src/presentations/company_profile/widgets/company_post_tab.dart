import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/show_share_bottom_sheet.dart';
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart';
import 'package:jobspot/src/presentations/company_profile/domain/router/company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item_loading.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/router/view_company_profile_coordinator.dart';

@RoutePage()
class CompanyPostTab extends StatelessWidget {
  const CompanyPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
      buildWhen: (previous, current) => previous.listPost != current.listPost,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async =>
              context.read<CompanyProfileCubit>().getListPost(),
          child: ListView.separated(
            itemCount: state.listPost?.length ?? 10,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            padding: const EdgeInsets.all(AppDimens.smallPadding),
            itemBuilder: (context, index) {
              if (state.listPost != null) {
                return _buildPostItem(context, post: state.listPost![index]);
              }
              return const PostItemLoading();
            },
          ),
        );
      },
    );
  }

  Widget _buildPostItem(BuildContext context, {required PostEntity post}) {
    return PostItem(
      post: post,
      isViewProfile: false,
      onFavourite: context.read<CompanyProfileCubit>().favouritePost,
      onComment: (post) => ViewCompanyProfileCoordinator.showFullPost(
          post: post, isComment: true),
      onShare: context.read<CompanyProfileCubit>().sharePost,
      onViewFullPost: (post) =>
          ViewCompanyProfileCoordinator.showFullPost(post: post),
      moreWidget: PopupMenuButton<int>(
        color: Colors.white,
        icon: Icon(
          FontAwesomeIcons.ellipsisVertical,
          color: AppColors.haiti,
          size: 18,
        ),
        shadowColor: Colors.black,
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<int>(
            value: 0,
            child: _buildItemPopup(
              icon: AppImages.edit,
              title: AppLocal.text.applicant_profile_page_edit,
            ),
            onTap: () => post.sharePost == null
                ? CompanyProfileCoordinator.showEditPost(post: post)
                : showShareBottomSheet(
                    context,
                    post: post.sharePost!,
                    update: UpdateSharePostEntity(
                        description: post.description, postID: post.id),
                    onShare: context.read<CompanyProfileCubit>().sharePost,
                  ),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: _buildItemPopup(
              icon: AppImages.trash,
              title: AppLocal.text.applicant_profile_page_delete,
            ),
            onTap: () => context.read<CompanyProfileCubit>().deletePost(post),
          ),
        ],
      ),
      onViewProfile: CompanyProfileCoordinator.showViewProfile,
    );
  }

  Widget _buildItemPopup({required String title, required String icon}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(AppColors.haiti, BlendMode.srcIn),
          width: 20,
        ),
        const SizedBox(width: 10),
        Text(title, style: AppStyles.normalTextHaiti),
      ],
    );
  }
}
