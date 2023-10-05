import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/notification/widgets/notification_item.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.notification_page_notifications),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColors.deepSaffron),
            child: Text(AppLocal.text.notification_page_read_all),
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemBuilder: (context, index) {
            return NotificationItem(
              isRead: index == 0,
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 10,
        ),
      ),
    );
  }
}
