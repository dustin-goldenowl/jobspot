import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/applicant_profile/widgets/profile_app_bar.dart';

class ApplicantProfileView extends StatefulWidget {
  const ApplicantProfileView({super.key});

  @override
  State<ApplicantProfileView> createState() => _ApplicantProfileViewState();
}

class _ApplicantProfileViewState extends State<ApplicantProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<ApplicantProfileCubit>().tabController =
        TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return AutoTabsRouter.pageView(
      routes: const [AboutTab(), PostTab()],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: ProfileAppBar(width: width),
          body: Padding(
            padding: const EdgeInsets.all(AppDimens.smallPadding),
            child: Column(
              children: [
                _buildTabBar(onTap: tabsRouter.setActiveIndex),
                const SizedBox(height: 10),
                Expanded(child: child),
              ],
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
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBar(
          unselectedLabelColor: AppColors.haiti,
          labelColor: Colors.white,
          indicatorColor: AppColors.neonCarrot,
          indicatorWeight: 1,
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          controller: context.read<ApplicantProfileCubit>().tabController,
          tabAlignment: TabAlignment.fill,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700),
          onTap: onTap,
          tabs: const [Tab(text: 'About'), Tab(text: 'Post')],
        ),
      ),
    );
  }
}
