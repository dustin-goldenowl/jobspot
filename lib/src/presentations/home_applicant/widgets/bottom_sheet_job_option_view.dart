import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:jobspot/src/core/service/dynamic_link_service.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class BottomSheetJobOptionView extends StatelessWidget {
  const BottomSheetJobOptionView({
    super.key,
    required this.job,
    required this.onSave,
    required this.onApply,
  });

  final JobEntity job;
  final VoidCallback onSave;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    bool check = PrefsUtils.getUserInfo()!.saveJob!.contains(job.id);
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
            onTap: () async {
              final link = await DynamicLinkService.createDynamicLink(
                  type: "job", id: job.id);
              await Share.share(AppLocal.text
                  .share_job_content(link, job.jobPosition.capitalizedString));
              if (context.mounted) context.router.pop();
            },
            title: AppLocal.text.save_job_page_share,
            icon: AppImages.share,
          ),
          const SizedBox(height: 30),
          _buildOption(
            onTap: () {
              context.router.pop();
              onSave();
            },
            size: 25,
            title: check ? AppLocal.text.unsave : AppLocal.text.save,
            icon: check ? AppImages.saved : AppImages.saveJob,
            iconColor: check ? AppColors.deepSaffron : null,
          ),
          const SizedBox(height: 30),
          _buildOption(
            onTap: () {
              context.router.pop();
              onApply();
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
    Color? iconColor,
    double? size,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
                iconColor ?? AppColors.independence, BlendMode.srcIn),
            width: size,
            height: size,
          ),
          const SizedBox(width: 15),
          Text(title, style: AppStyles.normalTextHaiti)
        ],
      ),
    );
  }
}
