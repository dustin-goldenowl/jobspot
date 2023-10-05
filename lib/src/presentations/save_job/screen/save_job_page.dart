import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/save_job/widgets/custom_job_card.dart';

class SaveJobPage extends StatelessWidget {
  const SaveJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocal.text.save_job_page_save_job,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppLocal.text.save_job_page_delete_all,
              style: TextStyle(color: AppColors.deepSaffron),
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppDimens.smallPadding),
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomJobCard(
              button: IconButton(
                onPressed: () {
                  showBottomSheetOption(context);
                },
                icon: const Icon(FontAwesomeIcons.ellipsisVertical),
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }

  void showBottomSheetOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B5858),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 50),
              _buildOption(
                onTap: () {
                  context.router.pop();
                  customToast(context, text: "Tính năng chưa ra mắt");
                },
                title: AppLocal.text.save_job_page_send_message,
                icon: AppImages.send,
              ),
              const SizedBox(height: 30),
              _buildOption(
                onTap: () {},
                title: AppLocal.text.save_job_page_share,
                icon: AppImages.share,
              ),
              const SizedBox(height: 30),
              _buildOption(
                onTap: () {},
                title: AppLocal.text.save_job_page_delete,
                icon: AppImages.trash,
              ),
              const SizedBox(height: 30),
              _buildOption(
                onTap: () {},
                title: AppLocal.text.save_job_page_apply,
                icon: AppImages.checkCircle,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              Color(0xFF524B6C),
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 15),
          Text(title, style: AppStyles.normalTextHaiti)
        ],
      ),
    );
  }
}
