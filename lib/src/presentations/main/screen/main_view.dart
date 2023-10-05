import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/main/widgets/custom_bottom_bar.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainCubit>();
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return CustomBottomBar(
            changeTab: (index) {
              cubit.changeIndex(index);
              cubit.toPage(index);
            },
            onTap: () => showBottomSheet(context),
            currentIndex: state.currentIndex,
          );
        },
      ),
      body: PageView.builder(
        controller: cubit.pageController,
        itemCount: 4,
        onPageChanged: (value) => cubit.changeIndex(value),
        itemBuilder: (context, index) {
          return PageStorage(bucket: cubit.bucket, child: cubit.screens[index]);
        },
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
          width: double.infinity,
          height: 330,
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.nightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                AppLocal.text.main_page_what_would_you_like_to_add,
                style: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocal.text.main_page_content_bottom_sheet,
                style: AppStyles.normalTextMulledWine,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  context.router.pop();
                  //Todo show create post page
                },
                title: AppLocal.text.main_page_post.toUpperCase(),
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () {
                  context.router.pop();
                  //Todo show create job page
                },
                title: AppLocal.text.main_page_make_job.toUpperCase(),
                isElevated: false,
              ),
            ],
          ),
        );
      },
    );
  }
}
