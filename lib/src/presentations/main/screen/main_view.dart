import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/main/widgets/custom_bottom_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ConnectionRoute(),
        NotificationRoute(),
        SaveJobRoute()
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: SafeArea(
            child: CustomBottomBar(
              changeTab: tabsRouter.setActiveIndex,
              onTap: () => context.read<MainCubit>().showBottomSheet(context),
              currentIndex: tabsRouter.activeIndex,
            ),
          ),
        );
      },
    );
  }
}
