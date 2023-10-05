import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetPostOptionView extends StatelessWidget {
  const BottomSheetPostOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      width: double.infinity,
      height: 330,
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
            AppLocal.text.main_page_what_would_you_like_to_add,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocal.text.main_page_content_bottom_sheet,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomButton(
            onPressed: () {
              context.router.pop();
              //TODO show create post page
            },
            title: AppLocal.text.main_page_post.toUpperCase(),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              context.router.pop();
              //TODO show create job page
            },
            title: AppLocal.text.main_page_make_job.toUpperCase(),
            isElevated: false,
          ),
        ],
      ),
    );
  }
}
