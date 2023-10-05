import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/connection/screen/connection_page.dart';
import 'package:jobspot/src/presentations/home/screen/home_page.dart';
import 'package:jobspot/src/presentations/main/widgets/bottom_sheet_post_option_view.dart';
import 'package:jobspot/src/presentations/notification/screen/notification_page.dart';
import 'package:jobspot/src/presentations/save_job/screen/save_job_page.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final PageStorageBucket bucket = PageStorageBucket();
  final PageController pageController = PageController();
  List<Widget> screens = [
    const HomePage(),
    const ConnectionPage(),
    const NotificationPage(),
    const SaveJobPage(),
  ];

  MainCubit() : super(const MainState(0));

  void toPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    emit(state.copyWith(index));
  }

  void changeIndex(int index) => emit(state.copyWith(index));

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => const BottomSheetPostOptionView(),
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
