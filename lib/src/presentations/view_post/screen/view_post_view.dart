import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_loading.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/view_post/bloc/view_post_bloc.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/router/view_post_coordinator.dart';
import 'package:jobspot/src/presentations/view_post/widgets/comment_loading.dart';
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
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: PrefsUtils.getUserInfo()!.avatar,
                width: 50,
                height: 50,
                placeholder: (context, url) =>
                    const ItemLoading(width: 50, height: 50, radius: 0),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(AppImages.logo, height: 50, width: 50),
              ),
            ),
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
          child: BlocListener<ViewPostBloc, ViewPostState>(
            listener: (context, state) {
              if (state is ViewPostError) {
                customToast(context, text: state.error);
              }
            },
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
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
              _buildContentPost(),
            ],
          ),
        ),
        const SizedBox(height: 30),
        BlocBuilder<ViewPostBloc, ViewPostState>(
          buildWhen: (previous, current) => current is SyncPostDataSuccess,
          builder: (context, state) {
            if (state is SyncPostDataSuccess && state.post.images.isNotEmpty) {
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
        return const PostLoading();
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
                onTap: () => ViewPostCoordinator.showViewProfile(
                    uid: state.post.user.id),
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
                  onTap: context
                      .read<ViewPostBloc>()
                      .commentFocusNode
                      .requestFocus,
                  icon: SvgPicture.asset(AppImages.comment),
                  quantity: post.numberOfComments,
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
      buildWhen: (previous, current) =>
          current is ChangeTextCommentState ||
          current is ReplyCommentClickState,
      builder: (context, state) {
        final bloc = context.read<ViewPostBloc>();
        return CustomTitleTextInput(
          controller: bloc.commentController,
          hintText: bloc.replyComment != null
              ? AppLocal.text
                  .view_post_page_reply_to(bloc.replyComment!.user.name)
              : AppLocal.text.view_post_page_add_comment,
          focusNode: context.read<ViewPostBloc>().commentFocusNode,
          suffixIcon: bloc.commentController.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    bloc.replyComment == null
                        ? bloc.add(SendCommentEvent())
                        : bloc.add(ReplyCommentEvent());
                  },
                  child: const Icon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.black,
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildListComment() {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) =>
          current is GetCommentDataSuccess || current is GetCommentDataLoading,
      builder: (context, state) {
        if (state is GetCommentDataSuccess) {
          return state.listComment.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.listComment.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return _buildComment(
                      context,
                      comment: state.listComment[index],
                    );
                  },
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    AppLocal.text.view_post_page_no_comment,
                    style: AppStyles.boldTextHaiti,
                  ),
                );
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => const CommentLoading(),
        );
      },
    );
  }

  Widget _buildComment(BuildContext context, {required CommentEntity comment}) {
    return BlocBuilder<ViewPostBloc, ViewPostState>(
      buildWhen: (previous, current) =>
          current is ViewReplyCommentSuccess &&
              current.commentID == comment.id ||
          current is ViewReplyCommentLoading && current.commentID == comment.id,
      builder: (context, state) {
        bool isShowReply = comment.reply.isNotEmpty &&
            state is! ViewReplyCommentSuccess &&
            state is! ViewReplyCommentLoading;
        return Column(
          children: [
            _commentItem(context, comment: comment),
            const SizedBox(height: 10),
            Visibility(
              visible: isShowReply,
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Divider(
                      indent: 15,
                      endIndent: 10,
                      thickness: 1,
                      color: AppColors.haiti.withOpacity(0.5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ViewPostBloc>()
                          .add(ViewReplyCommentEvent(comment.id));
                    },
                    child: Text(
                      AppLocal.text.view_post_page_see_more_comment(
                          comment.reply.length),
                      style: AppStyles.boldTextHaiti.copyWith(fontSize: 12.5),
                    ),
                  ),
                ],
              ),
            ),
            if (state is ViewReplyCommentSuccess &&
                state.commentID == comment.id)
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                padding: const EdgeInsets.only(left: 50),
                itemCount: state.listComment.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _commentItem(
                    context,
                    comment: state.listComment[index],
                    size: 35,
                  );
                },
              ),
            if (state is ViewReplyCommentLoading &&
                state.commentID == comment.id)
              ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                padding: const EdgeInsets.only(left: 50),
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const CommentLoading(size: 35),
              ),
            const SizedBox(height: 15),
          ],
        );
      },
    );
  }

  Widget _commentItem(
    BuildContext context, {
    required CommentEntity comment,
    double size = 50,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: () {
        context.read<ViewPostBloc>().showSimpleDialog(context, comment);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () =>
                ViewPostCoordinator.showViewProfile(uid: comment.user.id),
            child: ClipOval(
              child: CachedNetworkImage(
                  imageUrl: comment.user.avatar,
                  height: size,
                  width: size,
                  placeholder: (context, url) =>
                      ItemLoading(width: size, height: size, radius: 90),
                  errorWidget: (context, url, error) => SvgPicture.asset(
                      AppImages.logo,
                      width: size,
                      height: size)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () =>
                      ViewPostCoordinator.showViewProfile(uid: comment.user.id),
                  child:
                      Text(comment.user.name, style: AppStyles.boldTextHaiti),
                ),
                const SizedBox(height: 5),
                Text(comment.content, style: AppStyles.normalTextMulledWine),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      timeago.format(comment.createAt),
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppStyles.normalTextSpunPearl.copyWith(fontSize: 12),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<ViewPostBloc>()
                            .add(ReplyCommentClickEvent(comment));
                      },
                      child: Text(
                        AppLocal.text.view_post_page_reply,
                        style: AppStyles.normalTextNightBlue,
                      ),
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
