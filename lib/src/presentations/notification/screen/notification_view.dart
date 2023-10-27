import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/router/notification_coordinator.dart';
import 'package:jobspot/src/presentations/notification/widgets/notification_item.dart';
import 'package:jobspot/src/presentations/notification/widgets/notification_loading.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {
        if (state.error != null) {
          customToast(context, text: state.error ?? "");
        }
      },
      buildWhen: (previous, current) =>
          previous.listNotification != current.listNotification,
      builder: (context, state) {
        if (state.listNotification != null && state.listNotification!.isEmpty) {
          return _buildNoNotification(context);
        }
        return _buildHaveNotification(
          context,
          listNotification: state.listNotification,
        );
      },
    );
  }

  Widget _buildHaveNotification(
    BuildContext context, {
    List<NotificationEntity>? listNotification,
  }) {
    return Scaffold(
      key: Key(AppLocalizations.of(context)!.key),
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
        child: _buildListNotification(listNotification),
      ),
    );
  }

  Widget _buildListNotification(List<NotificationEntity>? listNotification) {
    final listTag = [AppTags.accept, AppTags.apply, AppTags.reject];
    return ListView.separated(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      itemBuilder: (context, index) {
        if (listNotification != null) {
          return NotificationItem(
            notification: listNotification[index],
            onTap: (action, type, id) {
              if (listTag.contains(type)) {
                NotificationCoordinator.showJob(action);
              } else if (type == AppTags.follow) {
                NotificationCoordinator.showViewProfile(action);
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
      itemCount: listNotification?.length ?? 10,
    );
  }

  Widget _buildNoNotification(BuildContext context) {
    return Scaffold(
      key: Key(AppLocalizations.of(context)!.key),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              const SizedBox(height: 150),
              Text(
                AppLocal.text.notification_page_no_notification,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocal.text.notification_page_no_notification_content,
                textAlign: TextAlign.center,
                style: AppStyles.normalTextMulledWine,
              ),
              const SizedBox(height: 80),
              SvgPicture.asset(
                AppImages.noNotification,
                width: MediaQuery.sizeOf(context).width * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
