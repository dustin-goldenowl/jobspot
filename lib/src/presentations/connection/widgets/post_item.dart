import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            child: Column(
              children: [
                _buildHeaderPost(
                  context,
                  name: "Arnold Leonardo",
                  time: "21 minuts ago",
                ),
                const SizedBox(height: 20),
                Text(
                  "What are the characteristics of a fake job call form?",
                  style: AppStyles.boldTextHaiti,
                ),
                const SizedBox(height: 15),
                Text(
                  "Because I always find fake job calls so I'm confused which job to take can you share your knowledge here? thank you",
                  style: AppStyles.normalTextMulledWine,
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),
          _buildBottomPost(),
        ],
      ),
    );
  }

  Widget _buildHeaderPost(
    BuildContext context, {
    required String name,
    required String time,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(AppImages.google, height: 50, width: 50),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppStyles.boldTextHaiti),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset(AppImages.clock, height: 16),
                const SizedBox(width: 10),
                Text(
                  time,
                  style: TextStyle(color: AppColors.spunPearl, fontSize: 12),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildBottomPost() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3F13E4).withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      child: Row(
        children: [
          _buildItemReaction(
            onTap: () {},
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              color: Color(0xFFFF4D46),
              size: 24,
            ),
            quantity: 12,
          ),
          const SizedBox(width: 28),
          _buildItemReaction(
            onTap: () {},
            icon: SvgPicture.asset(AppImages.comment),
            quantity: 10,
          ),
          const Spacer(),
          _buildItemReaction(
            onTap: () {},
            icon: SvgPicture.asset(AppImages.share),
            quantity: 10,
          )
        ],
      ),
    );
  }

  Widget _buildItemReaction({
    required VoidCallback onTap,
    required Widget icon,
    required int quantity,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5),
          Text(
            "$quantity",
            style: const TextStyle(color: Color(0xFF6F6B80)),
          ),
        ],
      ),
    );
  }
}
