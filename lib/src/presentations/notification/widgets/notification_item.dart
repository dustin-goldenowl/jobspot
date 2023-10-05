import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, this.isRead = false, required this.onTap});

  final bool isRead;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        decoration: BoxDecoration(
          color:
              isRead ? AppColors.veryLightBlue.withOpacity(0.1) : Colors.white,
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
            SvgPicture.asset(AppImages.google),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Google",
                    style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Applications for Apple companies have entered for company review", //Hard text to test UI
                    style: AppStyles.normalTextMulledWine,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1 Day ago", //Hard text to test UI
                        style: AppStyles.normalTextSpunPearl,
                      ),
                      TextButton(
                        onPressed: () {},
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
}
