part of 'connection_cubit.dart';

class ConnectionState extends Equatable {
  const ConnectionState({this.posts});

  final List<PostModel>? posts;

  ConnectionState copyWith({List<PostModel>? posts}) {
    return ConnectionState(posts: posts);
  }

  @override
  List<Object?> get props => [posts];
}
