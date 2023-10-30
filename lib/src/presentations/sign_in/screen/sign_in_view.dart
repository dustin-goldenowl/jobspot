import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/domain/router/sign_in_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
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
            if (!state.isLoginGoogle!) {
              context.read<SignInCubit>().updateToken();
              customToast(context, text: AppLocal.text.logged_in_successfully);
              UserEntity? user = PrefsUtils.getUserInfo();
              if (user?.role == UserRole.admin) {
                SignInCoordinator.showHomeAdmin();
              } else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
                SignInCoordinator.showVerifyEmail();
              } else if (FirebaseAuth.instance.currentUser!.emailVerified &&
                  user?.role == UserRole.business &&
                  user?.verify == VerifyStatus.none) {
                SignInCoordinator.showVerifyBusiness();
              } else {
                SignInCoordinator.showMain();
              }
            } else {
              SignInCoordinator.showRegisterGoogle();
            }
          }
        },
        child: WillPopScope(
          onWillPop: () => onWillPop(
            context: context,
            action: (now) =>
                context.read<SignInCubit>().currentBackPressTime = now,
            currentBackPressTime:
                context.read<SignInCubit>().currentBackPressTime,
          ),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: context.read<SignInCubit>().formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.largePadding),
            child: Column(
              children: [
                const SizedBox(height: 50),
                _buildTitle(),
                const SizedBox(height: 64),
                _buildInput(context),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _rememberWidget(),
                    const Spacer(),
                    TextButton(
                      onPressed: SignInCoordinator.showForgotPassword,
                      child: Text(
                        AppLocal.text.forgot_password,
                        style: TextStyle(color: AppColors.nightBlue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 36),
                CustomButton(
                  title: AppLocal.text.sign_in.toUpperCase(),
                  onPressed:
                      context.read<SignInCubit>().signInWithEmailAndPassword,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isElevated: false,
                  onPressed: context.read<SignInCubit>().signInWithGoogle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppImages.google,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppLocal.text.sign_in_with_google.toUpperCase(),
                        style: AppStyles.normalTextPrimary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocal.text.you_dont_have_an_account_yet,
                        style: AppStyles.normalTextMulledWine,
                      ),
                      TextSpan(
                        text: AppLocal.text.sign_up,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.deepSaffron,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = SignInCoordinator.showSignUp,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          AppLocal.text.welcome_back,
          style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocal.text.sign_in_content,
          style: AppStyles.normalTextMulledWine,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInput(BuildContext context) {
    return Column(
      children: [
        CustomTitleTextInput(
          controller: context.read<SignInCubit>().emailController,
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
        const SizedBox(height: 15),
        BlocBuilder<SignInCubit, SignInState>(
          buildWhen: (previous, current) => current.isHide != previous.isHide,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller: context.read<SignInCubit>().passwordController,
              title: AppLocal.text.password,
              hintText: AppLocal.text.password,
              isPassword: true,
              obscureText: state.isHide,
              onHidePassword: context.read<SignInCubit>().hidePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.please_enter_your_password;
                }
                if (value.length < 8) {
                  return AppLocal.text.minimum_of_password;
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _rememberWidget() {
    return Row(
      children: [
        BlocBuilder<SignInCubit, SignInState>(
          buildWhen: (previous, current) =>
              current.isRememberMe != previous.isRememberMe,
          builder: (context, state) {
            return Checkbox(
              value: state.isRememberMe,
              onChanged: (value) {
                context.read<SignInCubit>().rememberMe(value!);
              },
              activeColor: AppColors.lavenderMist,
            );
          },
        ),
        Text(
          AppLocal.text.remember_me,
          style: AppStyles.normalTextSpunPearl,
        ),
      ],
    );
  }
}
