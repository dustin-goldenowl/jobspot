import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/router/applicant_profile_coordinator.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item_loading.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/router/view_applicant_profile_coordinator.dart';

@RoutePage()
class ViewApplicantPostTab extends StatelessWidget {
  const ViewApplicantPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemBuilder: (context, index) {
            if (state.listPost != null) {
              return PostItem(
                post: state.listPost![index],
                onComment: (post) => ApplicantProfileCoordinator.showFullPost(
                    post: post, isComment: true),
                onFavourite:
                    context.read<ViewApplicantProfileCubit>().favouritePost,
                onShare: context.read<ViewApplicantProfileCubit>().sharePost,
                onViewFullPost: (post) =>
                    ViewApplicantProfileCoordinator.showFullPost(post: post),
                onViewProfile: ViewApplicantProfileCoordinator.showViewProfile,
                isViewProfile: false,
              );
            }
            return const PostItemLoading();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.listPost?.length ?? 10,
        );
      },
    );
  }
}
