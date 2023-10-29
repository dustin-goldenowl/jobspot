import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/core/function/on_will_pop.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/domain/router/sign_up_coordinator.dart';

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
    return AutoTabsRouter.pageView(
      physics: const BouncingScrollPhysics(),
      routes: const [ApplicantTab(), BusinessTab()],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        final cubit = context.read<SignUpCubit>();
        if (tabsRouter.activeIndex != cubit.tabController.index) {
          cubit.tabController.animateTo(tabsRouter.activeIndex);
        }
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
                SignUpCoordinator.showVerifyEmail();
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
              child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 80),
                          _buildTitle(),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),
                  SliverAppBar(
                    backgroundColor: AppColors.scaffoldBackground,
                    pinned: true,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 0,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    title: _buildTabBar(onTap: tabsRouter.setActiveIndex),
                  ),
                ],
                body: child,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabBar({required Function(int) onTap}) {
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
              onTap: onTap,
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
