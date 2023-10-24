import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: BlocListener<ViewLanguageCubit, ViewLanguageState>(
          listener: (context, state) {
            if (state.error != null) {
              customToast(context, text: state.error ?? "");
            }
          },
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(height: 30),
              Expanded(child: _buildListLanguage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListLanguage() {
    return BlocBuilder<ViewLanguageCubit, ViewLanguageState>(
      buildWhen: (previous, current) =>
          previous.listLanguage != current.listLanguage,
      builder: (context, state) {
        if (state.listLanguage != null && state.listLanguage!.isEmpty) {
          return Center(
              child: Text(
            AppLocal.text.add_language_page_no_language,
            style: AppStyles.boldTextMulledWine.copyWith(fontSize: 16),
          ));
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (state.listLanguage != null) {
              return _buildItemLanguage(
                context,
                language: state.listLanguage![index],
              );
            }
            return const CircularProgressIndicator();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.listLanguage?.length ?? 10,
        );
      },
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Text(
          AppLocal.text.add_language_page_language,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ViewLanguageCoordinator.showAddLanguage,
          child: Row(
            children: [
              Text(
                AppLocal.text.add_language_page_add,
                style: TextStyle(
                  color: AppColors.veryLightBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.interdimensionalBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                  color: AppColors.interdimensionalBlue,
                  size: 10,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemLanguage(
    BuildContext context, {
    required LanguageEntity language,
  }) {
    return GestureDetector(
      onTap: () => ViewLanguageCoordinator.showAddLanguage(language: language),
      child: Container(
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
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: language.code.flagLink,
                    height: 40,
                    fit: BoxFit.none,
                    placeholder: (context, url) =>
                        const ItemLoading(width: 40, height: 40, radius: 90),
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppImages.logo),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  language.isFirst
                      ? AppLocal.text
                          .add_language_page_language_first(language.name)
                      : language.name,
                  style: AppStyles.boldTextHaiti,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context
                      .read<ViewLanguageCubit>()
                      .deleteLanguage(language.id),
                  child: SvgPicture.asset(
                    AppImages.trash,
                    colorFilter: ColorFilter.mode(
                        AppColors.venetianRed, BlendMode.srcIn),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              AppLocal.text.add_language_page_oral_level(language.oralLevel),
              style: AppStyles.normalTextSpunPearl,
            ),
            const SizedBox(height: 10),
            Text(
              AppLocal.text
                  .add_language_page_written_level(language.writtenLevel),
              style: AppStyles.normalTextSpunPearl,
            ),
          ],
        ),
      ),
    );
  }
}
