import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart';
import 'package:jobspot/src/presentations/apply_job/domain/router/apply_job_coordinator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/widgets/custom_app_bar_company.dart';
import 'package:jobspot/src/presentations/view_job/widgets/job_title_info.dart';

class ApplyJobView extends StatelessWidget {
  const ApplyJobView({super.key, required this.job});

  final JobEntity job;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      buildWhen: (previous, current) => current.dataState is DataSuccess,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: state.dataState is! DataSuccess
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: AppDimens.smallPadding,
                  ),
                  child: CustomButton(
                    onPressed: () =>
                        context.read<ApplyJobCubit>().applyJob(job.id),
                    title: AppLocal.text.apply_job_page_apply_job.toUpperCase(),
                  ),
                )
              : null,
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.smallPadding),
              child: BlocListener<ApplyJobCubit, ApplyJobState>(
                listenWhen: (previous, current) {
                  if (previous.isLoading) Navigator.of(context).pop();
                  return true;
                },
                listener: (context, state) {
                  if (state.isLoading) loadingAnimation(context);

                  if (state.dataState is DataFailed) {
                    customToast(context, text: state.dataState!.error ?? "");
                  }
                },
                child: state.dataState is DataSuccess
                    ? _buildBodyApplySuccess(context)
                    : _buildBodyUploadCV(context),
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 240),
      child: CustomAppBarCompany(
        avatar: job.company.avatar,
        companyName: job.company.name,
        jobPosition: job.jobPosition,
        time: timeago.format(job.startDate),
        location: job.company.address,
      ),
    );
  }

  Widget _buildBodyApplySuccess(BuildContext context) {
    return Column(
      children: [
        _buildCVSuccess(context),
        const SizedBox(height: 20),
        SvgPicture.asset(
          AppImages.applySuccess,
          width: MediaQuery.sizeOf(context).width / 2,
        ),
        const SizedBox(height: 32),
        Text(
          AppLocal.text.apply_job_page_successful,
          style: AppStyles.boldTextJacarta.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          AppLocal.text.apply_job_page_successful_content,
          style: AppStyles.normalTextMulledWine,
        ),
        const SizedBox(height: 40),
        CustomButton(
          width: 260,
          onPressed: ApplyJobCoordinator.backToHome,
          title: AppLocal.text.apply_job_page_find_similar_job,
          isElevated: false,
        ),
        const SizedBox(height: 20),
        CustomButton(
          width: 260,
          onPressed: ApplyJobCoordinator.backToHome,
          title: AppLocal.text.apply_job_page_back_to_home,
        )
      ],
    );
  }

  ClipRRect _buildCVSuccess(BuildContext context) {
    final cubit = context.read<ApplyJobCubit>();
    return ClipRRect(
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
                        cubit.state.file!.name,
                        style: AppStyles.normalTextHaiti,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${cubit.state.file!.size.getFileSizeString(decimals: 1)} - ${DateTimeUtils.formatCVTime(cubit.state.time!)}",
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

  Widget _buildBodyUploadCV(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobTitleInfo(
          title: AppLocal.text.apply_job_page_upload_CV,
          child: Text(
            AppLocal.text.apply_job_page_upload_CV_content,
            style: AppStyles.normalTextNightBlue,
          ),
        ),
        const SizedBox(height: 20),
        _buildCVWidget(),
        const SizedBox(height: 30),
        JobTitleInfo(
          title: AppLocal.text.apply_job_page_information,
          child: TextFormField(
            controller: context.read<ApplyJobCubit>().controller,
            maxLines: 8,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: AppColors.spunPearl,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              hintText: AppLocal.text.apply_job_page_information_hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCVWidget() {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        if (state.file != null) {
          return _buildUploadedCVFile(context);
        } else {
          return _buildPickCVFile(context);
        }
      },
    );
  }

  Widget _buildUploadedCVFile(BuildContext context) {
    final cubit = context.read<ApplyJobCubit>();
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
                          cubit.state.file!.name,
                          style: AppStyles.normalTextHaiti,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${cubit.state.file!.size.getFileSizeString(decimals: 1)} - ${DateTimeUtils.formatCVTime(cubit.state.time!)}",
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
                onTap: cubit.removeCV,
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

  Widget _buildPickCVFile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ApplyJobCubit>().pickCVFile(context),
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