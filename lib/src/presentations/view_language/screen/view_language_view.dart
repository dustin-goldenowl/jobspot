import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/view_language/domain/router/view_language_coordinator.dart';

class ViewLanguageView extends StatelessWidget {
  const ViewLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 80,
        child: Center(
          child: SizedBox(
            width: 200,
            child: CustomButton(
              onPressed: () {},
              title: AppLocal.text.add_language_page_save.toUpperCase(),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildItemLanguage();
            },
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          "Language",
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ViewLanguageCoordinator.showAddLanguage,
          child: Row(
            children: [
              const Text(
                "Add",
                style: TextStyle(
                  color: Color(0xFF7551FF),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF3F13E4).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Color(0xFF3F13E4),
                  size: 10,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemLanguage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Indonesian(First language)",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.haiti,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AppImages.trash,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFFFC4646),
                    BlendMode.srcIn,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Oral : Level 10",
            style: TextStyle(color: AppColors.spunPearl),
          ),
          const SizedBox(height: 10),
          Text(
            "Written : Level 10",
            style: TextStyle(color: AppColors.spunPearl),
          ),
        ],
      ),
    );
  }
}
