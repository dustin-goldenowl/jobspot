import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/main/widgets/button_notch.dart';

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
    double size = isSelected ? 50 : 0;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 75,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                height: size,
                width: size,
                duration: const Duration(milliseconds: 600),
                child: isSelected
                    ? CustomPaint(painter: ButtonNotch())
                    : const SizedBox(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                path,
                height: 40,
                width: 40,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.nightBlue : AppColors.santaGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
