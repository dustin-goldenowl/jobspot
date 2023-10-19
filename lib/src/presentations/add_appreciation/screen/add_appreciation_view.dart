import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class AddAppreciationView extends StatelessWidget {
  const AddAppreciationView({super.key});

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
          child: BlocListener<AddAppreciationCubit, AddAppreciationState>(
            listenWhen: (previous, current) {
              if (previous.isLoading) Navigator.of(context).pop();

              if (previous.isLoading && current.error == null) {
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
              key: context.read<AddAppreciationCubit>().formKey,
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
          AppLocal.text.add_appreciation_page_add_appreciation,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        CustomTitleTextInput(
          controller: context.read<AddAppreciationCubit>().awardNameController,
          title: AppLocal.text.add_appreciation_page_award_name,
          hintText: AppLocal.text.add_appreciation_page_award_name_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_appreciation_page_award_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddAppreciationCubit>().achievementController,
          title: AppLocal.text.add_appreciation_page_category,
          hintText: AppLocal.text.add_appreciation_page_category_hint,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_appreciation_page_category_validate;
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        _buildEndDate(),
        const SizedBox(height: 20),
        CustomTitleTextInput(
          controller:
              context.read<AddAppreciationCubit>().descriptionController,
          title: AppLocal.text.add_appreciation_page_description,
          hintText: AppLocal.text.add_appreciation_page_description_hint,
          maxLines: 8,
        ),
        const SizedBox(height: 40),
        _buildButton(context)
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    final cubit = context.read<AddAppreciationCubit>();
    return Row(
      children: [
        if (cubit.isUpdate)
          Expanded(
            child: CustomButton(
              onPressed: () =>
                  cubit.showNotiChangeAppreciation(context, isRemove: true),
              title: AppLocal.text.add_appreciation_page_remove.toUpperCase(),
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
                    .read<AddAppreciationCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  cubit.showNotiChangeAppreciation(context);
                }
              },
              title: AppLocal.text.add_appreciation_page_save.toUpperCase(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEndDate() {
    return BlocBuilder<AddAppreciationCubit, AddAppreciationState>(
      buildWhen: (previous, current) => previous.endDate != current.endDate,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<AddAppreciationCubit>().endDateController,
          title: AppLocal.text.add_work_experience_page_end_date,
          hintText: DateTimeUtils.formatMonthYear(DateTime.now()),
          onTap: () => context.read<AddAppreciationCubit>().selectDate(context),
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.add_appreciation_page_end_date_validate;
            }
            return null;
          },
        );
      },
    );
  }
}
