import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/service/dynamic_link_service.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class BottomSheetSharePost extends StatefulWidget {
  const BottomSheetSharePost({
    super.key,
    required this.onShare,
    required this.post,
    this.update,
  });

  final Function(SharePostBase entity) onShare;
  final PostEntity post;
  final UpdateSharePostEntity? update;

  @override
  State<BottomSheetSharePost> createState() => _BottomSheetSharePostState();
}

class _BottomSheetSharePostState extends State<BottomSheetSharePost> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.update != null) {
      controller.text = widget.update!.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = PrefsUtils.getUserInfo()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.nightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    _buildHeader(user),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            AppLocal.text.connection_page_share_hint_content,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildPostItem(),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: widget.update == null
                          ? AppLocal.text.connection_page_share_now
                          : AppLocal.text.add_post_page_update,
                      onPressed: () {
                        Navigator.of(context).pop();
                        widget.update == null
                            ? widget.onShare(SharePostEntity(
                                description: controller.text,
                                postID: widget.post.id,
                                share: widget.post.share,
                                toUid: widget.post.owner,
                              ))
                            : widget.onShare(UpdateSharePostEntity(
                                description: controller.text,
                                postID: widget.update!.postID,
                              ));
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      title: AppLocal.text.share_out_app,
                      isElevated: false,
                      onPressed: () async {
                        final link = await DynamicLinkService.createDynamicLink(
                            type: "post", id: widget.post.id);
                        await Share.share(AppLocal.text
                            .share_post_content(link, widget.post.title ?? ""));
                        if (mounted) Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(UserEntity user) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.avatar,
            width: 50,
            height: 50,
            placeholder: (context, url) =>
                const ItemLoading(width: 50, height: 50, radius: 0),
            errorWidget: (context, url, error) =>
                SvgPicture.asset(AppImages.logo, height: 50, width: 50),
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Text(
              user.name,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
            ),
            if (user.verify == VerifyStatus.accept) const SizedBox(width: 5),
            if (user.verify == VerifyStatus.accept)
              SvgPicture.asset(AppImages.verify, height: 18),
          ],
        ),
      ],
    );
  }

  Widget _buildPostItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 62,
            offset: Offset(0, 4),
          ),
        ],
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
                Text(widget.post.title ?? "", style: AppStyles.boldTextHaiti),
                const SizedBox(height: 15),
                Text(
                  widget.post.description,
                  style: AppStyles.normalTextMulledWine,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderPost(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: widget.post.user.avatar,
            width: 50,
            height: 50,
            placeholder: (context, url) =>
                const ItemLoading(width: 50, height: 50, radius: 0),
            errorWidget: (context, url, error) =>
                SvgPicture.asset(AppImages.logo, height: 50, width: 50),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(widget.post.user.name, style: AppStyles.boldTextHaiti),
                  if (widget.post.user.verify == VerifyStatus.accept)
                    const SizedBox(width: 5),
                  if (widget.post.user.verify == VerifyStatus.accept)
                    SvgPicture.asset(AppImages.verify, height: 18),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SvgPicture.asset(AppImages.clock, height: 16),
                  const SizedBox(width: 8),
                  Text(
                    timeago.format(widget.post.createAt),
                    style: TextStyle(color: AppColors.spunPearl, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
