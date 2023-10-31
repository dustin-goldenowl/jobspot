import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/follow/cubit/follow_cubit.dart';
import 'package:jobspot/src/presentations/follow/screen/follow_view.dart';

@RoutePage()
class FollowPage extends StatelessWidget {
  const FollowPage({
    super.key,
    this.follower,
    this.following,
    this.title,
    required this.index,
  });

  final List<String>? following;
  final List<String>? follower;
  final String? title;
  final int index;

  @override
  Widget build(BuildContext context) {
    UserEntity user = PrefsUtils.getUserInfo()!;
    return BlocProvider(
      create: (context) => getIt<FollowCubit>()
        ..getListFollower(follower: follower ?? user.follower)
        ..getListFollowing(following: following ?? user.following),
      child: FollowView(index: index, title: title),
    );
  }
}
