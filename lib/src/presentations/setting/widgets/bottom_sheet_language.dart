import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetLanguage extends StatefulWidget {
  const BottomSheetLanguage({
    super.key,
    required this.isVietnamese,
    required this.onAccept,
  });

  final bool isVietnamese;
  final Function(bool value) onAccept;

  @override
  State<BottomSheetLanguage> createState() => _BottomSheetLanguageState();
}

class _BottomSheetLanguageState extends State<BottomSheetLanguage> {
  bool isVietnamese = true;

  @override
  void initState() {
    isVietnamese = widget.isVietnamese;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.nightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: _languageItem(
                  image: AppImages.vietnam,
                  text: AppLocal.text.setting_page_vietnamese,
                  onPress: () => setState(() => isVietnamese = true),
                  isSelect: isVietnamese,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _languageItem(
                  image: AppImages.english,
                  text: AppLocal.text.setting_page_english,
                  onPress: () => setState(() => isVietnamese = false),
                  isSelect: !isVietnamese,
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              onPressed: () {
                if (isVietnamese != widget.isVietnamese) {
                  widget.onAccept(isVietnamese);
                }
                Navigator.of(context).pop();
              },
              title: AppLocal.text.setting_page_ok,
            ),
          ),
        ],
      ),
    );
  }

  Widget _languageItem({
    required String image,
    required String text,
    required VoidCallback onPress,
    required bool isSelect,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelect ? AppColors.haiti : AppColors.mulledWine,
            width: isSelect ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SvgPicture.asset(image, height: 90),
            Text(text, style: AppStyles.normalTextHaiti)
          ],
        ),
      ),
    );
  }
}
