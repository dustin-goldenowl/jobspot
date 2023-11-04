import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/test_iq/cubit/test_iq_cubit.dart';
import 'package:jobspot/src/presentations/test_iq/domain/router/test_iq_coordinator.dart';

class TestIQView extends StatelessWidget {
  const TestIQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TestIQCubit, TestIQState>(
        buildWhen: (previous, current) =>
            current.currentPage >= (current.questions?.length ?? 0) ||
            previous.questions != current.questions,
        builder: (context, state) {
          if (state.questions != null) {
            bool isScroll = state.currentPage < state.questions!.length;
            if (!isScroll) {
              context.read<TestIQCubit>().nextPage();
            }
            return SafeArea(
              child: PageView.builder(
                physics: isScroll
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                controller: context.read<TestIQCubit>().controller,
                onPageChanged: context.read<TestIQCubit>().onChangePage,
                itemCount: state.questions!.length + (isScroll ? 0 : 1),
                itemBuilder: (context, index) {
                  if (index < state.questions!.length) {
                    return _buildItemQuestion(
                      index,
                      onTap: context.read<TestIQCubit>().chooseAnswer,
                    );
                  }
                  return _buildResult();
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildResult() {
    return BlocBuilder<TestIQCubit, TestIQState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            const SizedBox(height: 70),
            Text(
              AppLocal.text.test_iq_page_iq_test_result,
              style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
            ),
            Text(
              "${state.score}/${state.answers.length}",
              style: TextStyle(
                color: AppColors.deepSaffron,
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 70),
            CustomButton(
              width: 260,
              onPressed: TestIQCoordinator.showSearchJob,
              title: AppLocal.text.apply_job_page_find_similar_job,
              isElevated: false,
            ),
            const SizedBox(height: 20),
            CustomButton(
              width: 260,
              onPressed: TestIQCoordinator.backToHome,
              title: AppLocal.text.apply_job_page_back_to_home,
            )
          ],
        );
      },
    );
  }

  Widget _buildItemQuestion(
    int index, {
    required Function(int index, int answer) onTap,
  }) {
    return BlocBuilder<TestIQCubit, TestIQState>(
      buildWhen: (previous, current) =>
          previous.answers != current.answers ||
          previous.questions != current.questions,
      builder: (context, state) {
        double width = MediaQuery.sizeOf(context).width;
        bool isFinish = index >= state.questions!.length - 1;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                AppLocal.text.test_iq_page_question_title(index + 1),
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 20),
              customImage(
                url: state.questions?[index].question ?? "",
                size: width / 1.5,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.questions?[index].answer.length ?? 0,
                itemBuilder: (context, gridIndex) {
                  return GestureDetector(
                    onTap: () => onTap(index, gridIndex),
                    child: Row(
                      children: [
                        Radio(
                          value: gridIndex,
                          groupValue: state.answers[index],
                          onChanged: (value) => onTap(index, value!),
                        ),
                        customImage(
                          url: state.questions?[index].answer[gridIndex] ?? "",
                          size: width / 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomButton(
                  title: isFinish
                      ? AppLocal.text.test_iq_page_finish
                      : AppLocal.text.test_iq_page_next,
                  onPressed: isFinish
                      ? context.read<TestIQCubit>().finish
                      : context.read<TestIQCubit>().nextPage,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }

  Widget customImage({required String url, required double size}) {
    return CachedNetworkImage(
      imageUrl: url,
      width: size,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          ItemLoading(width: size, height: size, radius: 0),
      errorWidget: (context, url, error) => Icon(
        FontAwesomeIcons.triangleExclamation,
        color: AppColors.deepSaffron,
      ),
    );
  }
}
