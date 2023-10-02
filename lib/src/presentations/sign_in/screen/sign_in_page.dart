import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/constants.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  DateTime? _currentBackPressTime;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    if (!getIt.isRegistered<AppLocalizations>()) {
      getIt.registerSingleton(AppLocalizations.of(context)!);
    }

    return Scaffold(
      body: WillPopScope(
        onWillPop: () => onWillPop(
          context: context,
          action: (now) => _currentBackPressTime = now,
          currentBackPressTime: _currentBackPressTime,
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.largePadding),
            child: Column(
              children: [
                const SizedBox(height: 50),
                _buildTitle(),
                const SizedBox(height: 64),
                _buildInput(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    _rememberWidget(),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
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
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                CustomButton(
                  isElevated: false,
                  onPressed: () {},
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
                        style: TextStyle(color: AppColors.primary),
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
                        style: TextStyle(color: AppColors.mulledWine),
                      ),
                      TextSpan(
                        text: AppLocal.text.sign_up,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.deepSaffron,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.nightBlue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppLocal.text.sign_in_content,
          style: TextStyle(color: AppColors.mulledWine),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInput() {
    return Column(
      children: [
        CustomTitleTextInput(
          controller: _emailController,
          title: AppLocal.text.email,
          hintText: AppLocal.text.email,
        ),
        const SizedBox(height: 15),
        CustomTitleTextInput(
          controller: _passwordController,
          title: AppLocal.text.password,
          hintText: AppLocal.text.password,
          isPassword: true,
          obscureText: isShowPassword,
        ),
      ],
    );
  }

  Widget _rememberWidget() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: AppColors.lavenderMist,
        ),
        Text(
          AppLocal.text.remember_me,
          style: TextStyle(color: AppColors.spunPearl),
        ),
      ],
    );
  }
}
