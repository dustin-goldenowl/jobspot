import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/main/widgets/bottom_sheet_post_option_view.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void deleteSaveJob(String jobID) {
    emit(state.copyWith(jobID: jobID));
  }

  void deleteAllSaveJob() {
    emit(state.copyWith(isDeleteAllSaveJob: true));
  }

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
}
