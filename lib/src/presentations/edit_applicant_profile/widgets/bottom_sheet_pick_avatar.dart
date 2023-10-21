import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class BottomSheetPickAvatar extends StatelessWidget {
  const BottomSheetPickAvatar({super.key, required this.onTap});

  final Function(bool value) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      width: double.infinity,
      height: 210,
      child: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.nightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 40),
          _buildOption(
            title: AppLocalizations.of(context)!
                .edit_applicant_profile_page_camera,
            icon: AppImages.camera,
            onTap: () {
              onTap(true);
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 30),
          _buildOption(
            title: AppLocalizations.of(context)!
                .edit_applicant_profile_page_gallery,
            icon: AppImages.gallery,
            onTap: () {
              onTap(false);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(icon, height: 35, width: 35),
          const SizedBox(width: 15),
          Text(title, style: AppStyles.normalTextHaiti)
        ],
      ),
    );
  }
}
