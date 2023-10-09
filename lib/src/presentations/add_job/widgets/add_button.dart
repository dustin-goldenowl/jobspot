import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.isShowEdit, required this.onTap});

  final bool isShowEdit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isShowEdit
          ? SvgPicture.asset(AppImages.edit)
          : Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: AppColors.feldspar.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.deepSaffron,
                  size: 16,
                ),
              ),
            ),
    );
  }
}
