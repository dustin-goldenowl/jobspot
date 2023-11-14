import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/router/view_company_profile_coordinator.dart';
import 'package:jobspot/src/presentations/view_company_profile/widgets/custom_button_profile.dart';

class ViewCompanyProfileView extends StatefulWidget {
  const ViewCompanyProfileView({super.key});

  @override
  State<ViewCompanyProfileView> createState() => _ViewCompanyProfileViewState();
}

class _ViewCompanyProfileViewState extends State<ViewCompanyProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<ViewCompanyProfileCubit>().tabController =
        TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ViewCompanyProfileCubit>();
    return AutoTabsRouter.pageView(
      routes: const [
        ViewCompanyAboutTab(),
        ViewCompanyPostTab(),
        ViewCompanyJobTab(),
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        if (tabsRouter.activeIndex != cubit.tabController.index) {
          cubit.tabController.animateTo(tabsRouter.activeIndex);
        }
        cubit.tabController.addListener(() {
          if (tabsRouter.activeIndex != cubit.tabController.index) {
            tabsRouter.setActiveIndex(cubit.tabController.index);
          }
        });

        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              controller: cubit.scrollController,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (_, __) => [
                _buildAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    child: _buildButtonProfile(),
                  ),
                ),
                SliverAppBar(
                  backgroundColor: AppColors.scaffoldBackground,
                  pinned: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  expandedHeight: 0,
                  toolbarHeight: 60,
                  title: _buildTabBar(onTap: tabsRouter.setActiveIndex),
                ),
              ],
              body: BlocListener<ViewCompanyProfileCubit,
                  ViewCompanyProfileState>(
                listener: (context, state) {
                  if (state.error != null) {
                    customToast(context, text: state.error ?? "");
                  }
                },
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      builder: (context, state) {
        return SliverAppBar(
          ///TODO I don't think idea with this button
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(FontAwesomeIcons.ellipsisVertical),
          //   ),
          //   const SizedBox(width: 5),
          // ],
          leading: IconButton(
            onPressed: context.router.pop,
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          ),
          backgroundColor: state.isTop ? Colors.white : Colors.transparent,
          elevation: 0,
          pinned: true,
          centerTitle: true,
          stretch: true,
          expandedHeight: 240,
          scrolledUnderElevation: 0,
          title: AnimatedOpacity(
            opacity: !state.isTop ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              state.user?.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(context, state: state),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar(
    BuildContext context, {
    required ViewCompanyProfileState state,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildBehindBackground(context, state: state),
        Positioned(
          top: 60,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: state.user?.avatar ?? "",
              height: 84,
              width: 84,
              placeholder: (context, url) =>
                  const ItemLoading(width: 84, height: 84, radius: 90),
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(AppImages.logo),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBehindBackground(
    BuildContext context, {
    required ViewCompanyProfileState state,
  }) {
    return Column(
      children: [
        Container(height: 120, color: Colors.white),
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
          child: Column(
            children: [
              const SizedBox(height: 28),
              state.user != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.user?.name ?? "",
                          style: AppStyles.boldTextNightBlue
                              .copyWith(fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (state.user?.verify == VerifyStatus.accept)
                          const SizedBox(width: 5),
                        if (state.user?.verify == VerifyStatus.accept)
                          SvgPicture.asset(AppImages.verify, height: 18),
                      ],
                    )
                  : const ItemLoading(width: 70, height: 20, radius: 5),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildText(
                    onTap: () => ViewCompanyProfileCoordinator.viewFollow(
                      index: 1,
                      title: state.user?.name,
                      follower: state.user?.follower ?? [],
                      following: state.user?.following ?? [],
                    ),
                    title: AppLocal.text.view_company_profile_page_follower(
                        state.user?.follower.length ?? 0),
                  ),
                  _buildDotText,
                  _buildText(
                    onTap: () =>
                        context.read<ViewCompanyProfileCubit>().toTab(1),
                    title: AppLocal.text.view_company_profile_page_posts(
                        state.listPost?.length ?? 0),
                  ),
                  _buildDotText,
                  _buildText(
                    onTap: () =>
                        context.read<ViewCompanyProfileCubit>().toTab(2),
                    title: AppLocal.text.view_company_profile_page_jobs(
                        state.listJob?.length ?? 0),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonProfile() {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        if (state.user == null ||
            state.user != null &&
                (state.user?.website ?? "").isNotEmpty &&
                PrefsUtils.getUserInfo()?.role != UserRole.business) {
          return Row(
            children: [
              Expanded(
                  child: _buildButtonFollow(
                context,
                follower: state.user?.follower ?? [],
              )),
              const SizedBox(width: 20),
              Expanded(
                child: CustomButtonProfile(
                  onTap: context.read<ViewCompanyProfileCubit>().openWebsite,
                  icon: SvgPicture.asset(AppImages.openBrowser),
                  title: AppLocal.text.view_company_profile_page_visit_website,
                ),
              ),
            ],
          );
        }
        if (PrefsUtils.getUserInfo()?.role != UserRole.business) {
          return Center(
            child: SizedBox(
              width: 170,
              child: CustomButtonProfile(
                onTap: context.read<ViewCompanyProfileCubit>().openWebsite,
                icon: SvgPicture.asset(AppImages.openBrowser),
                title: AppLocal.text.view_company_profile_page_visit_website,
              ),
            ),
          );
        }
        if ((state.user?.website ?? "").isNotEmpty) {
          return Center(
            child: SizedBox(
              width: 170,
              child: _buildButtonFollow(
                context,
                follower: state.user?.follower ?? [],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildButtonFollow(
    BuildContext context, {
    required List<String> follower,
  }) {
    bool isFollow = follower.contains(FirebaseAuth.instance.currentUser!.uid);
    return CustomButtonProfile(
      onTap: context.read<ViewCompanyProfileCubit>().followUser,
      icon: isFollow
          ? null
          : Icon(FontAwesomeIcons.plus, color: AppColors.venetianRed, size: 15),
      title: isFollow
          ? AppLocal.text.view_company_profile_page_unfollow
          : AppLocal.text.view_company_profile_page_follow,
    );
  }

  Widget _buildTabBar({required Function(int value) onTap}) {
    return Container(
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
                color: AppColors.neonCarrot,
                borderRadius: BorderRadius.circular(10),
              ),
              controller: context.read<ViewCompanyProfileCubit>().tabController,
              tabAlignment: TabAlignment.fill,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(fontWeight: FontWeight.w700),
              onTap: onTap,
              tabs: [
                Tab(text: AppLocal.text.view_company_profile_page_about_us),
                Tab(text: AppLocal.text.view_company_profile_page_post),
                Tab(text: AppLocal.text.view_company_profile_page_job),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildDotText => SizedBox(
      width: 30,
      child: Center(
          child: Text(
        "•",
        style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25),
      )));

  Widget _buildText({required VoidCallback onTap, required String title}) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: AppStyles.normalTextNightBlue.copyWith(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
