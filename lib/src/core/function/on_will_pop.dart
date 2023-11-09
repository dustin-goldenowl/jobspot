import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';

Future<bool> onWillPop({
  required BuildContext context,
  required Function(DateTime?) action,
  DateTime? currentBackPressTime,
}) {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime) > const Duration(seconds: 3)) {
    action(now);
    customToast(context, text: AppLocal.text.press_again_to_exit);
    return Future.value(false);
  }
  SystemNavigator.pop();
  return Future.value(true);
}
