import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class PostLoading extends StatelessWidget {
  const PostLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        _buildBody(),
        const SizedBox(height: 30),
        _buildBottom(),
      ],
    );
  }

  Widget _buildBody() {
    Random random = Random();
    int title = random.nextInt(2) + 1;
    int description = random.nextInt(5) + 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemLoading(
                width:
                    index < title ? double.infinity : random.nextInt(50) + 50,
                height: 16,
                radius: 5,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: title,
          ),
          const SizedBox(height: 15),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ItemLoading(
                width: index < description
                    ? double.infinity
                    : random.nextInt(50) + 50,
                height: 16,
                radius: 5,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: description,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    Random random = Random();
    return Row(
      children: [
        const ItemLoading(width: 50, height: 50, radius: 90),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemLoading(
              width: random.nextInt(100) + 70,
              height: 16,
              radius: 5,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.clock, height: 16),
                const SizedBox(width: 8),
                ItemLoading(
                  width: random.nextInt(30) + 50,
                  height: 16,
                  radius: 5,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottom() {
    return Container(
      color: AppColors.interdimensionalBlue.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      height: 64,
      child: Row(
        children: [
          _buildItemReaction(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: AppColors.oldLavender,
              size: 24,
            ),
          ),
          const SizedBox(width: 28),
          _buildItemReaction(icon: SvgPicture.asset(AppImages.comment)),
          const Spacer(),
          _buildItemReaction(icon: SvgPicture.asset(AppImages.share)),
        ],
      ),
    );
  }

  Widget _buildItemReaction({required Widget icon}) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        const ItemLoading(width: 20, height: 16, radius: 5)
      ],
    );
  }
}
