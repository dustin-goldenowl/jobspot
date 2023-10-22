import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetSetting extends StatelessWidget {
  const BottomSheetSetting({
    super.key,
    required this.content,
    required this.title,
    required this.onAccept,
  });

  final String title;
  final String content;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      width: double.infinity,
      height: 310,
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
          const SizedBox(height: 50),
          Text(
            title,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: onAccept,
            title: AppLocal.text.setting_page_yes,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: context.router.pop,
            title: AppLocal.text.setting_page_cancel,
            isElevated: false,
          ),
        ],
      ),
    );
  }
}
