import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class JobPositionView extends StatelessWidget {
  const JobPositionView({super.key, required this.onBack});

  final Function(String jobTitle) onBack;

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
              AppLocal.text.job_position_page_job_position,
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
    return BlocBuilder<JobPositionCubit, JobPositionState>(
      buildWhen: (previous, current) => previous.text != current.text,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<JobPositionCubit>().searchController,
          isSearch: true,
          hintText: AppLocal.text.job_position_page_search,
          textCapitalization: TextCapitalization.words,
        );
      },
    );
  }

  Widget _buildListResult() {
    return BlocBuilder<JobPositionCubit, JobPositionState>(
      buildWhen: (previous, current) => previous.dataState != current.dataState,
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.smallPadding),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount:
              state.dataState != null ? state.dataState!.data!.length : 0,
          itemBuilder: (context, index) {
            String title = state.dataState!.data![index].capitalizedString;
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onBack(title);
                context.router.pop();
              },
              child: Text(title, style: AppStyles.normalTextMulledWine),
            );
          },
        );
      },
    );
  }
}
