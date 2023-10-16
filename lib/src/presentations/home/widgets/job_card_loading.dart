import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class JobCardLoading extends StatelessWidget {
  const JobCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.wildBlueYonder.withAlpha(18),
            blurRadius: 62,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          ItemLoading(width: random.nextInt(20) + 50, height: 20, radius: 5),
          const SizedBox(height: 10),
          Row(
            children: [
              ItemLoading(
                  width: random.nextInt(30) + 80, height: 25, radius: 8),
              const SizedBox(width: 8),
              ItemLoading(
                  width: random.nextInt(30) + 80, height: 25, radius: 8),
              const Spacer(),
              const ItemLoading(width: 77, height: 25, radius: 8),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    Random random = Random();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ItemLoading(width: 40, height: 40, radius: 90),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemLoading(
                  width: random.nextInt(100) + 100, height: 18, radius: 5),
              const SizedBox(height: 5),
              ItemLoading(
                  width: random.nextInt(100) + 100, height: 18, radius: 5),
            ],
          ),
        ),
        SvgPicture.asset(
          AppImages.saveJob,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(AppColors.mulledWine, BlendMode.srcIn),
        ),
      ],
    );
  }
}
