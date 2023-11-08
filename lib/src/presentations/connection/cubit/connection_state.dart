part of 'connection_cubit.dart';

class ConnectionState extends Equatable {
  const ConnectionState({
    this.posts,
    required this.isMore,
    this.error,
    required this.isLoading,
  });

  final bool isLoading;
  final List<PostEntity>? posts;
  final bool isMore;
  final String? error;

  ConnectionState copyWith({
    List<PostEntity>? posts,
    bool? isMore,
    String? error,
    bool isLoading = false,
  }) {
    return ConnectionState(
      isLoading: isLoading,
      posts: posts,
      isMore: isMore ?? this.isMore,
      error: error,
    );
  }

  @override
  List<Object?> get props => [posts, isMore, error, isLoading];
}
