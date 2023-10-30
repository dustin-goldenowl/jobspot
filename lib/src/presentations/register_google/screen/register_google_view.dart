import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/register_google/cubit/register_google_cubit.dart';
import 'package:jobspot/src/presentations/register_google/domain/router/register_google_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/birthday_widget.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/gender_widget.dart';

class RegisterGoogleView extends StatelessWidget {
  const RegisterGoogleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: context.read<RegisterGoogleCubit>().cancelRegisterGoogle,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: BlocListener<RegisterGoogleCubit, RegisterGoogleState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();

          if (previous.isLoading && current.dataState is DataSuccess) {
            RegisterGoogleCoordinator.showMain();
          }

          return true;
        },
        listener: (context, state) {
          if (state.isLoading) loadingAnimation(context);

          if (state.dataState is DataFailed) {
            customToast(context, text: state.dataState?.error ?? "");
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.largePadding),
        child: Form(
          key: context.read<RegisterGoogleCubit>().formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              _buildTitle(),
              const SizedBox(height: 28),
              _buildInput(context),
              const SizedBox(height: 20),
              CustomButton(
                title: AppLocal.text.sign_up.toUpperCase(),
                onPressed: context
                    .read<RegisterGoogleCubit>()
                    .registerApplicantWithGoogle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          AppLocal.text.create_an_account,
          style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocal.text.sign_up_content,
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
          controller: context.read<RegisterGoogleCubit>().nameController,
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
          controller: context.read<RegisterGoogleCubit>().emailController,
          title: AppLocal.text.email,
          hintText: AppLocal.text.email,
          onTap: () {}, //On tap => set text input readonly
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
      ],
    );
  }

  Widget _buildGender() {
    return BlocBuilder<RegisterGoogleCubit, RegisterGoogleState>(
      buildWhen: (previous, current) => current.isMale != previous.isMale,
      builder: (context, state) {
        return GenderWidget(
          isMale: state.isMale,
          onChange: context.read<RegisterGoogleCubit>().changeGender,
        );
      },
    );
  }

  Widget _buildBirthday() {
    final now = DateTime.now();
    return BlocBuilder<RegisterGoogleCubit, RegisterGoogleState>(
      buildWhen: (previous, current) => current.birthday != previous.birthday,
      builder: (context, state) {
        return BirthdayWidget(
          title: AppLocal.text.birthday,
          onChange: context.read<RegisterGoogleCubit>().changeBirthdate,
          selectedDate: state.birthday,
          lastDate: DateTime(now.year - 18, now.month, now.day),
        );
      },
    );
  }
}
