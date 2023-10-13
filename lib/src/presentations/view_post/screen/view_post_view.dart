import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart';
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
        onRefresh: () async =>
            context.read<ViewPostBloc>().add(SyncPostDataEvent()),
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
              BlocBuilder<ViewPostBloc, ViewPostState>(
                buildWhen: (previous, current) =>
                    current is SyncPostDataSuccess,
                builder: (context, state) {
                  if (state is SyncPostDataSuccess &&
                      state.post.images.isNotEmpty) {
                    return ImageWidget(images: state.post.images);
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
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) => current is SyncPostDataSuccess,
      builder: (context, state) {
        if (state is SyncPostDataSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.post.title, style: AppStyles.boldTextHaiti),
              const SizedBox(height: 15),
              Text(
                state.post.description,
                style: AppStyles.normalTextMulledWine,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildHeaderPost(BuildContext context) {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) => current is SyncPostDataSuccess,
      builder: (context, state) {
        if (state is SyncPostDataSuccess) {
          PostEntity post = state.post;
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
                          placeholder: (context, url) => const ItemLoading(
                              width: 50, height: 50, radius: 0),
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
                        style: AppStyles.normalTextSpunPearl
                            .copyWith(fontSize: 12),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildBottomPost() {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) => current is SyncPostDataSuccess,
      builder: (context, state) {
        if (state is SyncPostDataSuccess) {
          PostEntity post = state.post;
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
                    context
                        .read<ViewPostBloc>()
                        .add(FavouritePostEvent(post.like));
                  },
                  icon: Icon(
                    post.like.contains(FirebaseAuth.instance.currentUser!.uid)
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    color: post.like
                            .contains(FirebaseAuth.instance.currentUser!.uid)
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
        return const SizedBox();
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
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<ViewPostBloc>().commentController,
          hintText: false ? "reply ngoctienTNT" : "Add a comment",
          suffixIcon: true
              ? InkWell(
                  onTap: () {
                    context.read<ViewPostBloc>().add(SendCommentEvent());
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
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) => current is GetCommentDataSuccess,
      builder: (context, state) {
        if (state is GetCommentDataSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.listComment.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return _buildComment(state.listComment[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildComment(CommentEntity comment) {
    return Column(
      children: [
        _commentItem(comment: comment),
        const SizedBox(height: 10),
        Visibility(
          visible: false,
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
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) =>
          current is FavouriteCommentSuccess && current.id == comment.id,
      builder: (context, state) {
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
                        _buildFavouriteComment(comment),
                        const SizedBox(width: 25),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildFavouriteComment(CommentEntity comment) {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) =>
          (current is FavouriteCommentSuccess && current.id == comment.id) ||
          (current is FavouriteCommentLoading && current.id == comment.id) ||
          current is GetCommentDataSuccess ||
          current is ViewPostInitial,
      builder: (context, state) {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        List<String> listFavourite = [];

        if (state is! FavouriteCommentLoading &&
            state is! FavouriteCommentSuccess) {
          listFavourite.addAll(comment.like);
        }

        if (state is FavouriteCommentLoading) {
          listFavourite.addAll(state.listFavoutite);
        }

        if (state is FavouriteCommentSuccess) {
          listFavourite.addAll(state.listFavoutite);
          listFavourite.contains(uid)
              ? comment.like.add(uid)
              : comment.like.remove(uid);
        }

        return _buildItemReaction(
          onTap: () {
            context.read<ViewPostBloc>().add(FavouriteCommentEvent(
                id: comment.id, listFavourite: comment.like));
          },
          icon: Icon(
            listFavourite.contains(uid)
                ? FontAwesomeIcons.solidHeart
                : FontAwesomeIcons.heart,
            color: listFavourite.contains(uid)
                ? AppColors.tartOrange
                : AppColors.oldLavender,
            size: 18,
          ),
          quantity: listFavourite.length,
        );
      },
    );
  }
}
