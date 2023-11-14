import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/get_location.dart';
import 'package:jobspot/src/presentations/home_applicant/widgets/bottom_sheet_job_option_view.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class RecentJobCard extends StatelessWidget {
  const RecentJobCard({
    super.key,
    required this.onTap,
    required this.onSave,
    required this.onApply,
    required this.job,
    required this.isSave,
  });

  final VoidCallback onTap;
  final VoidCallback onSave;
  final VoidCallback onApply;
  final JobEntity job;
  final bool isSave;

  @override
  Widget build(BuildContext context) {
    final location = getLocation(job.location);
    return GestureDetector(
      onTap: onTap,
      onLongPress: () => showBottomSheetOption(context),
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
            Text(
              "\$${job.salary.toCurrency}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TagItem(
                      title: AppLists.listTypeWorkplace[job.typeWorkplace]
                          ["title"]!),
                  const SizedBox(width: 8),
                  TagItem(title: AppLists.listLevel[job.level]),
                  const SizedBox(width: 8),
                  const SizedBox(width: 8),
                  TagItem(title: AppLists.listJobType[job.jobType]),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: AppLocal.text.home_page_apply,
              onPressed: onApply,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: job.company.avatar.isEmpty
              ? SvgPicture.asset(AppImages.logo, height: 40, width: 40)
              : CachedNetworkImage(
                  imageUrl: job.company.avatar,
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
                job.position.capitalizedString,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                "${job.company.name} • $location",
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            isSave ? AppImages.saved : AppImages.saveJob,
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
              isSave ? AppColors.deepSaffron : AppColors.mulledWine,
              BlendMode.srcIn,
            ),
          ),
          onPressed: onSave,
        ),
      ],
    );
  }

  void showBottomSheetOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) =>
          BottomSheetJobOptionView(job: job, onSave: onSave, onApply: onApply),
    );
  }
}
