import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/app_styles.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

AlertDialog customAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onOK,
}) {
  return AlertDialog(
    title: Center(child: Text(title, style: AppStyles.boldTextHaiti)),
    content: Text(content, style: AppStyles.normalTextMulledWine),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    actions: [
      IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () => context.router.pop(),
                title: "Cancel",
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomButton(
                isElevated: false,
                onPressed: onOK,
                title: "OK",
              ),
            ),
          ],
        ),
      )
    ],
  );
}
