import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/home/data/models/job_model.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';

class RecentJobCard extends StatelessWidget {
  const RecentJobCard({
    super.key,
    required this.onTap,
    required this.onSave,
    required this.onApply,
    required this.jobModel,
  });

  final VoidCallback onTap;
  final VoidCallback onSave;
  final VoidCallback onApply;
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    final location = AppLists.provinces.firstWhere(
      (element) => element["code"] == jobModel.location,
    )["name"];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.wildBlueYonder.withAlpha(18),
              blurRadius: 62,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(location),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "\$${jobModel.salary}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "/Mo",
                    style: AppStyles.normalTextSpunPearl,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                TagItem(
                    title: AppLists.listTypeWorkplace[jobModel.typeWorkplace]
                        ["title"]!),
                const SizedBox(width: 8),
                TagItem(title: AppLists.listLevel[jobModel.level]),
                const Spacer(),
                GestureDetector(
                  onTap: onApply,
                  child: TagItem(
                    title: AppLocal.text.home_page_apply,
                    backgroundColor: AppColors.orangeRed.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader(location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: jobModel.company!.avatar.isEmpty
              ? SvgPicture.asset(AppImages.logo, height: 40, width: 40)
              : CachedNetworkImage(
                  imageUrl: jobModel.company!.avatar,
                  width: 40,
                  height: 40,
                  placeholder: (context, url) =>
                      const ItemLoading(width: 40, height: 40, radius: 0),
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobModel.position,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                "${jobModel.company!.name} • $location",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            AppImages.saveJob,
            width: 30,
            height: 30,
            colorFilter:
                ColorFilter.mode(AppColors.mulledWine, BlendMode.srcIn),
          ),
          onPressed: onSave,
        ),
      ],
    );
  }
}
