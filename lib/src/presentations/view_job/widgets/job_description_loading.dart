import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/app_dimens.dart';

class JobDescriptionLoading extends StatelessWidget {
  const JobDescriptionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      child: Column(
        children: List.generate(
          random.nextInt(5) + 10,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemLoading(
                    width: random.nextInt(100) + 100,
                    height: 20,
                    radius: 5,
                  ),
                  const SizedBox(height: 16),
                  ...List.generate(
                    random.nextInt(5) + 1,
                    (index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: ItemLoading(
                          width: double.infinity,
                          height: 16,
                          radius: 5,
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
