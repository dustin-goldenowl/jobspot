import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/domain/router/save_job_coordinator.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class BottomSheetSaveJobOptionView extends StatelessWidget {
  const BottomSheetSaveJobOptionView({
    super.key,
    required this.job,
    required this.onDelete,
  });

  final JobEntity job;
  final Function(String jobID) onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
      width: double.infinity,
      height: 300,
      child: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.davyGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 50),
          _buildOption(
            onTap: () {
              context.router.pop();
              customToast(
                context,
                text: AppLocal.text.save_job_page_feature_not_yet_released,
              );
            },
            title: AppLocal.text.save_job_page_send_message,
            icon: AppImages.send,
          ),
          const SizedBox(height: 30),
          _buildOption(
            onTap: () {
              context.router.pop();
              customToast(
                context,
                text: AppLocal.text.save_job_page_feature_not_yet_released,
              );
            },
            title: AppLocal.text.save_job_page_share,
            icon: AppImages.share,
          ),
          const SizedBox(height: 30),
          _buildOption(
            onTap: () {
              context.router.pop();
              onDelete(job.id);
            },
            title: AppLocal.text.save_job_page_delete,
            icon: AppImages.trash,
          ),
          const SizedBox(height: 30),
          _buildOption(
            onTap: () {
              context.router.pop();
              SaveJobCoordinator.showApplyJob(job);
            },
            title: AppLocal.text.save_job_page_apply,
            icon: AppImages.checkCircle,
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter:
                ColorFilter.mode(AppColors.independence, BlendMode.srcIn),
          ),
          const SizedBox(width: 15),
          Text(title, style: AppStyles.normalTextHaiti)
        ],
      ),
    );
  }
}
