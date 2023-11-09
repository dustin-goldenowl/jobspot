import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/function/show_share_bottom_sheet.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/widgets/share_post_item.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    required this.post,
    required this.onFavourite,
    required this.onComment,
    required this.onShare,
    required this.onViewFullPost,
    required this.onViewProfile,
    this.moreWidget,
    this.isViewProfile = true,
  });

  final PostEntity post;
  final Function(FavouriteEntity entity) onFavourite;
  final Function(PostEntity post) onComment;
  final Function(SharePostBase entity) onShare;
  final Function(PostEntity post) onViewFullPost;
  final Function({required String uid, required UserRole role}) onViewProfile;
  final bool isViewProfile;
  final Widget? moreWidget;

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
                if (post.title != null && post.title!.isNotEmpty)
                  const SizedBox(height: 20),
                if (post.title != null && post.title!.isNotEmpty)
                  Text(post.title!, style: AppStyles.boldTextHaiti),
                if (post.description.isNotEmpty) const SizedBox(height: 15),
                if (post.description.isNotEmpty)
                  Text(
                    post.description,
                    style: AppStyles.normalTextMulledWine,
                  ),
              ],
            ),
          ),
          SizedBox(height: post.sharePost != null ? 10 : 30),
          if (post.images.isNotEmpty)
            ImageWidget(images: post.images, padding: AppDimens.smallPadding),
          if (post.sharePost != null)
            Padding(
              padding: const EdgeInsets.all(8),
              child: SharePostItem(
                padding: AppDimens.smallPadding + 16,
                post: post.sharePost!,
                onViewFullPost: onViewFullPost,
                onViewProfile: onViewProfile,
              ),
            ),
          _buildBottomPost(context),
        ],
      ),
    );
  }

  Widget _buildHeaderPost(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onViewFullPost(post),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => isViewProfile
                ? onViewProfile(uid: post.user.id, role: post.user.role)
                : null,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: post.user.avatar,
                width: 50,
                height: 50,
                placeholder: (context, url) =>
                    const ItemLoading(width: 50, height: 50, radius: 0),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(AppImages.logo, height: 50, width: 50),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => isViewProfile
                      ? onViewProfile(uid: post.user.id, role: post.user.role)
                      : null,
                  child: Row(
                    children: [
                      Text(post.user.name, style: AppStyles.boldTextHaiti),
                      if (post.user.verify == VerifyStatus.accept)
                        const SizedBox(width: 5),
                      if (post.user.verify == VerifyStatus.accept)
                        SvgPicture.asset(AppImages.verify, height: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.clock, height: 16),
                    const SizedBox(width: 8),
                    Text(
                      timeago.format(post.createAt),
                      style:
                          TextStyle(color: AppColors.spunPearl, fontSize: 12),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (moreWidget != null) const SizedBox(width: 10),
          if (moreWidget != null) moreWidget!,
        ],
      ),
    );
  }

  Widget _buildBottomPost(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.interdimensionalBlue.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      child: Row(
        children: [
          _buildItemReaction(
            onTap: () => onFavourite(FavouriteEntity(
                id: post.id, uidTo: post.owner, listFavourite: post.like)),
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
            onTap: () => onComment(post),
            icon: SvgPicture.asset(AppImages.comment),
            quantity: post.numberOfComments,
          ),
          const Spacer(),
          _buildItemReaction(
            onTap: () => showShareBottomSheet(context,
                post: post.sharePost ?? post, onShare: onShare),
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
