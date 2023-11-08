import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

class SharePostItem extends StatelessWidget {
  const SharePostItem({
    super.key,
    required this.post,
    required this.onViewFullPost,
    required this.onViewProfile,
  });

  final PostEntity post;
  final Function(PostEntity post) onViewFullPost;
  final Function({required String uid, required UserRole role}) onViewProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(8),
          bottom: Radius.circular(post.images.isEmpty ? 8 : 0),
        ),
        border: Border.all(color: Colors.black38, width: 1),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderPost(context),
                const SizedBox(height: 20),
                if (post.title != null)
                  Text(post.title!, style: AppStyles.boldTextHaiti),
                if (post.title != null) const SizedBox(height: 15),
                Text(
                  post.description,
                  style: AppStyles.normalTextMulledWine,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (post.images.isNotEmpty)
            ImageWidget(
                images: post.images, padding: AppDimens.smallPadding + 10),
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
            onTap: () => onViewProfile(uid: post.user.id, role: post.user.role),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: post.user.avatar,
                width: 40,
                height: 40,
                placeholder: (context, url) =>
                    const ItemLoading(width: 40, height: 40, radius: 90),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(AppImages.logo, height: 40, width: 40),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () =>
                      onViewProfile(uid: post.user.id, role: post.user.role),
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
        ],
      ),
    );
  }
}
