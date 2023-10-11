import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/job_description/cubit/job_description_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class JobDescriptionView extends StatelessWidget {
  const JobDescriptionView({super.key, required this.onBack});

  final Function(String description) onBack;

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
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: CustomButton(
              onPressed: () {
                context
                    .read<JobDescriptionCubit>()
                    .showNotiChangeAbout(context, onSave: onBack);
              },
              title: AppLocal.text.job_description_page_save,
            ),
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocal.text.job_description_page_job_description,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 30),
          CustomTitleTextInput(
            controller:
                context.read<JobDescriptionCubit>().descriptionController,
            hintText: AppLocal.text.job_description_page_job_description,
            maxLines: 8,
          ),
        ],
      ),
    );
  }
}
