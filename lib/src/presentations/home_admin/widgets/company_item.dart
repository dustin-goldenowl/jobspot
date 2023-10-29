import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/company_entity.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({
    super.key,
    required this.company,
    required this.onConsider,
    required this.onViewCompany,
  });

  final Function(VerifyStatus status) onConsider;
  final Function(String uid) onViewCompany;
  final CompanyEntity company;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            _buildHeader(),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => onConsider(VerifyStatus.accept),
                    title:
                        AppLocal.text.view_job_applicant_accept.toUpperCase(),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomButton(
                    isElevated: false,
                    onPressed: () => onConsider(VerifyStatus.decline),
                    title:
                        AppLocal.text.view_job_applicant_reject.toUpperCase(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onViewCompany(company.id),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: company.avatar,
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
                onTap: () => onViewCompany(company.id),
                child: Text(
                  company.name,
                  style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                company.address,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
