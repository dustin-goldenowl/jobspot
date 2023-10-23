import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class NotificationLoading extends StatelessWidget {
  const NotificationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.wildBlueYonder.withAlpha(18),
            blurRadius: 62,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const ItemLoading(width: 50, height: 50, radius: 90),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemLoading(
                    width: random.nextInt(70) + 70, height: 20, radius: 90),
                const SizedBox(height: 6),
                ...List.generate(
                  random.nextInt(3) + 2,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ItemLoading(
                        width: double.infinity, height: 16, radius: 90),
                  ),
                ),
                const SizedBox(height: 15),
                const ItemLoading(width: 80, height: 16, radius: 90),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
