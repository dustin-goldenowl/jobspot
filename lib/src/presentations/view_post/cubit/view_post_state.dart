part of 'view_post_cubit.dart';

class ViewPostState extends Equatable {
  const ViewPostState({this.litsComment, this.post});

  final List<CommentEntity>? litsComment;
  final PostEntity? post;

  ViewPostState copyWith({List<CommentEntity>? litsComment, PostEntity? post}) {
    return ViewPostState(
      litsComment: litsComment ?? this.litsComment,
      post: post ?? this.post,
    );
  }

  @override
  List<Object?> get props => [litsComment, post];
}
