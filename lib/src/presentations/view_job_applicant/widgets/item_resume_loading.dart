import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class ItemResumeLoading extends StatelessWidget {
  const ItemResumeLoading({super.key});

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
          ...List.generate(
              random.nextInt(3) + 3,
              (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: ItemLoading(
                        width: double.infinity, height: 16, radius: 5),
                  )),
          const SizedBox(height: 10),
          const ItemLoading(width: double.infinity, height: 80, radius: 15)
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
                  width: random.nextInt(80) + 80, height: 16, radius: 5),
            ],
          ),
        ),
      ],
    );
  }
}
