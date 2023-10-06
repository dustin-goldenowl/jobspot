import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:jobspot/src/presentations/forgot_password/domain/router/forgot_password_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();
          return true;
        },
        listener: (context, state) {
          if (state.isLoading) loadingAnimation(context);

          if (state.dataState is DataFailed) {
            customToast(context, text: state.dataState?.error ?? "");
          }

          if (state.dataState is DataSuccess) {
            ForgotPasswordCoordinator.showCheckMail(
                context.read<ForgotPasswordCubit>().emailController.text);
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: context.read<ForgotPasswordCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.largePadding),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  AppLocal.text.forgot_password_page_forgot_password,
                  style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocal.text.forgot_password_page_forgot_password_content,
                  style: AppStyles.normalTextMulledWine,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 52),
                SvgPicture.asset(AppImages.forgotPassword),
                const SizedBox(height: 72),
                CustomTitleTextInput(
                  controller:
                      context.read<ForgotPasswordCubit>().emailController,
                  title: AppLocal.text.email,
                  hintText: AppLocal.text.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppLocal.text.please_enter_email;
                    }
                    if (!value.isValidEmail()) {
                      return AppLocal.text.email_invalidate;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 36),
                CustomButton(
                  title: AppLocal.text.forgot_password_page_reset_password
                      .toUpperCase(),
                  onPressed: () {
                    if (context
                        .read<ForgotPasswordCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<ForgotPasswordCubit>().sendForgotPassword();
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isElevated: false,
                  onPressed: ForgotPasswordCoordinator.showSignIn,
                  title: AppLocal.text.forgot_password_page_back_to_login
                      .toUpperCase(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
