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
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/add_language_coordinator.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class AddLanguageView extends StatelessWidget {
  const AddLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Center(
          child: SizedBox(
            width: 200,
            child: CustomButton(
              onPressed: context.read<AddLanguageCubit>().save,
              title: AppLocal.text.add_language_page_save.toUpperCase(),
            ),
          ),
        ),
      ),
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
        child: BlocListener<AddLanguageCubit, AddLanguageState>(
          listenWhen: (previous, current) {
            if (previous.isLoading && current.error == null) {
              Navigator.of(context).pop();
              context.router.pop();
            }
            return true;
          },
          listener: (context, state) {
            if (state.isLoading) loadingAnimation(context);

            if (state.error != null) {
              customToast(context, text: state.error ?? "");
            }
          },
          child: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocal.text.add_language_page_add_language,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              _buildLanguage(),
              const SizedBox(height: 20),
              Divider(color: AppColors.platinum, thickness: 0.5),
              _buildFirstLanguage()
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOral(context),
              const SizedBox(height: 20),
              Divider(color: AppColors.platinum, thickness: 0.5),
              const SizedBox(height: 20),
              _buildWritten(),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            AppLocal.text.add_language_page_level_content,
            style: AppStyles.normalTextSpunPearl,
          ),
        ),
      ],
    );
  }

  Widget _buildWritten() {
    return BlocBuilder<AddLanguageCubit, AddLanguageState>(
      buildWhen: (previous, current) =>
          previous.writtenLevel != current.writtenLevel,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.add_language_page_written,
              style: AppStyles.boldTextHaiti,
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => context
                  .read<AddLanguageCubit>()
                  .showPickOralDialog(context, isOral: false),
              child: Text(
                AppLocal.text.add_language_page_level(state.writtenLevel),
                style: AppStyles.normalTextSpunPearl,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOral(BuildContext context) {
    return BlocBuilder<AddLanguageCubit, AddLanguageState>(
      buildWhen: (previous, current) => previous.oralLevel != current.oralLevel,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.add_language_page_oral,
              style: AppStyles.boldTextHaiti,
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () =>
                  context.read<AddLanguageCubit>().showPickOralDialog(context),
              child: Text(
                AppLocal.text.add_language_page_level(state.oralLevel),
                style: AppStyles.normalTextSpunPearl,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFirstLanguage() {
    return BlocBuilder<AddLanguageCubit, AddLanguageState>(
      buildWhen: (previous, current) => previous.isFirst != current.isFirst,
      builder: (context, state) {
        return Row(
          children: [
            Text(
              AppLocal.text.add_language_page_first_language,
              style: AppStyles.boldTextHaiti,
            ),
            const Spacer(),
            Radio(
              value: true,
              groupValue: state.isFirst,
              onChanged: (value) {
                context.read<AddLanguageCubit>().changeFirstLanguage(value!);
              },
              activeColor: AppColors.deepSaffron,
            )
          ],
        );
      },
    );
  }

  Widget _buildLanguage() {
    return BlocBuilder<AddLanguageCubit, AddLanguageState>(
      buildWhen: (previous, current) => previous.country != current.country,
      builder: (context, state) {
        return Row(
          children: [
            Text(
              AppLocal.text.add_language_page_language,
              style: AppStyles.boldTextHaiti,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => AddLanguageCoordinator.showSearchLanguage(
                onBack: context.read<AddLanguageCubit>().changeLanguage,
              ),
              child: state.country != null
                  ? Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: state.country!.code.flagLink,
                            height: 40,
                            fit: BoxFit.none,
                            placeholder: (context, url) => const ItemLoading(
                                width: 40, height: 40, radius: 90),
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(AppImages.logo),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          state.country!.name,
                          style: AppStyles.normalTextMulledWine,
                        ),
                      ],
                    )
                  : Text(
                      AppLocal.text.add_language_page_choose_language,
                      style: AppStyles.normalTextMulledWine,
                    ),
            )
          ],
        );
      },
    );
  }
}
