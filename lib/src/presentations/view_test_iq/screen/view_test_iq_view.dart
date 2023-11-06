import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/item_loading.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/int_extension.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/test_iq/widgets/question_loading.dart';
import 'package:jobspot/src/presentations/view_test_iq/cubit/view_test_iq_cubit.dart';

class ViewTestIQView extends StatelessWidget {
  const ViewTestIQView({super.key, required this.time});

  final int time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocal.text.test_iq_page_test_iq),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 20),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: BlocConsumer<ViewTestIQCubit, ViewTestIQState>(
        listener: (context, state) {
          if (state.error != null) {
            customToast(context, text: state.error ?? "");
          }
        },
        buildWhen: (previous, current) =>
            previous.questions != current.questions,
        builder: (context, state) {
          if (state.questions != null) {
            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: context.read<ViewTestIQCubit>().controller,
              itemCount: state.questions!.length + 1,
              itemBuilder: (context, index) {
                if (index < state.questions!.length) {
                  return _buildItemQuestion(index);
                }
                return _buildResult();
              },
            );
          }
          return const QuestionLoading();
        },
      ),
    );
  }

  Widget _buildResult() {
    return BlocBuilder<ViewTestIQCubit, ViewTestIQState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            const SizedBox(height: 70),
            Text(
              AppLocal.text.test_iq_page_test_result,
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
            const SizedBox(height: 15),
            Text(
              AppLocal.text.test_iq_page_finished_in(
                  "${(time ~/ 60).digits()}:${(time % 60).digits()}"),
              style: AppStyles.boldTextHaiti,
            ),
            const SizedBox(height: 100),
          ],
        );
      },
    );
  }

  Widget _buildItemQuestion(int index) {
    return BlocBuilder<ViewTestIQCubit, ViewTestIQState>(
      buildWhen: (previous, current) =>
          previous.answers != current.answers ||
          previous.questions != current.questions,
      builder: (context, state) {
        double width = MediaQuery.sizeOf(context).width;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocal.text.test_iq_page_question_title(index + 1),
                    style: AppStyles.boldTextHaiti.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    state.answers[index] == state.questions![index].right
                        ? AppLocal.text.test_iq_page_correct
                        : AppLocal.text.test_iq_page_wrong,
                    style: TextStyle(
                      color:
                          state.answers[index] == state.questions![index].right
                              ? AppColors.deepSaffron
                              : Colors.red,
                    ),
                  ),
                ],
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
                  return Row(
                    children: [
                      Radio(
                        value: gridIndex,
                        groupValue: state.questions![index].right == gridIndex
                            ? state.questions![index].right
                            : state.answers[index],
                        activeColor: gridIndex == state.questions![index].right
                            ? AppColors.deepSaffron
                            : Colors.red,
                        onChanged: (value) {},
                      ),
                      customImage(
                        url: state.questions?[index].answer[gridIndex] ?? "",
                        size: width / 3,
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomButton(
                  title: AppLocal.text.test_iq_page_next,
                  onPressed: context.read<ViewTestIQCubit>().nextPage,
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
