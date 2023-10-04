import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.title,
    this.width,
    this.isElevated = true,
    required this.onPressed,
  });

  final Widget? child;
  final String? title;
  final bool isElevated;
  final double? width;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: isElevated
              ? [
                  const BoxShadow(
                    color: Color.fromARGB(18, 153, 171, 198),
                    blurRadius: 62,
                    offset: Offset(0, 4),
                  ),
                ]
              : null),
      height: 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isElevated ? AppColors.primary : AppColors.secondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: child ?? Text(title ?? "", style: AppStyles.boldText),
      ),
    );
  }
}
