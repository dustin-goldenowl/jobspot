part of 'follow_cubit.dart';

class FollowState extends Equatable {
  const FollowState({this.listFollower, this.listFollowing, this.error});

  final List<UserEntity>? listFollowing;
  final List<UserEntity>? listFollower;
  final String? error;

  FollowState copyWith({
    List<UserEntity>? listFollowing,
    List<UserEntity>? listFollower,
    String? error,
  }) {
    return FollowState(
      listFollower: error != null ? this.listFollower : listFollower,
      listFollowing: error != null ? this.listFollowing : listFollowing,
      error: error,
    );
  }

  @override
  List<Object?> get props => [listFollower, listFollowing, error];
}
