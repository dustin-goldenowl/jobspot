import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/location/cubit/location_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key, required this.onBack});

  final Function(int code) onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: const Icon(FontAwesomeIcons.xmark),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.smallPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocal.text.location_page_location,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 30),
            _buildSearch(),
            Expanded(child: _buildListResult())
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return BlocBuilder<LocationCubit, LocationState>(
      buildWhen: (previous, current) => previous.text != current.text,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<LocationCubit>().searchController,
          isSearch: true,
          hintText: AppLocal.text.location_page_search,
          textCapitalization: TextCapitalization.words,
        );
      },
    );
  }

  Widget _buildListResult() {
    return BlocBuilder<LocationCubit, LocationState>(
      buildWhen: (previous, current) => previous.provinces != current.provinces,
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.smallPadding),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: state.provinces.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onBack(state.provinces[index]["code"]);
                context.router.pop();
              },
              child: Text(
                state.provinces[index]["name"],
                style: AppStyles.normalTextMulledWine,
              ),
            );
          },
        );
      },
    );
  }
}
