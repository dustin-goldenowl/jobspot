import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/check_email/domain/router/check_mail_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

@RoutePage()
class CheckEmailPage extends StatelessWidget {
  const CheckEmailPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.largePadding),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                AppLocal.text.check_email_page_check_your_email,
                style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocal.text.check_email_page_content,
                      style: AppStyles.normalTextMulledWine,
                    ),
                    TextSpan(
                      text: email,
                      style: TextStyle(color: AppColors.haiti),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 52),
              SvgPicture.asset(AppImages.checkEmail),
              const SizedBox(height: 94),
              CustomButton(
                title: AppLocal.text.check_email_page_open_your_email
                    .toUpperCase(),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              CustomButton(
                isElevated: false,
                onPressed: CheckMailoordinator.showSignIn,
                title: AppLocal.text.forgot_password_page_back_to_login
                    .toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
