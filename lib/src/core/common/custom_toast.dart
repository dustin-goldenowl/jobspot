import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobspot/src/core/constants/constants.dart';

Widget toastWidget(String text) {
  return Card(
    elevation: 5,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.logo, width: 30, height: 30),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    ),
  );
}

void customToast(BuildContext context, {required String text}) {
  FToast fToast = FToast();
  fToast.init(context);
  fToast.showToast(
    child: toastWidget(text),
    toastDuration: const Duration(seconds: 3),
    gravity: ToastGravity.TOP,
    fadeDuration: const Duration(seconds: 1),
  );
}
