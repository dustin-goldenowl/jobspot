import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';
import 'package:jobspot/src/presentations/home_admin/domain/router/home_admin_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    required this.verify,
    required this.onConsider,
    required this.onViewCompany,
  });

  final Function(VerifyStatus status) onConsider;
  final Function(String uid) onViewCompany;
  final VerifyCompanyEntity verify;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Text(
            verify.description,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          _buildResumeFile(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () => onConsider(VerifyStatus.accept),
                  title: AppLocal.text.view_job_applicant_accept.toUpperCase(),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  isElevated: false,
                  onPressed: () => onConsider(VerifyStatus.decline),
                  title: AppLocal.text.view_job_applicant_reject.toUpperCase(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onViewCompany(verify.company.id),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: verify.company.avatar,
              width: 40,
              height: 40,
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(AppImages.logo, height: 40, width: 40),
              placeholder: (context, url) =>
                  const ItemLoading(width: 40, height: 40, radius: 0),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onViewCompany(verify.company.id),
                child: Text(
                  verify.company.name,
                  style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                verify.company.address,
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
      onTap: () => HomeAdminCoordinator.viewPDF(verify.file),
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
                        verify.fileName,
                        style: AppStyles.normalTextHaiti,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${verify.size.getFileSizeString(decimals: 1)} - ${DateTimeUtils.formatCVTime(verify.createAt)}",
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
