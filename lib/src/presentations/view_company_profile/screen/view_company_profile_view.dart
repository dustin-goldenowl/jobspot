import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
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
              body: child,
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.ellipsisVertical),
            ),
            const SizedBox(width: 5),
          ],
          leading: IconButton(
            onPressed: () => context.router.pop(),
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
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(state),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar(ViewCompanyProfileState state) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(height: 120, color: Colors.white),
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFF3F2F2)),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  state.user != null
                      ? Text(
                          state.user?.name ?? "",
                          style: AppStyles.boldTextNightBlue
                              .copyWith(fontSize: 18),
                        )
                      : const ItemLoading(width: 70, height: 20, radius: 5),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildText(
                          "${state.user?.following.length ?? 0} Follower"),
                      _buildDotText,
                      _buildText("${state.listPost?.length ?? 0} Post"),
                      _buildDotText,
                      _buildText("${state.listJob?.length ?? 0} Jobs"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
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

  Widget _buildButtonProfile() {
    return BlocBuilder<ViewCompanyProfileCubit, ViewCompanyProfileState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        if (state.user == null ||
            state.user != null && (state.user!.website ?? "").isNotEmpty) {
          return Row(
            children: [
              Expanded(child: _buildButtonFollow(state.user?.follower ?? [])),
              const SizedBox(width: 20),
              Expanded(
                child: CustomButtonProfile(
                  onTap: () {},
                  icon: SvgPicture.asset(AppImages.openBrowser),
                  title: "Visit website",
                ),
              ),
            ],
          );
        }
        return Center(
          child: SizedBox(
            width: 170,
            child: _buildButtonFollow(state.user?.follower ?? []),
          ),
        );
      },
    );
  }

  Widget _buildButtonFollow(List<String> follower) {
    return CustomButtonProfile(
      onTap: () {},
      icon: Icon(FontAwesomeIcons.plus, color: AppColors.venetianRed, size: 15),
      title: follower.contains(FirebaseAuth.instance.currentUser!.uid)
          ? "Unfollow"
          : "Follow",
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
              tabs: const [
                Tab(text: 'About us'),
                Tab(text: 'Post'),
                Tab(text: 'Jobs'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildDotText =>
      Text("•", style: AppStyles.boldTextNightBlue.copyWith(fontSize: 25));

  Widget _buildText(String title) =>
      Text(title, style: AppStyles.normalTextNightBlue.copyWith(fontSize: 16));
}
