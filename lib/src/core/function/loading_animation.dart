import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

void loadingAnimation(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    },
  );
}
