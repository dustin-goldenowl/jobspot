import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/router/view_job_applicant_coordinator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/constants/constants.dart';

class ItemResumeApplicant extends StatelessWidget {
  const ItemResumeApplicant({
    super.key,
    required this.resume,
    required this.onAccept,
    required this.onReject,
  });

  final ResumeApplicantEntity resume;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 20),
        Text(
          resume.description,
          style: AppStyles.normalTextMulledWine,
        ),
        const SizedBox(height: 15),
        _buildResumeFile(),
        if (resume.isAccept == null) const SizedBox(height: 15),
        if (resume.isAccept == null)
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: onAccept,
                  title: AppLocal.text.view_job_applicant_accept.toUpperCase(),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  isElevated: false,
                  onPressed: onReject,
                  title: AppLocal.text.view_job_applicant_reject.toUpperCase(),
                ),
              )
            ],
          ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => ViewJobApplicantCoordinator.showApplicantProfile(
              resume.applicant.id),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: resume.applicant.avatar,
              width: 40,
              height: 40,
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(AppImages.logo),
              placeholder: (context, url) => const ItemLoading(
                width: 40,
                height: 40,
                radius: 0,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => ViewJobApplicantCoordinator.showApplicantProfile(
                    resume.applicant.id),
                child: Text(
                  resume.applicant.name,
                  style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                timeago.format(resume.createAt),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResumeFile() {
    return GestureDetector(
      onTap: () => ViewJobApplicantCoordinator.viewPDF(resume.resume.file),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.interdimensionalBlue.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImages.pdf, height: 45),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resume.resume.fileName,
                        style: AppStyles.normalTextHaiti,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${resume.resume.size.getFileSizeString(decimals: 1)} - ${DateTimeUtils.formatCVTime(resume.resume.createAt)}",
                        style: AppStyles.normalTextSpunPearl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
