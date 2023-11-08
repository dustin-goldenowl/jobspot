import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as cubit;
import 'package:jobspot/src/presentations/connection/domain/router/connection_coordinator.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item_loading.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(AppLocalizations.of(context)!.key),
      appBar: AppBar(
        title: Text(AppLocal.text.connection_page_connection),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocListener<cubit.ConnectionCubit, cubit.ConnectionState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();

          if (previous.isLoading && current.error == null) {
            Navigator.of(context).pop();
            customToast(
              context,
              text: AppLocal.text.connection_page_share_post_success,
            );
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
                        onComment: (post) => ConnectionCoordinator.showFullPost(
                            post: post, isComment: true),
                        onFavourite:
                            context.read<cubit.ConnectionCubit>().favouritePost,
                        onShare: (post) => context
                            .read<cubit.ConnectionCubit>()
                            .showShareBottomSheet(context, post: post),
                        onViewFullPost: (post) =>
                            ConnectionCoordinator.showFullPost(post: post),
                        onViewProfile: ConnectionCoordinator.showViewProfile,
                      )
                    : state.isMore
                        ? const PostItemLoading()
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
