import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/view_post/cubit/view_post_cubit.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/common/widgets/image_widget/widget/image_widget.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class ViewPostView extends StatelessWidget {
  const ViewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipOval(child: SvgPicture.asset(AppImages.google, height: 50)),
            const SizedBox(width: 10),
            Expanded(child: _writeCommentWidget()),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderPost(context),
                    const SizedBox(height: 20),
                    _buildContentPost(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ViewPostCubit, ViewPostState>(
                builder: (context, state) {
                  if (state.post!.images.isNotEmpty) {
                    return ImageWidget(images: state.post!.images);
                  }
                  return const SizedBox();
                },
              ),
              _buildBottomPost(),
              const SizedBox(height: 10),
              _buildListComment(),
              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentPost() {
    return BlocBuilder<ViewPostCubit, ViewPostState>(
      buildWhen: (previous, current) => previous.post != current.post,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(state.post!.title, style: AppStyles.boldTextHaiti),
            const SizedBox(height: 15),
            Text(
              state.post!.description,
              style: AppStyles.normalTextMulledWine,
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeaderPost(BuildContext context) {
    return BlocBuilder<ViewPostCubit, ViewPostState>(
      buildWhen: (previous, current) =>
          previous.post != null &&
          current.post != null &&
          previous.post!.user != current.post!.user,
      builder: (context, state) {
        PostEntity post = state.post!;
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                // TODO: open page profile of post
              },
              child: ClipOval(
                child: post.user.avatar.isEmpty
                    ? SvgPicture.asset(AppImages.logo, height: 50, width: 50)
                    : CachedNetworkImage(
                        imageUrl: post.user.avatar,
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
                Text(post.user.name, style: AppStyles.boldTextHaiti),
                const SizedBox(height: 5),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.clock, height: 16),
                    const SizedBox(width: 8),
                    Text(
                      timeago.format(post.createAt),
                      style:
                          AppStyles.normalTextSpunPearl.copyWith(fontSize: 12),
                    )
                  ],
                )
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildBottomPost() {
    return BlocBuilder<ViewPostCubit, ViewPostState>(
      buildWhen: (previous, current) => previous.post != current.post,
      builder: (context, state) {
        PostEntity post = state.post!;
        return Container(
          decoration: BoxDecoration(
              color: AppColors.interdimensionalBlue.withOpacity(0.1)),
          height: 64,
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
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
                  color:
                      post.like.contains(FirebaseAuth.instance.currentUser!.uid)
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
      },
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

  Widget _writeCommentWidget() {
    return BlocBuilder<ViewPostCubit, ViewPostState>(
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<ViewPostCubit>().commentController,
          hintText: false ? "reply ngoctienTNT" : "Add a comment",
          suffixIcon: true
              ? InkWell(
                  onTap: () {
                    context.read<ViewPostCubit>().sendComment();
                  },
                  child: const Icon(FontAwesomeIcons.paperPlane,
                      color: Colors.black),
                )
              : null,
        );
      },
    );
  }

  Widget _buildListComment() {
    return BlocBuilder<ViewPostCubit, ViewPostState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.litsComment?.length ?? 0,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return _buildComment(state.litsComment![index]);
          },
        );
      },
    );
  }

  Widget _buildComment(CommentEntity comment) {
    return Column(
      children: [
        _commentItem(comment: comment),
        const SizedBox(height: 10),
        Visibility(
          visible: true,
          child: Row(
            children: [
              SizedBox(
                width: 60,
                child: Divider(
                  indent: 15,
                  endIndent: 10,
                  thickness: 1,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "xem 10 comment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          padding: const EdgeInsets.only(left: 50),
          itemCount: 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                if (index == 0) const SizedBox(height: 15),
                _commentItem(comment: comment, size: 35),
              ],
            );
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _commentItem({required CommentEntity comment, double size = 50}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {},
            child: ClipOval(
              child: CachedNetworkImage(
                  imageUrl: comment.user.avatar,
                  height: size,
                  width: size,
                  placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                      SvgPicture.asset(AppImages.google)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    comment.user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Text(comment.content),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      timeago.format(comment.createAt),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        // commentFocusNode.requestFocus();
                        // replyComment = comment;
                        // context.read<ViewPostBloc>().add(ChangeCommentEvent());
                      },
                      child: const Text("reply"),
                    ),
                    const Spacer(),
                    _buildFavoriteWidget(),
                    const SizedBox(width: 25),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFavoriteWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(
            true ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            color: true ? Colors.red : Colors.black,
          ),
        ),
        const SizedBox(width: 3),
        const Text("10"),
      ],
    );
  }
}
