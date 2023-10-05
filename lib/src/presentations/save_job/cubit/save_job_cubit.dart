import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/save_job/widgets/bottom_sheet_save_job_option_view.dart';

part 'save_job_state.dart';

class SaveJobCubit extends Cubit<SaveJobState> {
  SaveJobCubit() : super(const SaveJobState());

  void showBottomSheetOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => const BottomSheetSaveJobOptionView(),
    );
  }
}
