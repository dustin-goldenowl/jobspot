import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

class ListResumeBottomSheet extends StatelessWidget {
  const ListResumeBottomSheet({
    super.key,
    required this.onTap,
    required this.pickPDF,
    this.listResume,
  });

  final Function(ResumeEntity resume) onTap;
  final VoidCallback pickPDF;
  final List<ResumeEntity>? listResume;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildPickCVFile();
          }
          if (listResume != null) {
            return _buildItemResume(listResume![index - 1]);
          }
          return const ItemLoading(
              width: double.infinity, height: 16, radius: 5);
        },
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemCount: (listResume?.length ?? 9) + 1,
      ),
    );
  }

  Widget _buildItemResume(ResumeEntity resume) {
    return GestureDetector(
      onTap: () => onTap(resume),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.interdimensionalBlue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.pdf),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resume.fileName,
                    style: AppStyles.normalTextHaiti.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${resume.size.getFileSizeString()} . ${DateTimeUtils.formatCVTime(resume.createAt)}",
                    style:
                        TextStyle(color: AppColors.romanSilver, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickCVFile() {
    return GestureDetector(
      onTap: pickPDF,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: AppColors.manatee,
        strokeWidth: 0.5,
        dashPattern: const [5],
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: SizedBox(
            height: 75,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.upload, width: 24),
                    const SizedBox(width: 15),
                    Text(
                      AppLocal.text.apply_job_page_upload_resume,
                      style: AppStyles.normalTextHaiti,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  AppLocal.text.apply_job_page_maximum_size,
                  style: AppStyles.normalTextSpunPearl.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
