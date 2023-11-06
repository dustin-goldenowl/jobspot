import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/api/pdf_summary_api_service.dart';

part 'view_pdf_state.dart';

class ViewPDFCubit extends Cubit<ViewPDFState> {
  ViewPDFCubit() : super(const ViewPDFState(isLoading: false));

  Future summaryPDF(String url) async {
    emit(state.copyWith(isLoading: true));
    final response = await PDFSummaryApiService.pdfSummary(url);
    if (response is DataSuccess) {
      emit(state.copyWith(summary: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void showSummaryDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Center(child: Text(AppLocal.text.view_pdf_page_summary)),
          content: Text(state.summary ?? ""),
        );
      },
    );
  }
}
