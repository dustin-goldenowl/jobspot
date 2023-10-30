import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/apply_job/widgets/uploaded_cv_file.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart';
import 'package:jobspot/src/presentations/verify_business/domain/router/verify_business_coordinator.dart';

class VerifyBusinessView extends StatelessWidget {
  const VerifyBusinessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener<VerifyBusinessCubit, VerifyBusinessState>(
            listenWhen: (previous, current) {
              if (previous.isLoading) Navigator.of(context).pop();

              if (previous.isLoading && current.error == null) {
                VerifyBusinessCoordinator.showMain();
              }
              return true;
            },
            listener: (context, state) {
              if (state.isLoading) loadingAnimation(context);

              if (state.error != null) {
                customToast(context, text: state.error ?? "");
              }
            },
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Form(
      key: context.read<VerifyBusinessCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.largePadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            _buildTitle(),
            const SizedBox(height: 50),
            _buidFilePDF(),
            const SizedBox(height: 50),
            _buildInfomation(context),
            const SizedBox(height: 50),
            CustomButton(
              onPressed: context.read<VerifyBusinessCubit>().uploadFile,
              title: AppLocal.text.verify_business_page_upload.toUpperCase(),
            ),
            const SizedBox(height: 15),
            CustomButton(
              onPressed: VerifyBusinessCoordinator.backToSignIn,
              isElevated: false,
              title: AppLocal.text.verify_business_page_back_to_login
                  .toUpperCase(),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          AppLocal.text.verify_business_page_verify_business,
          style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          AppLocal.text.verify_business_page_verify_business_content,
          style: AppStyles.normalTextMulledWine,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buidFilePDF() {
    return BlocBuilder<VerifyBusinessCubit, VerifyBusinessState>(
      builder: (context, state) {
        if (state.file != null) {
          return UploadedCVFile(
            fileName: state.file!.name,
            size: state.file!.size,
            time: state.time!,
            onRemove: context.read<VerifyBusinessCubit>().removeFile,
          );
        }
        return _buildPickPDFFile(context);
      },
    );
  }

  Widget _buildPickPDFFile(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<VerifyBusinessCubit>().pickFile(context),
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
                      AppLocal.text.verify_business_page_upload_pdf_file,
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

  Widget _buildInfomation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.verify_business_page_information,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: context.read<VerifyBusinessCubit>().controller,
          maxLines: 8,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.verify_business_page_information_validate;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: AppColors.spunPearl,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            hintText: AppLocal.text.verify_business_page_information_content,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
          ),
        ),
      ],
    );
  }
}
