import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart';
import 'package:jobspot/src/presentations/notification/domain/router/notification_coordinator.dart';
import 'package:jobspot/src/presentations/notification/widgets/notification_item.dart';
import 'package:jobspot/src/presentations/notification/widgets/notification_loading.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.notification_page_notifications),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: context.read<NotificationCubit>().readAllNotification,
            style: TextButton.styleFrom(foregroundColor: AppColors.deepSaffron),
            child: Text(AppLocal.text.notification_page_read_all),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            context.read<NotificationCubit>().getNotification(),
        child: BlocListener<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state.error != null) {
              customToast(context, text: state.error ?? "");
            }
          },
          child: _buildListNotification(),
        ),
      ),
    );
  }

  Widget _buildListNotification() {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          previous.listNotification != current.listNotification,
      builder: (context, state) {
        final listTag = [AppTags.accept, AppTags.apply, AppTags.reject];
        return ListView.separated(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemBuilder: (context, index) {
            if (state.listNotification != null) {
              return NotificationItem(
                notification: state.listNotification![index],
                onTap: (action, type, id) {
                  if (listTag.contains(type)) {
                    NotificationCoordinator.showJob(action);
                  } else {
                    NotificationCoordinator.showPost(action);
                  }
                  context.read<NotificationCubit>().readNotification(id);
                },
                onDelete: context.read<NotificationCubit>().deleteNotification,
              );
            }
            return const NotificationLoading();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.listNotification?.length ?? 10,
        );
      },
    );
  }
}
