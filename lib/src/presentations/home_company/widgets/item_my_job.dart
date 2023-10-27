import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';

class ItemMyJob extends StatelessWidget {
  const ItemMyJob({super.key, required this.myJob, required this.onTap});

  final MyJobEntity myJob;
  final Function(String title, String jobID) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(myJob.position, myJob.id),
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 20),
        Text(
          AppLocal.text.home_company_page_applicant_applied(myJob.applicants),
          style: AppStyles.boldTextMulledWine,
        ),
        const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "\$${myJob.salary}",
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
                title: AppLists.listTypeWorkplace[myJob.typeWorkplace]
                    ["title"]!),
            const SizedBox(width: 8),
            TagItem(title: AppLists.listLevel[myJob.level]),
            const SizedBox(width: 8),
            TagItem(title: AppLists.listJobType[myJob.jobType]),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: PrefsUtils.getUserInfo()?.avatar ?? "",
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
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myJob.jobPosition.capitalizedString,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                timeago.format(myJob.startDate),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
