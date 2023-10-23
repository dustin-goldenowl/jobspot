part of 'view_post_bloc.dart';

abstract class ViewPostEvent extends Equatable {}

class SyncPostDataEvent extends ViewPostEvent {
  final PostEntity? post;
  final String? postID;

  SyncPostDataEvent({this.post, this.postID});

  @override
  List<Object?> get props => [post, postID];
}

class SendPostDataEvent extends ViewPostEvent {
  final PostEntity post;

  SendPostDataEvent(this.post);

  @override
  List<Object?> get props => [post];
}

class GetListCommentEvent extends ViewPostEvent {
  final List<String> listComment;
  final bool isLoading;

  GetListCommentEvent({required this.listComment, this.isLoading = false});

  @override
  List<Object?> get props => [listComment];
}

class GetReplyCommentEvent extends ViewPostEvent {
  final String commentID;

  GetReplyCommentEvent(this.commentID);

  @override
  List<Object?> get props => [commentID];
}

class SendCommentEvent extends ViewPostEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class FavouritePostEvent extends ViewPostEvent {
  final List<String> listFavourist;

  FavouritePostEvent(this.listFavourist);

  @override
  List<Object?> get props => [listFavourist];
}

class FavouriteCommentEvent extends ViewPostEvent {
  final String id;
  final List<String> listFavourite;

  FavouriteCommentEvent({required this.id, required this.listFavourite});

  @override
  List<Object?> get props => [id, listFavourite];
}

class ChangeTextCommentEvent extends ViewPostEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class RequestCommentEvent extends ViewPostEvent {
  final bool isComment;

  RequestCommentEvent(this.isComment);

  @override
  List<Object?> get props => [isComment];
}

class ReplyCommentClickEvent extends ViewPostEvent {
  final CommentEntity? comment;

  ReplyCommentClickEvent([this.comment]);

  @override
  List<Object?> get props => [comment];
}

class ReplyCommentEvent extends ViewPostEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ViewReplyCommentEvent extends ViewPostEvent {
  final String commentID;

  ViewReplyCommentEvent(this.commentID);

  @override
  List<Object?> get props => [commentID];
}

class DeleteCommentEvent extends ViewPostEvent {
  final String commentID;

  DeleteCommentEvent(this.commentID);

  @override
  List<Object?> get props => [commentID];
}
