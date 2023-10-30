import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/main/domain/router/main_coordinator.dart';
import 'package:jobspot/src/presentations/main/widgets/custom_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = PrefsUtils.getUserInfo();

    return AutoTabsRouter.pageView(
      routes: [
        user?.role == UserRole.business
            ? const HomeCompanyRoute()
            : const HomeApplicantRoute(),
        const ConnectionRoute(),
        const NotificationRoute(),
        const SaveJobRoute()
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: SafeArea(
            child: CustomBottomBar(
              changeTab: tabsRouter.setActiveIndex,
              onTap: () {
                if (user?.role == UserRole.business &&
                    (user?.verify == VerifyStatus.accept)) {
                  context.read<MainCubit>().showBottomSheet(context);
                } else {
                  MainCoordinator.showAddPost();
                }
              },
              currentIndex: tabsRouter.activeIndex,
            ),
          ),
        );
      },
    );
  }
}
