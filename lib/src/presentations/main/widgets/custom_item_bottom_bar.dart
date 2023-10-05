import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class CustomItemBottomBar extends StatelessWidget {
  const CustomItemBottomBar({
    super.key,
    required this.path,
    required this.onTap,
    required this.isSelected,
  });

  final String path;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        path,
        height: 40,
        width: 40,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.nightBlue : AppColors.santaGrey,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
