import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';

@RoutePage()
class PostTab extends StatelessWidget {
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicantProfileCubit, ApplicantProfileState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (state.listPost != null) {
              return PostItem(
                post: state.listPost![index],
                onComment: () {},
                onFavourite: () {},
                onShare: () {},
                onViewFullPost: () {},
                onViewProfile: () {},
              );
            }
            return const CircularProgressIndicator();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.listPost?.length ?? 10,
        );
      },
    );
  }
}
