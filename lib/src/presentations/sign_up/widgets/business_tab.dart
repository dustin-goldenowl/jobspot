import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/domain/router/sign_up_coordinator.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';

@RoutePage()
class BusinessTab extends StatelessWidget {
  const BusinessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.largePadding),
        child: Form(
          key: context.read<SignUpCubit>().formKeyBusiness,
          child: Column(
            children: [
              _buildInput(context),
              const SizedBox(height: 20),
              CustomButton(
                title: AppLocal.text.sign_up.toUpperCase(),
                onPressed: context.read<SignUpCubit>().registerBusiness,
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
          controller: context.read<SignUpCubit>().nameBusinessController,
          title: AppLocal.text.company_name,
          hintText: AppLocal.text.company_name,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.business_name_cannot_blank;
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        CustomTitleTextInput(
          controller: context.read<SignUpCubit>().emailBusinessController,
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
        _buildFounding(),
        const SizedBox(height: 15),
        CustomTitleTextInput(
          controller:
              context.read<SignUpCubit>().headquartersBusinessController,
          title: AppLocal.text.headquarters,
          hintText: AppLocal.text.headquarters,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.enter_business_headquarters_address;
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        CustomTitleTextInput(
          controller:
              context.read<SignUpCubit>().employeeSizeBusinessController,
          title: AppLocal.text.employee_size,
          hintText: AppLocal.text.employee_size,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value!.isEmpty) {
              return AppLocal.text.enter_employee_size;
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
        BlocBuilder<SignUpCubit, SignUpState>(
          buildWhen: (previous, current) =>
              current.isHideBusiness != previous.isHideBusiness,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().passwordBusinessController,
              title: AppLocal.text.password,
              hintText: AppLocal.text.password,
              isPassword: true,
              obscureText: state.isHideBusiness,
              onHidePassword: context.read<SignUpCubit>().hidePasswordBusiness,
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
              current.isHideRepassBusiness != previous.isHideRepassBusiness,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().repasswordBusinessController,
              title: AppLocal.text.repassword,
              hintText: AppLocal.text.repassword,
              isPassword: true,
              obscureText: state.isHideRepassBusiness,
              onHidePassword:
                  context.read<SignUpCubit>().hideRepasswordBusiness,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.confirm_your_password_again;
                }
                if (value.compareTo(context
                        .read<SignUpCubit>()
                        .passwordBusinessController
                        .text) !=
                    0) {
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

  Widget _buildFounding() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => current.founding != previous.founding,
      builder: (context, state) {
        return BirthdayWidget(
          title: AppLocal.text.founding,
          onChange: context.read<SignUpCubit>().changeFounding,
          selectedDate: state.founding,
          lastDate: DateTime.now(),
        );
      },
    );
  }
}
