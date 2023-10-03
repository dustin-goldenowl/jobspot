import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';

class BussinessTab extends StatelessWidget {
  const BussinessTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKeyBussiness,
      child: Column(
        children: [
          _buildInput(context),
          const SizedBox(height: 20),
          CustomButton(
            title: AppLocal.text.sign_up.toUpperCase(),
            onPressed: () {
              if (context
                  .read<SignUpCubit>()
                  .formKeyBussiness
                  .currentState!
                  .validate()) {
                context.read<SignUpCubit>().registerBussiness();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Column(
      children: [
        CustomTitleTextInput(
          controller: context.read<SignUpCubit>().nameBussinessController,
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
          controller: context.read<SignUpCubit>().emailBussinessController,
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
              context.read<SignUpCubit>().headquartersBussinessController,
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
              context.read<SignUpCubit>().employeeSizeBussinessController,
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
              current.isHideBussiness != previous.isHideBussiness,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().passwordBussinessController,
              title: AppLocal.text.password,
              hintText: AppLocal.text.password,
              isPassword: true,
              obscureText: state.isHideBussiness,
              onHidePassword: context.read<SignUpCubit>().hidePasswordBussiness,
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
              current.isHideRepassBussiness != previous.isHideRepassBussiness,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller:
                  context.read<SignUpCubit>().repasswordBussinessController,
              title: AppLocal.text.repassword,
              hintText: AppLocal.text.repassword,
              isPassword: true,
              obscureText: state.isHideRepassBussiness,
              onHidePassword:
                  context.read<SignUpCubit>().hideRepasswordBussiness,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocal.text.confirm_your_password_again;
                }
                if (value.compareTo(context
                        .read<SignUpCubit>()
                        .passwordBussinessController
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
