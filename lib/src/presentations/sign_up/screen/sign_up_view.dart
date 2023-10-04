import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/applicant_tab.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/business_tab.dart';
import 'package:jobspot/src/presentations/sign_up/widgets/slide_transition_x.dart';

import '../../../core/constants/constants.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<SignUpCubit>().tabController =
        TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpCubit, SignUpState>(
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
            customToast(context, text: AppLocal.text.sign_up_successfully);
            print(state.dataState!.data);
          }
        },
        child: WillPopScope(
          onWillPop: () => onWillPop(
            context: context,
            action: (now) =>
                context.read<SignUpCubit>().currentBackPressTime = now,
            currentBackPressTime:
                context.read<SignUpCubit>().currentBackPressTime,
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
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.largePadding),
          child: Column(
            children: [
              const SizedBox(height: 30),
              _buildTitle(),
              const SizedBox(height: 28),
              _buildTabBar(),
              const SizedBox(height: 28),
              _buildTabView(),
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
                        ..onTap = () {
                          context.router.pushAndPopUntil(
                            const SignInRoute(),
                            predicate: (_) => false,
                          );
                        },
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

  Widget _buildTabBar() {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(18, 162, 153, 198),
            blurRadius: 62,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: AppColors.haiti,
              labelColor: Colors.white,
              indicatorColor: AppColors.neonCarrot,
              indicatorWeight: 1,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              controller: context.read<SignUpCubit>().tabController,
              tabAlignment: TabAlignment.fill,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppStyles.boldText,
              onTap: context.read<SignUpCubit>().changeTab,
              tabs: [
                Tab(text: AppLocal.text.applicant),
                Tab(text: AppLocal.text.business),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) {
        if (current.currentTab != previous.currentTab) {
          context.read<SignUpCubit>().axisDirection =
              previous.currentTab < current.currentTab
                  ? AxisDirection.left
                  : AxisDirection.right;
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return SlideTransitionX(
              direction: context.read<SignUpCubit>().axisDirection,
              position: animation,
              child: child,
            );
          },
          child: IndexedStack(
            key: ValueKey(context.read<SignUpCubit>().tabController.index),
            index: context.read<SignUpCubit>().tabController.index,
            children: const [ApplicantTab(), BusinessTab()],
          ),
        );
      },
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
}
