import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';

void loadingAnimation(BuildContext context, {String? content}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: AppColors.primary),
              if (content != null) const SizedBox(height: 15),
              if (content != null)
                Text(content, style: AppStyles.normalTextWhite),
            ],
          ),
        ),
      );
    },
  );
}
