import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/app_lists.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class BottomSheetTypeWorkplaceView extends StatelessWidget {
  const BottomSheetTypeWorkplaceView({
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
      height: 400,
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
            AppLocal.text.add_job_page_choose_type_workplace,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            AppLocal.text.add_job_page_choose_type_workplace_content,
            style: AppStyles.normalTextMulledWine,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildWorkplaceOption(
                title: AppLists.listTypeWorkplace[index]["title"]!,
                subtitle: AppLists.listTypeWorkplace[index]["subtitle"]!,
                value: index,
                groupValue: groupValue,
                onChange: onChange,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: AppLists.listTypeWorkplace.length,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkplaceOption({
    required String title,
    required String subtitle,
    required int value,
    required int groupValue,
    required Function(int? value) onChange,
  }) {
    return GestureDetector(
      onTap: () => onChange(value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.boldText.copyWith(fontSize: 16),
                ),
                Text(subtitle, style: AppStyles.normalTextSpunPearl)
              ],
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
