part of 'view_post_bloc.dart';

abstract class ViewPostState extends Equatable {}

class ViewPostInitial extends ViewPostState {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SyncPostDataSuccess extends ViewPostState {
  final PostEntity post;

  SyncPostDataSuccess(this.post);

  @override
  List<Object?> get props => [post];
}

class GetCommentDataSuccess extends ViewPostState {
  final List<CommentEntity> listComment;

  GetCommentDataSuccess(this.listComment);

  @override
  List<Object?> get props => [listComment];
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
  List<Object?> get props => [identityHashCode(this)];
}

class ReplyCommentClickState extends ViewPostState {
  final CommentEntity comment;

  ReplyCommentClickState(this.comment);

  @override
  List<Object?> get props => [comment];
}
