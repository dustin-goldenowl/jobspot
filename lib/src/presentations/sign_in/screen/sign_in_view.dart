import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/email_password_entity.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/constants.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  DateTime? _currentBackPressTime;
  bool _isRememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (!getIt.isRegistered<AppLocalizations>()) {
      getIt.registerSingleton(AppLocalizations.of(context)!);
    }

    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listenWhen: (previous, current) {
          if (previous is SignInLoadingState) {
            Navigator.of(context).pop();
          }
          return true;
        },
        listener: (context, state) {
          if (state is SignInLoadingState) {
            loadingAnimation(context);
          }
          if (state is SignInErrorState) {
            customToast(context, state.error);
          }
          if (state is SignInSuccessState) {
            customToast(context, "Đăng nhập thành công");
            GoogleSignIn().signOut();
            print(state.userCredential);
          }
        },
        child: WillPopScope(
          onWillPop: () => onWillPop(
            context: context,
            action: (now) => _currentBackPressTime = now,
            currentBackPressTime: _currentBackPressTime,
          ),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<SignInCubit>()
                          .signInWithEmailAndPassword(EmailPasswordEntity(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ));
                    }
                  },
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
          buildWhen: (previous, current) => current is HidePasswordState,
          builder: (context, state) {
            return CustomTitleTextInput(
              controller: _passwordController,
              title: AppLocal.text.password,
              hintText: AppLocal.text.password,
              isPassword: true,
              obscureText: state is HidePasswordState ? state.isHide : true,
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
          buildWhen: (previous, current) => current is RememberMeState,
          builder: (context, state) {
            return Checkbox(
              value: _isRememberMe,
              onChanged: (value) {
                context.read<SignInCubit>().rememberMe(value!);
                _isRememberMe = value;
              },
              activeColor: AppColors.lavenderMist,
            );
          },
        ),
        Text(
          AppLocal.text.remember_me,
          style: TextStyle(color: AppColors.spunPearl),
        ),
      ],
    );
  }
}
