part of 'connection_cubit.dart';

class ConnectionState extends Equatable {
  const ConnectionState({this.posts, required this.isMore});

  final List<PostModel>? posts;
  final bool isMore;

  ConnectionState copyWith({List<PostModel>? posts, bool? isMore}) {
    return ConnectionState(posts: posts, isMore: isMore ?? this.isMore);
  }

  @override
  List<Object?> get props => [posts, isMore];
}
