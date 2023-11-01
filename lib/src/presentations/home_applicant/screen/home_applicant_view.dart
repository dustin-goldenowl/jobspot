import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/router/home_applicant_coordinator.dart';
import 'package:jobspot/src/presentations/home_applicant/widgets/job_card_loading.dart';
import 'package:jobspot/src/presentations/home_applicant/widgets/recent_job_card.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class HomeApplicantView extends StatelessWidget {
  const HomeApplicantView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      key: Key(AppLocalizations.of(context)!.key),
      appBar: _buildAppBar(
        context,
        width: width,
        onTap: HomeApplicantCoordinator.showApplicantProfile,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeApplicantCubit>().fetchJobData();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildFindYourJob(
                  width: (width - 3 * AppDimens.smallPadding) / 2,
                ),
                const SizedBox(height: 20),
                _buildRecentJobList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentJobList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.home_page_recent_job_list,
          style: AppStyles.boldText.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeApplicantCubit, HomeApplicantState>(
          buildWhen: (previous, current) =>
              current.jobID == null && current.error == null,
          builder: (context, state) {
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 10),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final job = state.data?.jobs[index];
                return state.data != null
                    ? _buildJobItem(job!)
                    : const JobCardLoading();
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.data?.jobs.length ?? 10,
            );
          },
        )
      ],
    );
  }

  Widget _buildJobItem(JobEntity job) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) =>
          current.jobID == job.id || (current.isDeleteAllSaveJob ?? false),
      builder: (context, state) {
        return BlocBuilder<HomeApplicantCubit, HomeApplicantState>(
          buildWhen: (previous, current) => current.jobID == job.id,
          builder: (context, state) {
            return RecentJobCard(
              job: job,
              onTap: () =>
                  HomeApplicantCoordinator.showViewJobDescription(job.id),
              onSave: () => context.read<HomeApplicantCubit>().saveJob(job.id),
              onApply: () => HomeApplicantCoordinator.showApplyJob(job: job),
              isSave: PrefsUtils.getUserInfo()!.saveJob!.contains(job.id),
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    required double width,
    required VoidCallback onTap,
  }) {
    final user = PrefsUtils.getUserInfo();
    return PreferredSize(
      preferredSize: Size(width, 90),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.smallPadding,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocal.text.home_page_hello(user?.name ?? ""),
                style: AppStyles.boldTextNightBlue.copyWith(fontSize: 22),
              ),
              GestureDetector(
                onTap: onTap,
                child: Hero(
                  tag: AppTags.avatar,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: user?.avatar ?? "",
                      placeholder: (_, __) =>
                          const ItemLoading(width: 40, height: 40, radius: 0),
                      errorWidget: (_, __, ___) =>
                          SvgPicture.asset(AppImages.logo),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFindYourJob({required double width}) {
    return BlocBuilder<HomeApplicantCubit, HomeApplicantState>(
      buildWhen: (previous, current) =>
          current.jobID == null && current.error == null,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.home_page_find_your_job,
              style: AppStyles.boldText.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildRemoteJobWidget(
                  width,
                  quantity: "${state.data?.remote ?? 0}",
                  onTap: () =>
                      HomeApplicantCoordinator.showSearchJob(isRemote: true),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    _buildJobContainer(
                      width: width,
                      title: AppLocal.text.home_page_full_time,
                      quantity: "${state.data?.fulltime ?? 0}",
                      color: AppColors.vodka,
                      onTap: () =>
                          HomeApplicantCoordinator.showSearchJob(fulltime: 0),
                    ),
                    const SizedBox(height: 20),
                    _buildJobContainer(
                      width: width,
                      title: AppLocal.text.home_page_part_time,
                      quantity: "${state.data?.parttime ?? 0}",
                      color: AppColors.feldspar,
                      onTap: () =>
                          HomeApplicantCoordinator.showSearchJob(fulltime: 1),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildJobContainer({
    required double width,
    required String title,
    required String quantity,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        width: width,
        height: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quantity,
              style: AppStyles.boldTextNightBlue.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(title, style: AppStyles.normalTextNightBlue),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoteJobWidget(
    double width, {
    required String quantity,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: width + AppDimens.smallPadding,
        decoration: BoxDecoration(
          color: const Color(0xFFAFECFE),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.findJob, width: width / 4),
            const SizedBox(height: 15),
            Text(
              quantity,
              style: AppStyles.boldTextNightBlue.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              AppLocal.text.home_page_remote_job,
              style: AppStyles.normalTextNightBlue,
            ),
          ],
        ),
      ),
    );
  }
}
