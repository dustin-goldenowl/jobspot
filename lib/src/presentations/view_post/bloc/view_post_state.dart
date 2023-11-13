part of 'view_post_bloc.dart';

abstract class ViewPostState extends Equatable {}

class ViewPostInitial extends ViewPostState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ViewPostError extends ViewPostState {
  final String error;

  ViewPostError(this.error);

  @override
  List<Object?> get props => [error];
}

class SyncPostDataSuccess extends ViewPostState {
  final PostEntity? post;

  SyncPostDataSuccess(this.post);

  @override
  List<Object?> get props => [post];
}

class GetCommentDataLoading extends ViewPostState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetCommentDataSuccess extends ViewPostState {
  final List<CommentEntity> listComment;

  GetCommentDataSuccess(this.listComment);

  @override
  List<Object?> get props => [listComment];
}

class GetReplyCommentDataSuccess extends ViewPostState {
  final List<CommentEntity> listComment;
  final String commentID;

  GetReplyCommentDataSuccess({
    required this.listComment,
    required this.commentID,
  });

  @override
  List<Object?> get props => [listComment, commentID];
}

class FavouriteCommentLoading extends ViewPostState {
  final String id;
  final List<String> listFavoutite;

  FavouriteCommentLoading({required this.id, required this.listFavoutite});

  @override
  List<Object?> get props => [id];
}

class FavouriteCommentSuccess extends ViewPostState {
  final String id;
  final List<String> listFavoutite;

  FavouriteCommentSuccess({required this.id, required this.listFavoutite});

  @override
  List<Object?> get props => [id];
}

class ChangeTextCommentState extends ViewPostState {
  @override
  // List<Object?> get props => [identityHashCode(this)];
  List<Object?> get props => [];
}

class ReplyCommentClickState extends ViewPostState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ViewReplyCommentLoading extends ViewPostState {
  final String commentID;

  ViewReplyCommentLoading(this.commentID);

  @override
  List<Object?> get props => [commentID];
}

class ViewReplyCommentSuccess extends ViewPostState {
  final List<CommentEntity> listComment;
  final String commentID;

  ViewReplyCommentSuccess({required this.listComment, required this.commentID});

  @override
  List<Object?> get props => [listComment, commentID];
}

class SharePostSuccess extends ViewPostState {
  @override
  // List<Object?> get props => [identityHashCode(this)];
  List<Object?> get props => [];
}

class DeletePostSuccess extends ViewPostState {
  @override
  // List<Object?> get props => [identityHashCode(this)];
  List<Object?> get props => [];
}
