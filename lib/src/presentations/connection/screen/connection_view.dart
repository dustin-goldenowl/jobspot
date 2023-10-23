import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as cubit;
import 'package:jobspot/src/presentations/connection/domain/router/connection_coordinator.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_loading.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.connection_page_connection),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocListener<cubit.ConnectionCubit, cubit.ConnectionState>(
        listenWhen: (previous, current) => current.error != null,
        listener: (context, state) {
          if (state.error != null) {
            customToast(context, text: state.error ?? "");
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<cubit.ConnectionCubit>().fetchPostData(),
        child: BlocBuilder<cubit.ConnectionCubit, cubit.ConnectionState>(
          builder: (context, state) {
            return ListView.separated(
              controller:
                  context.read<cubit.ConnectionCubit>().scrollController,
              itemCount: (state.posts?.length ?? 9) + 1,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: const EdgeInsets.all(AppDimens.smallPadding),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return state.posts != null && index < state.posts!.length
                    ? PostItem(
                        post: state.posts![index],
                        onComment: () => ConnectionCoordinator.showFullPost(
                            post: state.posts![index], isComment: true),
                        onFavourite: () => context
                            .read<cubit.ConnectionCubit>()
                            .favouritePost(FavouriteEntity(
                              owner: state.posts![index].owner,
                              id: state.posts![index].id,
                              listFavourite: state.posts![index].like,
                            )),
                        onShare: () {
                          //TODO tap to share post
                        },
                        onViewFullPost: () =>
                            ConnectionCoordinator.showFullPost(
                                post: state.posts![index]),
                        onViewProfile: () {
                          ConnectionCoordinator.showViewProfile(
                              uid: state.posts![index].user.id);
                        },
                      )
                    : state.isMore
                        ? const PostLoading()
                        : _buildNoPost();
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildNoPost() {
    return Center(
      child: Text(
        AppLocal.text.connection_page_no_new_posts,
        style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
      ),
    );
  }
}
