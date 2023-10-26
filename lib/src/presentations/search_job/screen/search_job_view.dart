import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class SearchJobView extends StatelessWidget {
  const SearchJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: context.read<SearchJobCubit>().scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (_, __) => [_buildAppBar(context)],
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      buildWhen: (previous, current) => previous.listJob != current.listJob,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {},
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(AppDimens.smallPadding),
            itemBuilder: (context, index) {
              if (state.listJob != null) {
                return CustomJobCard(
                  job: state.listJob![index],
                  button: const SizedBox(),
                  onTap: () {},
                );
              }
              return const CustomJobCardLoading(isShowApply: false);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: state.listJob?.length ?? 10,
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      builder: (context, state) {
        return SliverAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.filter),
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
              "Search",
              style: AppStyles.normalTextWhite
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            expandedTitleScale: 1.0,
            centerTitle: false,
            titlePadding: const EdgeInsets.all(16),
            background: _buildBackgroundAppbar(context, width: width),
          ),
        );
      },
    );
  }

  Widget _buildBackgroundAppbar(BuildContext context, {required double width}) {
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
                  CustomTitleTextInput(
                    controller: context.read<SearchJobCubit>().searchController,
                    hintText: "Design",
                    isSearch: true,
                    textInputAction: TextInputAction.search,
                  ),
                  const SizedBox(height: 15),
                  CustomTitleTextInput(
                    controller: TextEditingController(),
                    hintText: "HCMC - VietNam",
                    prefixIcon: const Icon(FontAwesomeIcons.locationDot),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
