import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/src/presentations/connection/widgets/post_item.dart';

@RoutePage()
class ViewCompanyPostTab extends StatelessWidget {
  const ViewCompanyPostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Text("post");
        // return PostItem(
        //   post: post,
        //   onFavourite: onFavourite,
        //   onComment: onComment,
        //   onShare: onShare,
        //   onViewFullPost: onViewFullPost,
        //   onViewProfile: onViewProfile,
        // );
      },
    );
  }
}
