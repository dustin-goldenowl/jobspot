import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart';

class ViewApplicantProfileView extends StatefulWidget {
  const ViewApplicantProfileView({super.key});

  @override
  State<ViewApplicantProfileView> createState() =>
      _ViewApplicantProfileViewState();
}

class _ViewApplicantProfileViewState extends State<ViewApplicantProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = context.read<ViewApplicantProfileCubit>();
    cubit.tabController = TabController(length: 2, vsync: this);
    cubit.scrollController.addListener(() {
      bool isTop = cubit.scrollController.position.pixels >=
          0.6 * MediaQuery.sizeOf(context).width -
              2 * AppBar().preferredSize.height;
      cubit.changeIsTop(isTop);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ViewApplicantProfileCubit>();
    return AutoTabsRouter.pageView(
      routes: const [AboutViewApplicantTab(), PostViewApplicantTab()],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        if (tabsRouter.activeIndex != cubit.tabController.index) {
          cubit.tabController.animateTo(tabsRouter.activeIndex);
        }
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              controller:
                  context.read<ViewApplicantProfileCubit>().scrollController,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (_, __) => [
                _buildAppBar(),
                SliverAppBar(
                  backgroundColor: AppColors.scaffoldBackground,
                  pinned: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  expandedHeight: 0,
                  title: _buildTabBar(onTap: tabsRouter.setActiveIndex),
                ),
              ],
              body: BlocListener<ViewApplicantProfileCubit,
                  ViewApplicantProfileState>(
                listenWhen: (previous, current) {
                  if (previous.isLoading) {
                    Navigator.of(context).pop();
                  }
                  return true;
                },
                listener: (context, state) {
                  if (state.isLoading) {
                    loadingAnimation(context);
                  }
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
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ViewApplicantProfileCubit, ViewApplicantProfileState>(
      buildWhen: (previous, current) =>
          previous.isTop != current.isTop || previous.user != current.user,
      builder: (context, state) {
        return SliverAppBar(
          leading: IconButton(
            onPressed: () => context.router.pop(),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          backgroundColor: state.isTop ? AppColors.primary : Colors.transparent,
          elevation: 0,
          pinned: true,
          centerTitle: true,
          stretch: true,
          expandedHeight: 0.6 * width,
          title: AnimatedOpacity(
            opacity: !state.isTop ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Text(
              state.user?.name ?? "",
              style: AppStyles.normalTextWhite
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(state.user),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar(UserEntity? user) {
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      height: 0.6 * width,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                gradient: const LinearGradient(
                  colors: [Color(0xFF130160), Color(0xFF36353C)],
                  transform: GradientRotation(0.2),
                ),
              ),
              width: width,
              height: 0.6 * width,
              child: SvgPicture.asset(AppImages.profileBackground),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: user?.avatar ?? "",
                      height: 80,
                      width: 80,
                      placeholder: (context, url) =>
                          const ItemLoading(width: 80, height: 80, radius: 90),
                      errorWidget: (context, url, error) =>
                          SvgPicture.asset(AppImages.logo),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    user?.name ?? "----",
                    style: AppStyles.boldTextWhite.copyWith(fontSize: 16),
                  ),
                  Text(
                    (user?.address ?? "").isEmpty ? "-----" : user!.address,
                    style: AppStyles.normalTextWhite.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _itemFollow(
                        title: AppLocal.text.applicant_profile_page_follow,
                        number: "${user?.follower.length ?? 0}",
                      ),
                      const SizedBox(width: 30),
                      _itemFollow(
                        title: AppLocal.text.applicant_profile_page_following,
                        number: "${user?.following.length ?? 0}",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemFollow({required String title, required String number}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: number,
            style: AppStyles.boldTextWhite.copyWith(fontSize: 16),
          ),
          TextSpan(
            text: " $title",
            style: AppStyles.normalTextWhite.copyWith(fontSize: 14),
          )
        ],
      ),
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
          controller: context.read<ViewApplicantProfileCubit>().tabController,
          tabAlignment: TabAlignment.fill,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700),
          onTap: onTap,
          tabs: [
            Tab(text: AppLocal.text.applicant_profile_page_about),
            Tab(text: AppLocal.text.applicant_profile_page_post),
          ],
        ),
      ),
    );
  }
}
