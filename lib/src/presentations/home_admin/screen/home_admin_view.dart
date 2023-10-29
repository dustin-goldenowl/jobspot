import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/router/home_admin_coordinator.dart';
import 'package:jobspot/src/presentations/home_admin/widgets/company_item.dart';
import 'package:jobspot/src/presentations/home_admin/widgets/company_item_loading.dart';

class HomeAdminView extends StatelessWidget {
  const HomeAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: _buildAppBar(context, width: width),
      body: RefreshIndicator(
        onRefresh: context.read<HomeAdminCubit>().getListCompany,
        child: BlocListener<HomeAdminCubit, HomeAdminState>(
          listener: (context, state) {
            if (state.error != null) {
              customToast(context, text: state.error ?? "");
            }
          },
          child: _buildListCompany(),
        ),
      ),
    );
  }

  Widget _buildListCompany() {
    return BlocBuilder<HomeAdminCubit, HomeAdminState>(
      builder: (context, state) {
        return ListView.separated(
          controller: context.read<HomeAdminCubit>().scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemCount: (state.listCompany?.length ?? 9) + 1,
          itemBuilder: (context, index) {
            return state.listCompany != null &&
                    index < state.listCompany!.length
                ? CompanyItem(
                    onViewCompany: HomeAdminCoordinator.showViewCompany,
                    company: state.listCompany![index],
                    onConsider: (status) => context
                        .read<HomeAdminCubit>()
                        .considerCompany(ConsiderCompany(
                          status: status,
                          toUserID: state.listCompany![index].id,
                        )),
                  )
                : state.isMore
                    ? const CompanyItemLoading()
                    : const SizedBox();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    required double width,
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
                onTap: HomeAdminCoordinator.showSetting,
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
