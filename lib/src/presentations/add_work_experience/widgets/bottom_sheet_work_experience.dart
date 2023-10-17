import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetWorkExperience extends StatelessWidget {
  const BottomSheetWorkExperience({
    super.key,
    required this.isRemove,
    required this.onAccept,
    required this.onCancel,
  });

  final bool isRemove;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

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
            isRemove
                ? AppLocal.text.add_work_experience_page_delete_title
                : AppLocal.text.add_work_experience_page_save_title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.haiti,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isRemove
                ? AppLocal.text.add_work_experience_page_delete_content
                : AppLocal.text.add_work_experience_page_save_content,
            style: TextStyle(color: AppColors.mulledWine),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              context.router.pop();
              onAccept();
            },
            title:
                AppLocal.text.job_description_page_continue_fill.toUpperCase(),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              context.router.pop();
              onCancel();
            },
            title:
                AppLocal.text.job_description_page_undo_changes.toUpperCase(),
            isElevated: false,
          ),
        ],
      ),
    );
  }
}
