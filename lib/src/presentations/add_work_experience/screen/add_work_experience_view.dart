import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class AddWorkExperienceView extends StatelessWidget {
  const AddWorkExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.add_work_experience_page_add_work_experience,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        CustomTitleTextInput(
          controller: context.read<AddWorkExperienceCubit>().jobTitleController,
          title: AppLocal.text.add_work_experience_page_job_title,
          hintText: AppLocal.text.add_work_experience_page_job_title_hint,
        ),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddWorkExperienceCubit>().companyNameController,
          title: AppLocal.text.add_work_experience_page_company,
          hintText: AppLocal.text.add_work_experience_page_company,
        ),
        const SizedBox(height: 20),
        _buildDate(),
        const SizedBox(height: 20),
        _buildWorkNow(),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddWorkExperienceCubit>().descriptionController,
          title: AppLocal.text.add_work_experience_page_description,
          hintText: AppLocal.text.add_work_experience_page_description_content,
          maxLines: 8,
        ),
        const SizedBox(height: 40),
        _buildButton(context)
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: () {
              context
                  .read<AddWorkExperienceCubit>()
                  .showNotiChangeExperience(context, isRemove: true);
            },
            title: AppLocal.text.add_work_experience_page_remove.toUpperCase(),
            isElevated: false,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            onPressed: () {
              context
                  .read<AddWorkExperienceCubit>()
                  .showNotiChangeExperience(context);
            },
            title: AppLocal.text.add_work_experience_page_save,
          ),
        ),
      ],
    );
  }

  Widget _buildDate() {
    return BlocBuilder<AddWorkExperienceCubit, AddWorkExperienceState>(
      buildWhen: (previous, current) => previous.isWorkNow != current.isWorkNow,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _buildStartDate()),
            if (!state.isWorkNow) const SizedBox(width: 15),
            if (!state.isWorkNow) Expanded(child: _buildEndDate()),
          ],
        );
      },
    );
  }

  Widget _buildWorkNow() {
    return BlocBuilder<AddWorkExperienceCubit, AddWorkExperienceState>(
      buildWhen: (previous, current) => previous.isWorkNow != current.isWorkNow,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.isWorkNow,
              onChanged: (value) => context
                  .read<AddWorkExperienceCubit>()
                  .changeIsWorkNow(value!),
              activeColor: Colors.white,
              checkColor: AppColors.mulledWine,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              AppLocal.text.add_work_experience_page_position_now,
              style: AppStyles.normalTextMulledWine,
            )
          ],
        );
      },
    );
  }

  Widget _buildEndDate() {
    return BlocBuilder<AddWorkExperienceCubit, AddWorkExperienceState>(
      buildWhen: (previous, current) => previous.endDate != current.endDate,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<AddWorkExperienceCubit>().endDateController,
          title: AppLocal.text.add_work_experience_page_end_date,
          hintText: DateTimeUtils.formatMonthYear(DateTime.now()),
          onTap: () {
            context
                .read<AddWorkExperienceCubit>()
                .selectDate(context, isStartDate: false);
          },
        );
      },
    );
  }

  Widget _buildStartDate() {
    return BlocBuilder<AddWorkExperienceCubit, AddWorkExperienceState>(
      buildWhen: (previous, current) => previous.startDate != current.startDate,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller:
              context.read<AddWorkExperienceCubit>().startDateController,
          title: AppLocal.text.add_work_experience_page_start_date,
          hintText: DateTimeUtils.formatMonthYear(DateTime.now()),
          onTap: () {
            context.read<AddWorkExperienceCubit>().selectDate(context);
          },
        );
      },
    );
  }
}
