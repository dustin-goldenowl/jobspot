import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/job_description/widgets/bottom_sheet_save_change.dart';

part 'job_description_state.dart';

class JobDescriptionCubit extends Cubit<JobDescriptionState> {
  TextEditingController descriptionController = TextEditingController();
  String description;

  JobDescriptionCubit({required this.description})
      : super(const JobDescriptionState()) {
    descriptionController.text = description;
  }

  void showNotiChangeAbout(
    BuildContext context, {
    required Function(String description) onSave,
  }) {
    if (description != descriptionController.text) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (_) => BottomSheetSaveChange(
          onSave: () => onSave(descriptionController.text),
        ),
      );
    } else {
      Navigator.of(context).pop();
    }
  }
}
