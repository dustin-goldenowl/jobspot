import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/main/widgets/custom_bottom_bar.dart';

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
          return SafeArea(
            child: CustomBottomBar(
              changeTab: cubit.toPage,
              onTap: () => cubit.showBottomSheet(context),
              currentIndex: state.currentIndex,
            ),
          );
        },
      ),
      body: PageView.builder(
        controller: cubit.pageController,
        itemCount: 4,
        onPageChanged: cubit.changeIndex,
        itemBuilder: (context, index) {
          return PageStorage(bucket: cubit.bucket, child: cubit.screens[index]);
        },
      ),
    );
  }
}
