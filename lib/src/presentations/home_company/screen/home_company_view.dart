import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/home_applicant/widgets/job_card_loading.dart';
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart';
import 'package:jobspot/src/presentations/home_company/domain/router/home_company_coordinator.dart';
import 'package:jobspot/src/presentations/home_company/widgets/item_my_job.dart';

class HomeCompanyView extends StatelessWidget {
  const HomeCompanyView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      key: Key(AppLocalizations.of(context)!.key),
      appBar: _buildAppBar(
        context,
        width: width,
        onTap: () {
          //TODO don't think using
          getIt<AppRouter>().push(const SettingRoute());
        },
      ),
      body: BlocListener<HomeCompanyCubit, HomeCompanyState>(
        listener: (context, state) {
          if (state.error != null) {
            customToast(context, text: state.error ?? "");
          }
        },
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            AppLocal.text.home_company_page_my_job_list,
            style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Expanded(child: _buildListMyJob(context))
        ],
      ),
    );
  }

  Widget _buildListMyJob(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<HomeCompanyCubit>().getListMyJob,
      child: BlocBuilder<HomeCompanyCubit, HomeCompanyState>(
        builder: (context, state) {
          return ListView.separated(
            controller: context.read<HomeCompanyCubit>().scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemBuilder: (context, index) {
              return state.jobs != null && index < state.jobs!.length
                  ? ItemMyJob(
                      myJob: state.jobs![index],
                      onTap: HomeCompanyCoordinator.showViewJobApplicant,
                    )
                  : state.isMore
                      ? const JobCardLoading()
                      : _buildNoJob();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: (state.jobs?.length ?? 9) + 1,
          );
        },
      ),
    );
  }

  Widget _buildNoJob() {
    return Center(
      child: Text(
        AppLocal.text.home_company_page_no_job,
        style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
      ),
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
}
