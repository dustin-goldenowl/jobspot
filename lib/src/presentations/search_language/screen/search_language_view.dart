import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';

import '../../sign_in/widgets/custom_title_text_input.dart';

class SearchLanguageView extends StatelessWidget {
  const SearchLanguageView({super.key, required this.onBack});

  final Function(CountryEntity country) onBack;

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
        padding:
            const EdgeInsets.all(AppDimens.smallPadding).copyWith(bottom: 0),
        child: _buildBody(context),
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
        CustomTitleTextInput(
          controller: context.read<SearchLanguageCubit>().searchController,
          hintText: AppLocal.text.add_language_page_search_language,
          isSearch: true,
          textInputAction: TextInputAction.search,
        ),
        Expanded(child: _buildListLanguage())
      ],
    );
  }

  Widget _buildListLanguage() {
    return BlocBuilder<SearchLanguageCubit, SearchLanguageState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 30),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (state.countries != null) {
              return _buildItemLanguage(
                context,
                country: state.countries![index],
              );
            }
            return _languageLoading();
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: state.countries?.length ?? 10,
        );
      },
    );
  }

  Widget _buildItemLanguage(
    BuildContext context, {
    required CountryEntity country,
  }) {
    return GestureDetector(
      onTap: () {
        context.router.pop();
        onBack(country);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: country.code.flagLink,
                height: 40,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const ItemLoading(width: 40, height: 40, radius: 90),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset(AppImages.logo),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                country.name,
                style: AppStyles.normalTextHaiti,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageLoading() {
    Random random = Random();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          const ItemLoading(width: 40, height: 40, radius: 90),
          const SizedBox(width: 10),
          ItemLoading(width: random.nextInt(50) + 100, height: 16, radius: 5),
        ],
      ),
    );
  }
}
