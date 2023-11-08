import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item_loading.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/router/view_company_profile_coordinator.dart';

@RoutePage()
class ViewCompanyPostTab extends StatelessWidget {
  const ViewCompanyPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => previous.listPost != current.listPost,
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.listPost?.length ?? 10,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemBuilder: (context, index) {
            if (state.listPost != null) {
              return PostItem(
                post: state.listPost![index],
                onFavourite:
                    context.read<ViewCompanyProfileCubit>().favouritePost,
                onComment: (post) => ViewCompanyProfileCoordinator.showFullPost(
                    post: post, isComment: true),
                onShare: context.read<ViewCompanyProfileCubit>().sharePost,
                onViewFullPost: (post) =>
                    ViewCompanyProfileCoordinator.showFullPost(post: post),
                onViewProfile: ViewCompanyProfileCoordinator.showViewProfile,
                isViewProfile: false,
              );
            }
            return const PostItemLoading();
          },
        );
      },
    );
  }
}
