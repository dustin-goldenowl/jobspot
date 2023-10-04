import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/presentations/verify_email/cubit/verify_email_cubit.dart';
import 'package:jobspot/src/presentations/verify_email/domain/router/verify_email_coordinator.dart';

import '../../../core/constants/constants.dart';
import '../../sign_in/widgets/custom_button.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<VerifyEmailCubit, VerifyEmailState>(
        listener: (context, state) {
          if (state.isVerify) {
            context.read<VerifyEmailCubit>().dispose();
            VerifyEmailCoordinator.showVerifySuccess();
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.largePadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              AppLocal.text.verify_email_page_check_your_email,
              style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppLocal.text.verify_email_page_check_mail_content,
                    style: AppStyles.normalTextMulledWine,
                  ),
                  TextSpan(
                    text: FirebaseAuth.instance.currentUser!.email,
                    style: AppStyles.normalTextHaiti,
                  )
                ],
              ),
            ),
            const SizedBox(height: 52),
            SvgPicture.asset(AppImages.checkEmail),
            const SizedBox(height: 94),
            CustomButton(
              title:
                  AppLocal.text.verify_email_page_open_your_email.toUpperCase(),
              onPressed: context.read<VerifyEmailCubit>().openMailApp,
            ),
            const SizedBox(height: 20),
            CustomButton(
              isElevated: false,
              onPressed: VerifyEmailCoordinator.showSignIn,
              title:
                  AppLocal.text.verify_email_page_back_to_login.toUpperCase(),
            ),
            const SizedBox(height: 30),
            BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
              buildWhen: (previous, current) =>
                  previous.timeResend != current.timeResend,
              builder: (context, state) {
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppLocal
                            .text.verify_email_page_have_not_received_email,
                        style: AppStyles.normalTextMulledWine,
                      ),
                      if (state.timeResend <= 0)
                        TextSpan(
                          text: AppLocal.text.verify_email_page_resend,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.deepSaffron,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = context
                                .read<VerifyEmailCubit>()
                                .sendVerifyEmail,
                        )
                      else
                        TextSpan(
                          text: AppLocal.text.verify_email_page_wait_to_resend(
                            state.timeResend,
                          ),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.deepSaffron,
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
