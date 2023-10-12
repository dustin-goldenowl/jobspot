import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/cubit/view_post_cubit.dart';
import 'package:jobspot/src/presentations/view_post/screen/view_post_view.dart';

@RoutePage()
class ViewPostPage extends StatelessWidget {
  const ViewPostPage({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewPostCubit>()..initPost(post),
      child: const ViewPostView(),
    );
  }
}
