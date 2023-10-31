import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item_loading.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/router/view_company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';

@RoutePage()
class CompanyPostTab extends StatelessWidget {
  const CompanyPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyProfileCubit, CompanyProfileState>(
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
                onFavourite: () => context
                    .read<CompanyProfileCubit>()
                    .favouritePost(FavouriteEntity(
                      uidTo: state.listPost![index].user.id,
                      id: state.listPost![index].id,
                      listFavourite: state.listPost![index].like,
                    )),
                onComment: () => ViewCompanyProfileCoordinator.showFullPost(
                    post: state.listPost![index], isComment: true),
                onShare: () {},
                onViewFullPost: () =>
                    ViewCompanyProfileCoordinator.showFullPost(
                        post: state.listPost![index]),
                onViewProfile: () {},
              );
            }
            return const PostItemLoading();
          },
        );
      },
    );
  }
}
