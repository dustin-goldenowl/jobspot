import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class CustomJobCardLoading extends StatelessWidget {
  const CustomJobCardLoading({super.key, required this.isShowApply});

  final bool isShowApply;

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
          const ItemLoading(width: 40, height: 40, radius: 90),
          const SizedBox(height: 10),
          ItemLoading(width: random.nextInt(50) + 100, height: 22, radius: 5),
          const SizedBox(height: 5),
          ItemLoading(width: random.nextInt(50) + 150, height: 18, radius: 5),
          const SizedBox(height: 20),
          Row(
            children: [
              ItemLoading(
                  width: random.nextInt(30) + 70, height: 26, radius: 8),
              const SizedBox(width: 8),
              ItemLoading(
                  width: random.nextInt(30) + 70, height: 26, radius: 8),
              if (!isShowApply) const SizedBox(width: 8),
              if (!isShowApply)
                ItemLoading(
                    width: random.nextInt(30) + 70, height: 26, radius: 8),
              if (isShowApply) const Spacer(),
              if (isShowApply)
                const ItemLoading(width: 80, height: 26, radius: 8),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemLoading(
                  width: random.nextInt(30) + 70, height: 13, radius: 5),
              ItemLoading(
                  width: random.nextInt(30) + 60, height: 20, radius: 5),
            ],
          ),
        ],
      ),
    );
  }
}
