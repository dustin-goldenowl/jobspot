import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final PostModel post;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderPost(context),
                const SizedBox(height: 20),
                Text(post.title, style: AppStyles.boldTextHaiti),
                const SizedBox(height: 15),
                Text(
                  post.description,
                  style: AppStyles.normalTextMulledWine,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (post.images.isNotEmpty) ImageWidget(images: post.images),
          _buildBottomPost(),
        ],
      ),
    );
  }

  Widget _buildHeaderPost(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            //Temporarily assigned to test the post editing function
            context.router.push(AddPostRoute(post: post.toUpdatePostEntity()));
            // TODO: open page profile of post
          },
          child: ClipOval(
            child: post.user!.avatar.isEmpty
                ? SvgPicture.asset(AppImages.logo, height: 50, width: 50)
                : CachedNetworkImage(
                    imageUrl: post.user!.avatar,
                    width: 50,
                    height: 50,
                    placeholder: (context, url) =>
                        const ItemLoading(width: 50, height: 50, radius: 0),
                  ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.user!.name, style: AppStyles.boldTextHaiti),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset(AppImages.clock, height: 16),
                const SizedBox(width: 8),
                Text(
                  timeago.format(post.createAt),
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
            onTap: () {
              // TODO: tap to favourist
            },
            icon: Icon(
              post.like.contains(FirebaseAuth.instance.currentUser!.uid)
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
              color: post.like.contains(FirebaseAuth.instance.currentUser!.uid)
                  ? AppColors.tartOrange
                  : AppColors.oldLavender,
              size: 24,
            ),
            quantity: post.like.length,
          ),
          const SizedBox(width: 28),
          _buildItemReaction(
            onTap: () {
              // TODO: tap to open comment
            },
            icon: SvgPicture.asset(AppImages.comment),
            quantity: post.comment.length,
          ),
          const Spacer(),
          _buildItemReaction(
            onTap: () {
              // TODO: tap to share post
            },
            icon: SvgPicture.asset(AppImages.share),
            quantity: post.share.length,
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
            style: TextStyle(color: AppColors.oldLavender),
          ),
        ],
      ),
    );
  }
}