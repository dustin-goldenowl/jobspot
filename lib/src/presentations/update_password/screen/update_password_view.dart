import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      bottomNavigationBar: _buildButton(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
          listenWhen: (previous, current) {
            if (previous.isLoading) Navigator.of(context).pop();

            if (previous.isLoading && current.error == null) {
              customToast(
                context,
                text: AppLocal.text.update_password_page_update_success,
              );
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
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    final cubit = context.read<UpdatePasswordCubit>();
    return SizedBox(
      height: 100,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: CustomButton(
            title: AppLocal.text.update_password_page_update.toUpperCase(),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.changePassword();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.smallPadding),
      child: Form(
        key: context.read<UpdatePasswordCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.update_password_page_update_password,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 25),
            _buildInputOldPassword(),
            const SizedBox(height: 15),
            _buildInputNewPassword(),
            const SizedBox(height: 15),
            _buildInputConfirmPassword(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputConfirmPassword() {
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
      buildWhen: (previous, current) =>
          previous.isHideConfirmPassword != current.isHideConfirmPassword,
      builder: (context, state) {
        return CustomTitleTextInput(
          title: AppLocal.text.update_password_page_confirm_password,
          controller:
              context.read<UpdatePasswordCubit>().comfirmPasswordController,
          hintText: AppLocal.text.update_password_page_confirm_password,
          obscureText: state.isHideConfirmPassword,
          isPassword: true,
          onHidePassword:
              context.read<UpdatePasswordCubit>().changeHideConfirmPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.update_password_page_enter_confirm_password;
            }
            if (value !=
                context
                    .read<UpdatePasswordCubit>()
                    .newPasswordController
                    .text) {
              return AppLocal.text.update_password_page_confirm_not_match;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputNewPassword() {
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
      buildWhen: (previous, current) =>
          previous.isHideNewPassword != current.isHideNewPassword,
      builder: (context, state) {
        return CustomTitleTextInput(
          title: AppLocal.text.update_password_page_new_password,
          controller: context.read<UpdatePasswordCubit>().newPasswordController,
          hintText: AppLocal.text.update_password_page_new_password,
          obscureText: state.isHideNewPassword,
          isPassword: true,
          onHidePassword:
              context.read<UpdatePasswordCubit>().changeHideNewPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.update_password_page_enter_password;
            }
            if (value.length < 8) {
              return AppLocal.text.update_password_page_min_character_password;
            }
            return null;
          },
        );
      },
    );
  }

  Widget _buildInputOldPassword() {
    return BlocBuilder<UpdatePasswordCubit, UpdatePasswordState>(
      buildWhen: (previous, current) =>
          previous.isHideOldPassword != current.isHideOldPassword,
      builder: (context, state) {
        return CustomTitleTextInput(
          title: AppLocal.text.update_password_page_old_password,
          controller: context.read<UpdatePasswordCubit>().oldPasswordController,
          hintText: AppLocal.text.update_password_page_old_password,
          obscureText: state.isHideOldPassword,
          isPassword: true,
          onHidePassword:
              context.read<UpdatePasswordCubit>().changeHideOldPassword,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.update_password_page_enter_old_password;
            }
            return null;
          },
        );
      },
    );
  }
}
