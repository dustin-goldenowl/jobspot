import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/app_lists.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart';
import 'package:jobspot/src/presentations/add_job/domain/router/add_job_coordinator.dart';
import 'package:jobspot/src/presentations/add_job/widgets/add_button.dart';

class AddJobView extends StatelessWidget {
  const AddJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(FontAwesomeIcons.xmark),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColors.deepSaffron),
            child: Text(AppLocal.text.add_post_page_post),
          ),
        ],
      ),
      body: _buildBody(context),
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
            _buildTypeWorkplace(),
            const SizedBox(height: 10),
            _buildLocation(),
            const SizedBox(height: 10),
            _buildJobType(),
            const SizedBox(height: 10),
            _buildJobDescription(),
          ],
        ),
      ),
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
            //TODO push to description screen
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
        return _buildJobInfo(
          title: AppLocal.text.add_job_page_job_location,
          onTap: () {
            // TODO push to location screen
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
              onChange: (value) {
                context.router.pop();
                context.read<AddJobCubit>().changeTypeWorkplace(value!);
              },
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
            context.read<AddJobCubit>().showBottomSheetJobType(
              context,
              groupValue: state.jobType,
              onChange: (value) {
                context.router.pop();
                context.read<AddJobCubit>().changeJobType(value!);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildJobInfo({
    required String title,
    String? content,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.boldTextHaiti),
              if (isShowLine && content != null) const SizedBox(height: 10),
              if (isShowLine && content != null)
                Divider(color: AppColors.platinum, thickness: 0.5),
              if (content != null) const SizedBox(height: 10),
              if (content != null)
                Text(content, style: AppStyles.normalTextMulledWine),
            ],
          ),
          AddButton(isShowEdit: content != null, onTap: onTap),
        ],
      ),
    );
  }
}
