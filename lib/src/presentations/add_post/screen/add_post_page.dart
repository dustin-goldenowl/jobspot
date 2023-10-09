import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart';
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart';
import 'package:jobspot/src/presentations/add_post/screen/add_post_view.dart';

@RoutePage()
class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key, this.post});

  final UpdatePostEntity? post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddPostCubit>()..initUpdatePost(post),
      child: const AddPostView(),
    );
  }
}
