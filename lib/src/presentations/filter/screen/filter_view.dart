import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/filter/cubit/filter_cubit.dart';
import 'package:jobspot/src/presentations/filter/domain/entities/filter_entity.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key, required this.onBack});

  final Function(FilterEntity entity) onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.filter_page_filter),
        centerTitle: true,
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Center(
          child: CustomButton(
            onPressed: () {
              onBack(context.read<FilterCubit>().getSearchEntity());
              context.popRoute();
            },
            title: AppLocal.text.filter_page_apply_now.toUpperCase(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) => _buildBody(state, context),
        ),
      ),
    );
  }

  Widget _buildBody(FilterState state, BuildContext context) {
    return Column(
      children: [
        ExpansionPanelList(
          dividerColor: Colors.transparent,
          elevation: 0,
          materialGapSize: 0,
          expansionCallback: context.read<FilterCubit>().changeExpand,
          expandIconColor: AppColors.haiti,
          children: [
            _buildLastUpdate(
              context,
              isExpanded: state.isExpandedLastUpdate,
              currentIndex: state.indexLastUpdate,
            ),
            _buildTypeWorkplace(
              context,
              isExpanded: state.isExpandedTypeWorkplace,
              currentIndex: state.indexTypeWorkplace,
            ),
            _buildJobType(
              context,
              isExpanded: state.isExpandedJobType,
              currentIndex: state.indexJobType,
            ),
            _buildPositionLevel(
              context,
              isExpanded: state.isExpandedLevel,
              currentIndex: state.indexLevel,
            ),
            _buildSalary(
              context,
              isExpanded: state.isExpandedSalary,
              values: state.salary,
            ),
          ],
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  ExpansionPanel _buildLastUpdate(
    BuildContext context, {
    required bool isExpanded,
    int? currentIndex,
  }) {
    return _customExpansionPanel(
      title: AppLocal.text.filter_page_last_update,
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<FilterCubit>().changeLastUpdate(index),
            child: Row(
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: AppColors.mulledWine),
                  child: Radio(
                    value: index,
                    groupValue: currentIndex,
                    onChanged: context.read<FilterCubit>().changeLastUpdate,
                    activeColor: AppColors.deepSaffron,
                  ),
                ),
                Text(AppLists.listTimeUpdate[index])
              ],
            ),
          );
        },
        itemCount: AppLists.listTimeUpdate.length,
      ),
      isExpanded: isExpanded,
    );
  }

  ExpansionPanel _buildTypeWorkplace(
    BuildContext context, {
    required bool isExpanded,
    int? currentIndex,
  }) {
    return _customExpansionPanel(
      title: AppLocal.text.filter_page_type_workplace,
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<FilterCubit>().changeTypeWorkplace(index),
            child: Row(
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: AppColors.mulledWine),
                  child: Radio(
                    value: index,
                    groupValue: currentIndex,
                    onChanged: context.read<FilterCubit>().changeTypeWorkplace,
                    activeColor: AppColors.deepSaffron,
                  ),
                ),
                Text(AppLists.listTypeWorkplace[index]["title"]!)
              ],
            ),
          );
        },
        itemCount: AppLists.listTypeWorkplace.length,
      ),
      isExpanded: isExpanded,
    );
  }

  ExpansionPanel _buildJobType(
    BuildContext context, {
    required bool isExpanded,
    int? currentIndex,
  }) {
    return _customExpansionPanel(
      title: AppLocal.text.filter_page_job_type,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(
            AppLists.listJobType.length,
            (index) => TagItem(
              onTap: () => context.read<FilterCubit>().changeJobType(index),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              title: AppLists.listJobType[index],
              isSelect: index == currentIndex,
            ),
          ),
        ),
      ),
      isExpanded: isExpanded,
    );
  }

  ExpansionPanel _buildPositionLevel(
    BuildContext context, {
    required bool isExpanded,
    int? currentIndex,
  }) {
    return _customExpansionPanel(
      title: AppLocal.text.filter_page_position_level,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: List.generate(
            AppLists.listLevel.length,
            (index) => TagItem(
              onTap: () => context.read<FilterCubit>().changeLevel(index),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              title: AppLists.listLevel[index],
              isSelect: index == currentIndex,
            ),
          ),
        ),
      ),
      isExpanded: isExpanded,
    );
  }

  ExpansionPanel _buildSalary(
    BuildContext context, {
    required bool isExpanded,
    required RangeValues values,
  }) {
    return _customExpansionPanel(
      title: AppLocal.text.filter_page_salary,
      body: RangeSlider(
        max: 100000,
        min: 10,
        values: values,
        divisions: 9999,
        labels: RangeLabels(
          values.start.toStringAsFixed(0),
          values.end.toStringAsFixed(0),
        ),
        activeColor: AppColors.deepSaffron,
        inactiveColor: AppColors.paleSilver,
        onChanged: context.read<FilterCubit>().changeSalary,
      ),
      isExpanded: isExpanded,
    );
  }

  ExpansionPanel _customExpansionPanel({
    required String title,
    required Widget body,
    required bool isExpanded,
  }) {
    return ExpansionPanel(
      backgroundColor: AppColors.scaffoldBackground,
      headerBuilder: (context, isExpanded) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: AppDimens.smallPadding),
            child: Text(
              title,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
            ),
          ),
        );
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.smallPadding),
        child: body,
      ),
      isExpanded: isExpanded,
    );
  }
}
