import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/domain/router/sign_up_coordinator.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/gender_widget.dart';

@RoutePage()
class ApplicantTab extends StatelessWidget {
  const ApplicantTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.largePadding),
        child: Form(
          key: context.read<SignUpCubit>().formKeyApplicant,
          child: Column(
            children: [
              _buildInput(context),
              const SizedBox(height: 20),
              CustomButton(
                title: AppLocal.text.sign_up.toUpperCase(),
                onPressed: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKeyApplicant
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().registerApplicant();
                  }
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                isElevated: false,
                onPressed: () {
                  context.read<SignUpCubit>().registerGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.google, width: 40, height: 40),
                    const SizedBox(width: 10),
                    Text(
                      AppLocal.text.sign_up_with_google.toUpperCase(),
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
                      text: AppLocal.text.sign_in,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.deepSaffron,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = SignUpCoordinator.showSignIn,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Column(
      children: [
        CustomTitleTextInput(
          controller: context.read<SignUpCubit>().nameApplicantController,
          title: AppLocal.text.full_name,
          hintText: AppLocal.text.full_name,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.full_name_cannot_left_blank;
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        CustomTitleTextInput(
          controller: context.read<SignUpCubit>().emailApplicantController,
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
        _buildGender(),
        const SizedBox(height: 15),
        _buildBirthday(),
        const SizedBox(height: 15),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              current.isHideApplicant != previous.isHideApplicant,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().passwordApplicantController,
              title: AppLocal.text.password,
              hintText: AppLocal.text.password,
              isPassword: true,
              obscureText: state.isHideApplicant,
              onHidePassword: context.read<SignUpCubit>().hidePasswordApplicant,
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
        const SizedBox(height: 15),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              current.isHideRepassApplicant != previous.isHideRepassApplicant,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().repasswordApplicantController,
              title: AppLocal.text.repassword,
              hintText: AppLocal.text.repassword,
              isPassword: true,
              obscureText: state.isHideRepassApplicant,
              onHidePassword:
                  context.read<SignUpCubit>().hideRepasswordApplicant,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.confirm_your_password_again;
                }
                if (value !=
                    context
                        .read<SignUpCubit>()
                        .passwordApplicantController
                        .text) {
                  return AppLocal.text.passwords_do_not_match;
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildGender() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current.isMale != previous.isMale,
      builder: (context, state) {
        return GenderWidget(
          isMale: state.isMale,
          onChange: context.read<SignUpCubit>().changeGender,
        );
      },
    );
  }

  Widget _buildBirthday() {
    final now = DateTime.now();
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current.birthday != previous.birthday,
      builder: (context, state) {
        return BirthdayWidget(
          title: AppLocal.text.birthday,
          onChange: context.read<SignUpCubit>().changeBirthdate,
          selectedDate: state.birthday,
          lastDate: DateTime(now.year - 18, now.month, now.day),
        );
      },
    );
  }
}
