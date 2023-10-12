import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class JobSubtitleInfo extends StatelessWidget {
  const JobSubtitleInfo({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.boldTextMulledWine),
        const SizedBox(height: 5),
        Text(content, style: TextStyle(color: AppColors.mulledWine)),
        const SizedBox(height: 12),
        const Divider(color: Color(0xFFDEE1E7), thickness: 0.5)
      ],
    );
  }
}
