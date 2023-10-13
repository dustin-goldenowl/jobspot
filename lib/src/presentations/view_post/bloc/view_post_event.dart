part of 'view_post_bloc.dart';

abstract class ViewPostEvent extends Equatable {}

class SyncPostDataEvent extends ViewPostEvent {
  final PostEntity? post;

  SyncPostDataEvent([this.post]);

  @override
  List<Object?> get props => [post];
}

class SendPostDataEvent extends ViewPostEvent {
  final PostEntity post;

  SendPostDataEvent(this.post);

  @override
  List<Object?> get props => [post];
}

class GetListCommentFirstLevelEvent extends ViewPostEvent {
  final List<String> listComment;

  GetListCommentFirstLevelEvent(this.listComment);

  @override
  List<Object?> get props => [listComment];
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

class ReplyCommentClickEvent extends ViewPostEvent {
  final CommentEntity comment;

  ReplyCommentClickEvent(this.comment);

  @override
  List<Object?> get props => [comment];
}

class ReplyCommentEvent extends ViewPostEvent {
  @override
  List<Object?> get props => [identityHashCode(this)];
}
