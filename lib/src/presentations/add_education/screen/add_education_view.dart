import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class AddEducationView extends StatelessWidget {
  const AddEducationView({super.key});

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
          child: BlocListener<AddEducationCubit, AddEducationState>(
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
              key: context.read<AddEducationCubit>().formKey,
              child: _bulidBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulidBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.add_education_page_add_education,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        CustomTitleTextInput(
          controller:
              context.read<AddEducationCubit>().levelEducationController,
          title: AppLocal.text.add_education_page_level_education,
          hintText: AppLocal.text.add_education_page_level_education_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_education_page_level_education_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddEducationCubit>().institutionNameController,
          title: AppLocal.text.add_education_page_institution_name,
          hintText: AppLocal.text.add_education_page_institution_name_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_education_page_institution_name_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller: context.read<AddEducationCubit>().fieldStudyController,
          title: AppLocal.text.add_education_page_field_study,
          hintText: AppLocal.text.add_education_page_field_study_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_education_page_field_study_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        _buildDate(),
        const SizedBox(height: 20),
        _buildEducationNow(),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller: context.read<AddEducationCubit>().descriptionController,
          title: AppLocal.text.add_education_page_description,
          hintText: AppLocal.text.add_education_page_description_hint,
          maxLines: 8,
        ),
        const SizedBox(height: 40),
        _buildButton(context),
      ],
    );
  }

  Widget _buildDate() {
    return BlocBuilder<AddEducationCubit, AddEducationState>(
      buildWhen: (previous, current) => previous.isEduNow != current.isEduNow,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(child: _buildStartDate()),
            if (!state.isEduNow) const SizedBox(width: 15),
            if (!state.isEduNow) Expanded(child: _buildEndDate()),
          ],
        );
      },
    );
  }

  Widget _buildEndDate() {
    return BlocBuilder<AddEducationCubit, AddEducationState>(
      buildWhen: (previous, current) => previous.endDate != current.endDate,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<AddEducationCubit>().endDateController,
          hintText: DateTimeUtils.formatMonthYear(DateTime.now()),
          title: AppLocal.text.add_education_page_end_date,
          onTap: () {
            context
                .read<AddEducationCubit>()
                .selectDate(context, isStartDate: false);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_education_page_end_date_validate;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildStartDate() {
    return BlocBuilder<AddEducationCubit, AddEducationState>(
      buildWhen: (previous, current) => previous.startDate != current.startDate,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<AddEducationCubit>().startDateController,
          hintText: DateTimeUtils.formatMonthYear(DateTime.now()),
          title: AppLocal.text.add_education_page_start_date,
          onTap: () {
            context.read<AddEducationCubit>().selectDate(context);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_education_page_start_date_validate;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    final cubit = context.read<AddEducationCubit>();
    return Row(
      children: [
        if (cubit.isUpdate)
          Expanded(
            child: CustomButton(
              onPressed: () =>
                  cubit.showNotiChangeEducation(context, isRemove: true),
              title: AppLocal.text.add_education_page_remove,
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
                    .read<AddEducationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  cubit.showNotiChangeEducation(context);
                }
              },
              title: AppLocal.text.add_education_page_save.toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationNow() {
    return BlocBuilder<AddEducationCubit, AddEducationState>(
      buildWhen: (previous, current) => previous.isEduNow != current.isEduNow,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
              value: state.isEduNow,
              onChanged: (value) =>
                  context.read<AddEducationCubit>().changeIsEduNow(value!),
              activeColor: Colors.white,
              checkColor: AppColors.mulledWine,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              AppLocal.text.add_education_page_edu_now,
              style: AppStyles.normalTextMulledWine,
            )
          ],
        );
      },
    );
  }
}
