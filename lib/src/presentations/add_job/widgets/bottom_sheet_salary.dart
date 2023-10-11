import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class BottomSheetSalary extends StatelessWidget {
  const BottomSheetSalary({
    super.key,
    required this.onChange,
    required this.controller,
    required this.formKey,
  });

  final Function(int value) onChange;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      width: double.infinity,
      height: 600,
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
            AppLocal.text.add_job_page_enter_salary,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocal.text.add_job_page_enter_salary_content,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Form(
            key: formKey,
            child: CustomTitleTextInput(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.add_job_page_please_enter_salary;
                }
                if (int.parse(value) == 0) {
                  return AppLocal.text.add_job_page_salary_greater_than;
                }
                return null;
              },
            ),
          ),
          const Spacer(),
          CustomButton(
            title: AppLocal.text.add_job_page_ok,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onChange(int.parse(controller.text));
              }
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
