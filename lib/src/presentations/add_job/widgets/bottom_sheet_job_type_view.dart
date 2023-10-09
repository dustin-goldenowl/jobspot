import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/app_lists.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class BottomSheetJobTypeView extends StatelessWidget {
  const BottomSheetJobTypeView({
    super.key,
    required this.onChange,
    required this.groupValue,
  });

  final Function(int? value) onChange;
  final int groupValue;

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
            AppLocal.text.add_job_page_choose_job_type,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocal.text.add_job_page_job_type_content,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildJobTypeOption(
                title: AppLists.listJobType[index],
                value: index,
                groupValue: groupValue,
                onChange: onChange,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: AppLists.listJobType.length,
          )
        ],
      ),
    );
  }

  Widget _buildJobTypeOption({
    required String title,
    required int value,
    required int groupValue,
    required Function(int? value) onChange,
  }) {
    return GestureDetector(
      onTap: () => onChange(value),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppStyles.boldText.copyWith(fontSize: 16),
            ),
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: AppColors.mulledWine),
            child: Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChange,
              activeColor: AppColors.deepSaffron,
            ),
          ),
        ],
      ),
    );
  }
}
