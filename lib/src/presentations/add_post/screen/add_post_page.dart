import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_post/cubit/add_post_cubit.dart';
import 'package:jobspot/src/presentations/add_post/screen/add_post_view.dart';

@RoutePage()
class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddPostCubit>(),
      child: const AddPostView(),
    );
  }
}
