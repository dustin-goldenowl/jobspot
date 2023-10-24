import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final Widget icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.sundown.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        // padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(color: Color(0xFFFC4646), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
