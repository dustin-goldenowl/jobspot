import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_title_text_input.dart';

class AddSkillView extends StatelessWidget {
  const AddSkillView({super.key});

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
        child: BlocListener<AddSkillCubit, AddSkillState>(
          listenWhen: (previous, current) {
            if (previous.isLoading) Navigator.of(context).pop();

            if (previous.isLoading && current.error == null) {
              context.router.pop();
            }
            return true;
          },
          listener: (context, state) {
            if (state.isLoading) {
              loadingAnimation(context);
            }
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
          AppLocal.text.add_skill_page_add_skill,
          style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 30),
        _buildSearch(context),
        Expanded(child: _buildContent()),
      ],
    );
  }

  Widget _buildSearch(BuildContext context) {
    return BlocBuilder<AddSkillCubit, AddSkillState>(
      buildWhen: (previous, current) => previous.query != current.query,
      builder: (context, state) {
        return CustomTitleTextInput(
          controller: context.read<AddSkillCubit>().searchController,
          focusNode: context.read<AddSkillCubit>().searchFocusNode,
          hintText: AppLocal.text.add_skill_page_search_skill,
          isSearch: true,
          textInputAction: TextInputAction.search,
        );
      },
    );
  }

  Widget _buildContent() {
    return BlocBuilder<AddSkillCubit, AddSkillState>(
      builder: (context, state) {
        return state.isFocus
            ? _listSearch(context, listSearch: state.listSearch)
            : _listSkill(context, listSkill: state.listSkill);
      },
    );
  }

  Widget _listSearch(
    BuildContext context, {
    required List<SkillEntity> listSearch,
  }) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 30),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () =>
              context.read<AddSkillCubit>().addSkill(listSearch[index]),
          child: Text(
            listSearch[index].title,
            style: AppStyles.normalTextMulledWine,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemCount: listSearch.length,
    );
  }

  Widget _listSkill(
    BuildContext context, {
    required List<SkillEntity> listSkill,
  }) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: List.generate(
            listSkill.length,
            (index) => Chip(
              backgroundColor: AppColors.ghost.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              label: Text(
                listSkill[index].title,
                style: AppStyles.normalTextMulledWine,
              ),
              onDeleted: () =>
                  context.read<AddSkillCubit>().removeSkill(listSkill[index]),
              deleteIcon: const Icon(FontAwesomeIcons.xmark, size: 20),
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
          ),
        ),
        const Spacer(),
        CustomButton(
          onPressed: context.read<AddSkillCubit>().updateListSkill,
          title: AppLocal.text.add_skill_page_save,
        )
      ],
    );
  }
}
