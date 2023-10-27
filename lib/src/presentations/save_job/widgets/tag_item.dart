import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.title,
    this.isSelect = false,
    this.backgroundColor,
    this.padding,
    this.onTap,
  });

  final String title;
  final bool isSelect;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ??
              (isSelect
                  ? AppColors.neonCarrot
                  : AppColors.ghost.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          title,
          style: isSelect
              ? const TextStyle(color: Colors.white)
              : AppStyles.normalTextMulledWine,
        ),
      ),
    );
  }
}
