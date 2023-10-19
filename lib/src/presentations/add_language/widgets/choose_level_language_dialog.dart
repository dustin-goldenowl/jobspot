import 'package:flutter/material.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class ChooseLevelLanguageDialog extends StatefulWidget {
  const ChooseLevelLanguageDialog({
    super.key,
    required this.onChange,
    required this.currentLevel,
  });

  final Function(int value) onChange;
  final int currentLevel;

  @override
  State<ChooseLevelLanguageDialog> createState() =>
      _ChooseLevelLanguageDialogState();
}

class _ChooseLevelLanguageDialogState extends State<ChooseLevelLanguageDialog> {
  int level = 0;

  @override
  void initState() {
    level = widget.currentLevel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(AppDimens.smallPadding),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      actions: [
        CustomButton(
          onPressed: () => widget.onChange(level),
          title: AppLocal.text.add_language_page_done.toUpperCase(),
        ),
      ],
      content: Column(
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.nightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(
            11,
            (index) => GestureDetector(
              onTap: () => setState(() => level = index),
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocal.text.add_language_page_level(level)),
                  Radio(
                    value: index,
                    groupValue: level,
                    onChanged: (value) => setState(() => level = value!),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
