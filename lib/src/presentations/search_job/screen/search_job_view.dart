import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/bloc/app_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card_loading.dart';
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart';
import 'package:jobspot/src/presentations/search_job/domain/router/search_job_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

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
      buildWhen: (previous, current) =>
          previous.listJob != current.listJob ||
          previous.isMore != current.isMore,
      builder: (context, state) {
        if (state.listJob != null && state.listJob!.isEmpty) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  SvgPicture.asset(
                    AppImages.noResult,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    AppLocal.text.search_job_page_no_results_found,
                    style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocal.text.search_job_page_no_results_found_content,
                    textAlign: TextAlign.center,
                    style: AppStyles.normalTextMulledWine,
                  )
                ],
              ),
            ),
          );
        }
        return _buildListJob(context, state);
      },
    );
  }

  Widget _buildListJob(BuildContext context, SearchJobState state) {
    return RefreshIndicator(
      onRefresh: context.read<SearchJobCubit>().searchJob,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        itemCount: (state.listJob?.length ?? 9) + 1,
        itemBuilder: (context, index) {
          return state.listJob != null && index < state.listJob!.length
              ? _buildJobItem(state.listJob![index])
              : state.isMore
                  ? const CustomJobCardLoading(isShowApply: false)
                  : _buildNoJob();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }

  Widget _buildJobItem(JobEntity job) {
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      buildWhen: (previous, current) => current.saveJobID == job.id,
      builder: (context, state) {
        if (state.saveJobID == job.id) {
          context.read<AppBloc>().add(ChangeSaveJobEvent(job.id));
        }
        final user = PrefsUtils.getUserInfo()!;
        final isSave = user.saveJob?.contains(job.id) ?? false;
        return CustomJobCard(
          job: job,
          button: IconButton(
            icon: SvgPicture.asset(
              isSave ? AppImages.saved : AppImages.saveJob,
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                isSave ? AppColors.deepSaffron : AppColors.mulledWine,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () => context.read<SearchJobCubit>().saveJob(job.id),
          ),
          onTap: () => SearchJobCoordinator.showViewJob(job.id),
        );
      },
    );
  }

  Widget _buildNoJob() {
    return Center(
      child: Text(
        AppLocal.text.search_job_page_no_more_search_results,
        style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      builder: (context, state) {
        return SliverAppBar(
          actions: [
            IconButton(
              onPressed: () => SearchJobCoordinator.showFilterJob(
                onBack: context.read<SearchJobCubit>().changeFilter,
                filter: context.read<SearchJobCubit>().filter,
              ),
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
              AppLocal.text.search_job_page_search,
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
                  _buildSearch(),
                  const SizedBox(height: 15),
                  CustomTitleTextInput(
                    controller:
                        context.read<SearchJobCubit>().locationController,
                    hintText: AppLocal.text.search_job_page_location_hint,
                    prefixIcon: const Icon(FontAwesomeIcons.locationDot),
                    onTap: () => SearchJobCoordinator.showLocation(
                        context.read<SearchJobCubit>().setLocation),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return BlocBuilder<SearchJobCubit, SearchJobState>(
      buildWhen: (previous, current) => previous.query != current.query,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<SearchJobCubit>().searchController,
          hintText: AppLocal.text.search_job_page_search_hint,
          isSearch: true,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) =>
              context.read<SearchJobCubit>().searchJob(),
        );
      },
    );
  }
}
