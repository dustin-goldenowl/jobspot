import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as cubit;
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_loading.dart';

class ConnectionView extends StatelessWidget {
  const ConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<cubit.ConnectionCubit>().fetchPostData();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.connection_page_connection),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<cubit.ConnectionCubit>().fetchPostData();
          },
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return state.posts != null && index < state.posts!.length
                      ? PostItem(post: state.posts![index])
                      : state.isMore
                          ? const PostLoading()
                          : Center(
                              child: Text(
                                AppLocal.text.connection_page_no_new_posts,
                                style: AppStyles.boldTextHaiti
                                    .copyWith(fontSize: 16),
                              ),
                            );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
