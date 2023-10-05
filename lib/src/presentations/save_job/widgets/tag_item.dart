import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class TagItem extends StatelessWidget {
  const TagItem({super.key, required this.title, this.backgroundColor});

  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.ghost.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Text(title, style: AppStyles.normalTextMulledWine),
    );
  }
}
