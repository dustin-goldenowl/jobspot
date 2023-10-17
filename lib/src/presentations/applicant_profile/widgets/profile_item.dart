import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/add_job/widgets/add_button.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onAdd,
    this.onEdit,
    this.child,
  });

  final VoidCallback onAdd;
  final VoidCallback? onEdit;
  final Widget? child;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(icon, width: 24, height: 24),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
              ),
              const Spacer(),
              AddButton(
                isShowEdit: onEdit != null,
                onTap: onEdit ?? onAdd,
              )
            ],
          ),
          if (child != null)
            Column(
              children: [
                const SizedBox(height: 20),
                const Divider(color: Color(0xFFDEE1E7), thickness: 0.5),
                const SizedBox(height: 20),
                child!,
              ],
            ),
        ],
      ),
    );
  }
}
