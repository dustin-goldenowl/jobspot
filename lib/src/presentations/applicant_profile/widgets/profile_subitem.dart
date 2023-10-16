import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/app_colors.dart';
import 'package:jobspot/src/core/constants/app_images.dart';

class ProfileSubItem extends StatelessWidget {
  const ProfileSubItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.onEdit,
  });

  final String title;
  final String subtitle;
  final String time;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.haiti,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onEdit,
              child: SvgPicture.asset(AppImages.edit),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(color: AppColors.mulledWine),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: TextStyle(color: AppColors.mulledWine),
        ),
      ],
    );
  }
}
