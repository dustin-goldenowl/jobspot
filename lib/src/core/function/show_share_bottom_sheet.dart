import 'package:flutter/material.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_base.dart';
import 'package:jobspot/src/presentations/connection/widgets/bottom_sheet_share_post.dart';

void showShareBottomSheet(
  BuildContext context, {
  required PostEntity post,
  UpdateSharePostEntity? update,
  required Function(SharePostBase entity) onShare,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    backgroundColor: AppColors.scaffoldBackground,
    builder: (_) => BottomSheetSharePost(
      onShare: onShare,
      post: post,
      update: update,
    ),
  );
}
