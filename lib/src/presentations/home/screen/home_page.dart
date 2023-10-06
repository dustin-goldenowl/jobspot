import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: _buildAppBar(
        width: width,
        onTap: () {},
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
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
                  context,
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
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomJobCard(
              button: IconButton(
                icon: SvgPicture.asset(AppImages.save),
                onPressed: () {},
              ),
              onTap: () {},
              isShowApply: true,
              onApply: () {},
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 10,
        )
      ],
    );
  }

  PreferredSizeWidget _buildAppBar({
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
                child: ClipOval(
                  child: user!.avatar.isEmpty
                      ? SvgPicture.asset(AppImages.logo, height: 40, width: 40)
                      : CachedNetworkImage(
                          imageUrl: user.avatar,
                          placeholder: (_, __) => const ItemLoading(
                              width: 40, height: 40, radius: 0),
                          errorWidget: (_, __, ___) =>
                              const Icon(Icons.warning),
                          height: 40,
                          width: 40,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFindYourJob(BuildContext context, {required double width}) {
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
              onTap: () {},
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                _buildJobContainer(
                  width: width,
                  title: AppLocal.text.home_page_full_time,
                  quantity: "66.8k", //Hard text to test UI
                  color: const Color(0xFFBEAFFE),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                _buildJobContainer(
                  width: width,
                  title: AppLocal.text.home_page_part_time,
                  quantity: "38.9k", //Hard text to test UI
                  color: const Color(0xFFFFD6AD),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ],
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

  Widget _buildRemoteJobWidget(double width, {required VoidCallback onTap}) {
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
              "44.5K",
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
