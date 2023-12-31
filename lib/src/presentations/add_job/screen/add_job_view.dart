import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/bloc/app_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/core/function/get_location.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart';
import 'package:jobspot/src/presentations/add_job/domain/router/add_job_coordinator.dart';
import 'package:jobspot/src/presentations/add_job/widgets/add_button.dart';

class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isUpdate = context.read<AddJobCubit>().isUpdate;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(FontAwesomeIcons.xmark),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          TextButton(
            onPressed: isUpdate
                ? context.read<AddJobCubit>().updateJob
                : context.read<AddJobCubit>().addJob,
            style: TextButton.styleFrom(foregroundColor: AppColors.deepSaffron),
            child: Text(
              isUpdate
                  ? AppLocal.text.add_post_page_update
                  : AppLocal.text.add_post_page_post,
            ),
          ),
        ],
      ),
      body: BlocListener<AddJobCubit, AddJobState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();
          return true;
        },
        listener: (context, state) {
          if (state.isLoading) loadingAnimation(context);

          if (state.dataState is DataSuccess) {
            customToast(
              context,
              text: isUpdate
                  ? AppLocal.text.add_job_page_update_successful_jobs
                  : AppLocal.text.add_job_page_create_successful_jobs,
            );
            context.read<AppBloc>().add(ChangeJobEvent());
            context.router.pop();
          }

          if (state.dataState is DataFailed) {
            customToast(context, text: state.dataState!.error ?? "");
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.add_job_page_add_job,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 32),
            _buildJobPosition(),
            const SizedBox(height: 10),
            _buildLevel(),
            const SizedBox(height: 10),
            _buildTypeWorkplace(),
            const SizedBox(height: 10),
            _buildLocation(),
            const SizedBox(height: 10),
            _buildJobType(),
            const SizedBox(height: 10),
            _buildJobDescription(),
            const SizedBox(height: 10),
            _buildJobRequirements(),
            const SizedBox(height: 10),
            _buildSalary(),
            const SizedBox(height: 10),
            _buildStartDate(),
            const SizedBox(height: 10),
            _buildEndDate(),
          ],
        ),
      ),
    );
  }

  Widget _buildEndDate() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) => previous.endDate != current.endDate,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_end_date,
          content: DateTimeUtils.formatDMY(state.endDate),
          onTap: () {
            context.read<AddJobCubit>().selectDate(context, isStartDate: false);
          },
        );
      },
    );
  }

  Widget _buildStartDate() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) => previous.startDate != current.startDate,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_start_date,
          content: DateTimeUtils.formatDMY(state.startDate),
          onTap: () {
            context.read<AddJobCubit>().selectDate(context);
          },
        );
      },
    );
  }

  Widget _buildSalary() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) => previous.salary != current.salary,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_salary,
          content: state.salary != -1 ? "${state.salary.toCurrency}\$" : null,
          onTap: () {
            context.read<AddJobCubit>().showBottomSheetSalary(context);
          },
        );
      },
    );
  }

  Widget _buildJobDescription() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_description,
          content: state.description.isEmpty ? null : state.description,
          isShowLine: true,
          onTap: () {
            AddJobCoordinator.showAddJobDescription(
              title: AppLocal.text.job_description_page_job_description,
              description: state.description,
              onBack: context.read<AddJobCubit>().changeJobDescription,
            );
          },
        );
      },
    );
  }

  Widget _buildJobRequirements() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) =>
          previous.requirements != current.requirements,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_requirements,
          isShowLine: true,
          child: state.requirements.isEmpty
              ? null
              : ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _buildItemRequirement(
                      context,
                      requirement: state.requirements[index],
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemCount: state.requirements.length,
                ),
          onTap: () {
            AddJobCoordinator.showAddJobDescription(
              title: AppLocal.text.add_job_page_job_requirement,
              description: "",
              onBack: context.read<AddJobCubit>().addJobRequirement,
            );
          },
        );
      },
    );
  }

  Widget _buildItemRequirement(
    BuildContext context, {
    required String requirement,
    required int index,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(requirement, style: AppStyles.normalTextMulledWine),
        ),
        GestureDetector(
          onTap: () {
            AddJobCoordinator.showAddJobDescription(
              title: AppLocal.text.add_job_page_job_requirement,
              description: requirement,
              onBack: (requirement) {
                context
                    .read<AddJobCubit>()
                    .editJobRequirement(requirement: requirement, index: index);
              },
            );
          },
          child: SvgPicture.asset(AppImages.edit),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            context.read<AddJobCubit>().removeJobRequirement(index);
          },
          child: Icon(FontAwesomeIcons.xmark, color: AppColors.orangeRed),
        )
      ],
    );
  }

  Widget _buildLevel() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) => previous.level != current.level,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_level,
          content: state.level != -1 ? AppLists.listLevel[state.level] : null,
          onTap: () {
            context
                .read<AddJobCubit>()
                .showBottomSheetLevel(context, groupValue: state.level);
          },
        );
      },
    );
  }

  Widget _buildLocation() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) =>
          previous.jobLocation != current.jobLocation,
      builder: (context, state) {
        String? province =
            state.jobLocation != -1 ? getLocation(state.jobLocation) : null;
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_job_location,
          content: province,
          onTap: () {
            AddJobCoordinator.showJobLocation(
                onBack: context.read<AddJobCubit>().changeJobLocation);
          },
        );
      },
    );
  }

  Widget _buildJobPosition() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) =>
          previous.jobPosition != current.jobPosition,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_job_position,
          content: state.jobPosition.isEmpty ? null : state.jobPosition,
          onTap: () {
            AddJobCoordinator.showJobPosition(
                onBack: context.read<AddJobCubit>().changeJobPosition);
          },
        );
      },
    );
  }

  Widget _buildTypeWorkplace() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) =>
          previous.typeWorkplace != current.typeWorkplace,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_type_workplace,
          content: state.typeWorkplace != -1
              ? AppLists.listTypeWorkplace[state.typeWorkplace]["title"]
              : null,
          onTap: () {
            context.read<AddJobCubit>().showBottomSheetTypeWorkplace(
                  context,
                  groupValue: state.typeWorkplace,
                );
          },
        );
      },
    );
  }

  Widget _buildJobType() {
    return BlocBuilder<AddJobCubit, AddJobState>(
      buildWhen: (previous, current) => previous.jobType != current.jobType,
      builder: (context, state) {
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_employment_type,
          content:
              state.jobType != -1 ? AppLists.listJobType[state.jobType] : null,
          onTap: () {
            context
                .read<AddJobCubit>()
                .showBottomSheetJobType(context, groupValue: state.jobType);
          },
        );
      },
    );
  }

  Widget _buildJobInfo({
    required String title,
    String? content,
    Widget? child,
    bool isShowLine = false,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.wildBlueYonder.withAlpha(18),
            blurRadius: 62,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      constraints: const BoxConstraints(minHeight: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyles.boldTextHaiti),
              AddButton(isShowEdit: content != null, onTap: onTap),
            ],
          ),
          if (isShowLine && content != null) const SizedBox(height: 10),
          if (isShowLine && (content != null || child != null))
            Divider(color: AppColors.platinum, thickness: 0.5),
          if (content != null || child != null) const SizedBox(height: 10),
          if (content != null)
            Text(content, style: AppStyles.normalTextMulledWine),
          if (child != null) child,
        ],
      ),
    );
  }
}
