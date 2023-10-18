import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';

class UploadedCVFile extends StatelessWidget {
  const UploadedCVFile({
    super.key,
    required this.fileName,
    required this.size,
    required this.time,
    required this.onRemove,
  });

  final String fileName;
  final int size;
  final DateTime time;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      color: AppColors.manatee,
      strokeWidth: 0.5,
      dashPattern: const [5],
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.interdimensionalBlue.withOpacity(0.1)),
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
                          fileName,
                          style: AppStyles.normalTextHaiti,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${size.getFileSizeString(decimals: 1)} - ${DateTimeUtils.formatCVTime(time)}",
                          style: AppStyles.normalTextSpunPearl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: onRemove,
                child: Row(
                  children: [
                    SvgPicture.asset(AppImages.trash,
                        colorFilter: ColorFilter.mode(
                          AppColors.venetianRed,
                          BlendMode.srcIn,
                        )),
                    const SizedBox(width: 10),
                    Text(
                      AppLocal.text.apply_job_page_remove_file,
                      style: TextStyle(color: AppColors.venetianRed),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
