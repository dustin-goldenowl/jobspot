import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart'
    as cubit;
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';

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
              if (state.posts != null) {
                return ListView.separated(
                  itemCount: state.posts!.length,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  padding: const EdgeInsets.all(AppDimens.smallPadding),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return PostItem(post: state.posts![index]);
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
