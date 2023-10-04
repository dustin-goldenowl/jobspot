import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key, required this.isMale, required this.onChange});

  final bool isMale;
  final Function(bool value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocal.text.gender, style: AppStyles.boldTextNightBlue),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildGender(
                title: AppLocal.text.male,
                value: true,
                groupValue: isMale,
                onChange: onChange,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildGender(
                title: AppLocal.text.female,
                value: false,
                groupValue: isMale,
                onChange: onChange,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGender({
    required String title,
    required bool value,
    required bool groupValue,
    required Function(bool value) onChange,
  }) {
    return GestureDetector(
      onTap: () => onChange(value),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(18, 162, 153, 198),
              blurRadius: 62,
              offset: Offset(0, 4),
            ),
          ],
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Theme(
              data: ThemeData(unselectedWidgetColor: AppColors.haiti),
              child: Transform.scale(
                scale: 1.3,
                child: Radio(
                  value: value,
                  groupValue: groupValue,
                  onChanged: (value) => onChange(value!),
                  activeColor: AppColors.deepSaffron,
                ),
              ),
            ),
            Text(
              title,
              style: AppStyles.normalTextMulledWine,
            )
          ],
        ),
      ),
    );
  }
}
