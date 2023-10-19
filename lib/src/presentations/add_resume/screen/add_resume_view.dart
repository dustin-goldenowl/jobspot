import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart';
import 'package:jobspot/src/presentations/apply_job/widgets/uploaded_cv_file.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class AddResumeView extends StatelessWidget {
  const AddResumeView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: BlocListener<AddResumeCubit, AddResumeState>(
          listenWhen: (previous, current) {
            if (previous.isLoading) Navigator.of(context).pop();

            if (previous.isLoading && current.dataState is DataSuccess) {
              context.router.pop();
            }
            return true;
          },
          listener: (context, state) {
            if (state.isLoading) {
              loadingAnimation(context);
            }
            if (state.dataState is DataFailed) {
              customToast(context, text: state.dataState?.error ?? "");
            }
          },
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
          AppLocal.text.add_resume_page_add_resume,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        _buildShowResume(),
        const SizedBox(height: 15),
        Text(
          AppLocal.text.add_resume_page_add_max_size_resume,
          style: AppStyles.normalTextMulledWine.copyWith(fontSize: 12),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: CustomButton(
            title: AppLocal.text.add_resume_page_save,
            onPressed: context.read<AddResumeCubit>().addResume,
          ),
        ),
        const SizedBox(height: 90),
      ],
    );
  }

  Widget _buildShowResume() {
    return BlocBuilder<AddResumeCubit, AddResumeState>(
      buildWhen: (previous, current) => previous.file != current.file,
      builder: (context, state) {
        if (state.file != null) {
          return UploadedCVFile(
            fileName: state.file!.name,
            size: state.file!.size,
            time: state.time!,
            onRemove: context.read<AddResumeCubit>().removeCV,
          );
        }
        return _buildPickResumeFile(context);
      },
    );
  }

  Widget _buildPickResumeFile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AddResumeCubit>().pickCVFile(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
