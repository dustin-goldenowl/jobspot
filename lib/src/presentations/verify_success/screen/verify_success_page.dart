import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/verify_success/domain/router/verify_success_coordinator.dart';

@RoutePage()
class VerifySuccessPage extends StatelessWidget {
  const VerifySuccessPage({super.key});

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
                AppLocal.text.verify_success_page_successfully,
                style: AppStyles.boldTextNightBlue.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 8),
              Text(
                AppLocal.text.verify_success_page_success_content,
                style: AppStyles.normalTextMulledWine,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 52),
              SvgPicture.asset(AppImages.verifySuccess),
              const SizedBox(height: 94),
              CustomButton(
                onPressed: () {
                  if (PrefsUtils.getUserInfo()?.role == UserRole.business) {
                    VerifySuccessCoordinator.showVerifyCompany();
                  } else {
                    VerifySuccessCoordinator.backToSignIn();
                  }
                },
                title: AppLocal.text.verify_success_page_continue.toUpperCase(),
              ),
              const SizedBox(height: 15),
              CustomButton(
                onPressed: VerifySuccessCoordinator.backToSignIn,
                isElevated: false,
                title:
                    AppLocal.text.verify_email_page_back_to_login.toUpperCase(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
