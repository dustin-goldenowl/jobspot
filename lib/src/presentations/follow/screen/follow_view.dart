import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/follow/cubit/follow_cubit.dart';
import 'package:jobspot/src/presentations/follow/domain/router/follow_coordinator.dart';
import 'package:jobspot/src/presentations/follow/widgets/user_item.dart';
import 'package:jobspot/src/presentations/home_admin/widgets/company_item_loading.dart';

class FollowView extends StatefulWidget {
  const FollowView({super.key, this.title, required this.index});

  final String? title;
  final int index;

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<FollowCubit>().tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? PrefsUtils.getUserInfo()?.name ?? "---",
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            child: _buildTabBar(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: context.read<FollowCubit>().tabController,
              children: [_buildFollow(0), _buildFollow(1)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollow(int currentTab) {
    return BlocBuilder<FollowCubit, FollowState>(
      buildWhen: (previous, current) {
        if (currentTab == 0) {
          return previous.listFollowing != current.listFollowing;
        }
        return previous.listFollower != current.listFollower;
      },
      builder: (context, state) {
        bool checkFollower = currentTab == 1 &&
            state.listFollower != null &&
            state.listFollower!.isEmpty;
        bool checkFollowing = currentTab == 0 &&
            state.listFollowing != null &&
            state.listFollowing!.isEmpty;
        if (checkFollower || checkFollowing) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentTab == 0
                    ? AppLocal.text.follow_page_no_following
                    : AppLocal.text.follow_page_no_follower,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 50),
              SvgPicture.asset(
                AppImages.follow,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
            ],
          );
        }
        return RefreshIndicator(
          onRefresh: context.read<FollowCubit>().refresh,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            itemBuilder: (context, index) {
              if (currentTab == 0 && state.listFollowing != null ||
                  currentTab == 1 && state.listFollower != null) {
                return UserItem(
                  onViewProfile: (uid, role) {
                    if (role == UserRole.applicant) {
                      FollowCoordinator.showViewApplicantProfile(uid: uid);
                    } else {
                      FollowCoordinator.showViewCompanyProfile(uid: uid);
                    }
                  },
                  user: currentTab == 0
                      ? state.listFollowing![index]
                      : state.listFollower![index],
                );
              }
              return const CompanyItemLoading();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: (currentTab == 0
                    ? state.listFollowing?.length
                    : state.listFollower?.length) ??
                10,
          ),
        );
      },
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
              controller: context.read<FollowCubit>().tabController,
              tabAlignment: TabAlignment.fill,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: AppStyles.boldText,
              onTap: (value) {},
              tabs: [
                Tab(text: AppLocal.text.applicant_profile_page_following),
                Tab(text: AppLocal.text.applicant_profile_page_follower),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
