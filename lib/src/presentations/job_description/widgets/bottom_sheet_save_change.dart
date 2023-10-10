import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/job_description/domain/router/job_description_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetSaveChange extends StatelessWidget {
  const BottomSheetSaveChange({super.key, required this.onSave});

  final VoidCallback onSave;

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
            AppLocal.text.job_description_page_save_changes,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocal.text.job_description_page_save_changes_content,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              onSave();
              JobDescriptionCoordinator.closeScreen();
            },
            title:
                AppLocal.text.job_description_page_continue_fill.toUpperCase(),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: JobDescriptionCoordinator.closeScreen,
            title:
                AppLocal.text.job_description_page_undo_changes.toUpperCase(),
            isElevated: false,
          ),
        ],
      ),
    );
  }
}
