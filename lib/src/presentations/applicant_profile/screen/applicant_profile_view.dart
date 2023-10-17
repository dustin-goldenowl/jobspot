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
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart';

class ApplicantProfileView extends StatefulWidget {
  const ApplicantProfileView({super.key});

  @override
  State<ApplicantProfileView> createState() => _ApplicantProfileViewState();
}

class _ApplicantProfileViewState extends State<ApplicantProfileView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    final cubit = context.read<ApplicantProfileCubit>();
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
    return AutoTabsRouter.pageView(
      routes: const [AboutTab(), PostTab()],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              controller:
                  context.read<ApplicantProfileCubit>().scrollController,
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
              body: BlocListener<ApplicantProfileCubit, ApplicantProfileState>(
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
    return BlocBuilder<ApplicantProfileCubit, ApplicantProfileState>(
      builder: (context, state) {
        return SliverAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.setting),
            ),
            const SizedBox(width: 5),
          ],
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
              PrefsUtils.getUserInfo()?.name ?? "",
              style: AppStyles.normalTextWhite
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar() {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: PrefsUtils.getUserInfo()!.avatar,
                      height: 50,
                      width: 50,
                      placeholder: (context, url) =>
                          const ItemLoading(width: 50, height: 50, radius: 90),
                      errorWidget: (context, url, error) =>
                          SvgPicture.asset(AppImages.logo),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    PrefsUtils.getUserInfo()?.name ?? "",
                    style: AppStyles.boldTextWhite.copyWith(fontSize: 16),
                  ),
                  Text(
                    PrefsUtils.getUserInfo()!.address.isEmpty
                        ? "-----"
                        : PrefsUtils.getUserInfo()!.address,
                    style: AppStyles.normalTextWhite.copyWith(fontSize: 14),
                  ),
                  const Spacer(),
                  _buildBottomAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return Row(
      children: [
        _itemFollow(
          title: AppLocal.text.applicant_profile_page_follow,
          number: "${PrefsUtils.getUserInfo()!.follower.length}",
        ),
        const SizedBox(width: 20),
        _itemFollow(
          title: AppLocal.text.applicant_profile_page_following,
          number: "${PrefsUtils.getUserInfo()!.following.length}",
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Row(
              children: [
                Text(
                  AppLocal.text.applicant_profile_page_edit_profile,
                  style: AppStyles.normalTextWhite.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  AppImages.edit,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ),
        )
      ],
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
          controller: context.read<ApplicantProfileCubit>().tabController,
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
