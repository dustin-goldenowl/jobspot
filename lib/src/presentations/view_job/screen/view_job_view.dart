import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/widgets/custom_app_bar_company.dart';
import 'package:jobspot/src/presentations/view_job/widgets/job_subtitle_info.dart';
import 'package:jobspot/src/presentations/view_job/widgets/job_title_info.dart';

final list = [
  "Sed ut perspiciatis unde omnis iste natus error sit.",
  "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
  "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
  "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur",
];

class ViewJobView extends StatelessWidget {
  const ViewJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCompany(
        width: MediaQuery.sizeOf(context).width,
        onMore: () {},
        onPop: () => context.router.pop(),
      ),
      bottomNavigationBar: _buildBottomBar(context),
      body: RefreshIndicator(
        onRefresh: context.read<ViewJobCubit>().fetchJobData,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.smallPadding),
            child: BlocListener<ViewJobCubit, ViewJobState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDescription(),
                  const SizedBox(height: 20),
                  _buildBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ViewJobCubit, ViewJobState>(
      buildWhen: (previous, current) => current is! DataFailed,
      builder: (context, state) {
        if (state.dataState is DataSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRequirements(),
              const SizedBox(height: 20),
              _buildLocation("Overlook Avenue, Belleville, NJ, USA"),
              const SizedBox(height: 20),
              _buildInformation(state.dataState!.data!),
              // const SizedBox(height: 20),
              // _buildFacilitiesAndOthers(),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.pastelBlue.withAlpha(20),
            blurRadius: 83,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      height: 80,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 80,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SvgPicture.asset(
              AppImages.saveJob,
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: CustomButton(
              onPressed: () {
                //TODO tap to apply job
              },
              title: "APPLY NOW",
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInformation(JobEntity job) {
    return JobTitleInfo(
      title: "Informations",
      child: Column(
        children: [
          JobSubtitleInfo(
            title: "Position",
            content: job.jobPosition,
          ),
          JobSubtitleInfo(
            title: "Level",
            content: AppLists.listLevel[job.level],
          ),
          JobSubtitleInfo(
            title: "Job Type",
            content: AppLists.listJobType[job.jobType],
          ),
        ],
      ),
    );
  }

  Widget _buildLocation(String location) {
    return JobTitleInfo(
      title: "Location",
      child: Text(location, style: TextStyle(color: AppColors.mulledWine)),
    );
  }

  Widget _buildRequirements() {
    return JobTitleInfo(
      title: "Requirements",
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              _buildDotText,
              const SizedBox(width: 10),
              Expanded(
                child: Text(list[index], style: AppStyles.normalTextMulledWine),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: list.length,
      ),
    );
  }

  Widget _buildDescription() {
    return BlocBuilder<ViewJobCubit, ViewJobState>(
      buildWhen: (previous, current) => current is! DataFailed,
      builder: (context, state) {
        final description = state.dataState?.data!.description ?? "";
        return JobTitleInfo(
          title: "Job Description",
          child: LayoutBuilder(
            builder: (context, constraints) {
              var span = TextSpan(
                text: description,
                style: AppStyles.normalTextMulledWine,
              );

              var tp = TextPainter(
                maxLines: state.isReadMore ? null : 5,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
                text: span,
              );

              tp.layout(maxWidth: constraints.maxWidth);
              var isOverflow = tp.didExceedMaxLines;

              return _buildTextDescription(
                context,
                description: description,
                isReadMore: state.isReadMore,
                isOverflow: isOverflow,
              );
            },
          ),
        );
      },
    );
  }

  Column _buildTextDescription(
    BuildContext context, {
    required String description,
    required bool isReadMore,
    required bool isOverflow,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          textAlign: TextAlign.justify,
          maxLines: isReadMore ? null : 5,
          overflow: isReadMore ? null : TextOverflow.ellipsis,
          style: AppStyles.normalTextMulledWine,
        ),
        if (isOverflow) const SizedBox(height: 8),
        if (isOverflow)
          GestureDetector(
            onTap: context.read<ViewJobCubit>().readMore,
            child: TagItem(
              title: "Read more",
              backgroundColor: AppColors.veryLightBlue.withOpacity(0.2),
            ),
          ),
      ],
    );
  }

  Widget get _buildDotText =>
      Text("•", style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25));

  // TODO It may be added later or removed from the project
  Widget _buildFacilitiesAndOthers() {
    return JobTitleInfo(
      title: "Facilities and Others",
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              _buildDotText,
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "listFacilities[index]",
                  style: TextStyle(color: AppColors.mulledWine),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 10, //listFacilities.length,
      ),
    );
  }
}
