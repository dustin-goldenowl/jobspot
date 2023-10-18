import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
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
          child: BlocListener<AddWorkExperienceCubit, AddWorkExperienceState>(
            listenWhen: (previous, current) {
              if (previous.isLoading && current.error == null) {
                Navigator.of(context).pop();
                context.router.pop();
              }
              return true;
            },
            listener: (context, state) {
              if (state.isLoading) loadingAnimation(context);

              if (state.error != null) {
                customToast(context, text: state.error ?? "");
              }
            },
            child: Form(
              key: context.read<AddWorkExperienceCubit>().formKey,
              child: _buildBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.read<AddWorkExperienceCubit>().isUpdate
              ? AppLocal.text.add_work_experience_page_update_work_experience
              : AppLocal.text.add_work_experience_page_add_work_experience,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        CustomTitleTextInput(
          controller: context.read<AddWorkExperienceCubit>().jobTitleController,
          title: AppLocal.text.add_work_experience_page_job_title,
          hintText: AppLocal.text.add_work_experience_page_job_title_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_work_experience_page_job_title_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddWorkExperienceCubit>().companyNameController,
          title: AppLocal.text.add_work_experience_page_company,
          hintText: AppLocal.text.add_work_experience_page_company,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_work_experience_page_company_validate;
            }
            return null;
          },
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
    final cubit = context.read<AddWorkExperienceCubit>();
    return Row(
      children: [
        if (cubit.isUpdate)
          Expanded(
            child: CustomButton(
              onPressed: () =>
                  cubit.showNotiChangeExperience(context, isRemove: true),
              title:
                  AppLocal.text.add_work_experience_page_remove.toUpperCase(),
              isElevated: false,
            ),
          ),
        if (cubit.isUpdate) const SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: cubit.isUpdate
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 60),
            child: CustomButton(
              onPressed: () {
                if (context
                    .read<AddWorkExperienceCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  cubit.showNotiChangeExperience(context);
                }
              },
              title: AppLocal.text.add_work_experience_page_save,
            ),
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
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_work_experience_page_end_date_validate;
            }
            return null;
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
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_work_experience_page_start_date_validate;
            }
            return null;
          },
        );
      },
    );
  }
}
