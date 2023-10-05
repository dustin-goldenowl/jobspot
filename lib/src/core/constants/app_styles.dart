import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class AppStyles {
  AppStyles._();

  static TextStyle normalTextPrimary = TextStyle(color: AppColors.primary);
  static TextStyle normalTextMulledWine =
      TextStyle(color: AppColors.mulledWine);
  static TextStyle normalTextHaiti = TextStyle(color: AppColors.haiti);
  static TextStyle normalTextNightBlue = TextStyle(color: AppColors.nightBlue);
  static TextStyle normalTextSpunPearl = TextStyle(color: AppColors.spunPearl);
  static TextStyle boldTextHaiti =
      TextStyle(color: AppColors.haiti, fontWeight: FontWeight.w700);
  static TextStyle boldText = const TextStyle(fontWeight: FontWeight.w700);
  static TextStyle boldTextNightBlue = TextStyle(
    color: AppColors.nightBlue,
    fontWeight: FontWeight.w700,
  );
}
