import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class ProfileTitleInfo extends StatelessWidget {
  const ProfileTitleInfo({
    super.key,
    required this.title,
    required this.content,
    this.contentColor,
    this.onTap,
    this.isJustify = false,
  });

  final String title;
  final String content;
  final Color? contentColor;
  final VoidCallback? onTap;
  final bool isJustify;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.haiti,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            content,
            textAlign: isJustify ? TextAlign.justify : null,
            style: TextStyle(color: contentColor ?? AppColors.mulledWine),
          ),
        ),
      ],
    );
  }
}
