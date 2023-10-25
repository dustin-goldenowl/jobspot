import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onDelete,
  });

  final NotificationEntity notification;
  final Function(String action, String type, String id) onTap;
  final Function(String id) onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ([AppTags.reply, AppTags.favouriteCmt].contains(notification.type)) {
          onTap(
            notification.comment?.post ?? "",
            notification.type,
            notification.id,
          );
        } else {
          onTap(notification.action, notification.type, notification.id);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        decoration: BoxDecoration(
          color: notification.isRead
              ? Colors.white
              : AppColors.veryLightBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.wildBlueYonder.withAlpha(18),
              blurRadius: 62,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: notification.from.avatar,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const ItemLoading(width: 50, height: 50, radius: 0),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(AppImages.logo, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.from.name,
                    style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  _buildContent(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timeago.format(notification.createAt),
                        style: AppStyles.normalTextSpunPearl,
                      ),
                      TextButton(
                        onPressed: () => onDelete(notification.id),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.tartOrange,
                        ),
                        child: Text(AppLocal.text.notification_page_delete),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    final content = switch (notification.type) {
      AppTags.favourite => AppLocal.text.notification_favourite(
          notification.from.name,
          notification.post?.title ?? "",
        ),
      AppTags.comment => AppLocal.text.notification_comment(
          notification.from.name,
          notification.post?.title ?? "",
        ),
      AppTags.favouriteCmt => AppLocal.text.notification_favourite_cmt(
          notification.comment?.content ?? "",
          notification.from.name,
        ),
      AppTags.reply => AppLocal.text.notification_reply(
          notification.comment?.content ?? "",
          notification.from.name,
        ),
      AppTags.apply => AppLocal.text.notification_apply(
          notification.job?.jobPosition ?? "",
          notification.from.name,
        ),
      AppTags.accept => AppLocal.text.notification_accept(
          notification.job?.jobPosition ?? "",
          notification.from.name,
        ),
      AppTags.reject => AppLocal.text.notification_reject(
          notification.job?.jobPosition ?? "",
          notification.from.name,
        ),
      AppTags.share => AppLocal.text.notification_share(
          notification.from.name,
          notification.post?.title ?? "",
        ),
      _ => ""
    };
    return Text(
      content,
      style: AppStyles.normalTextMulledWine,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
