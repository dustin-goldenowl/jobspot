import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:path_provider/path_provider.dart';

class PDFSummaryApiService {
  PDFSummaryApiService._();

  static String get _pdfSummaryUrl => "http://192.168.1.133:5000/pdfsummary";

  static Future<DataState<String>> pdfSummary(String urlPDF) async {
    try {
      Dio dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/pdf_summary.pdf";
      await dio.download(urlPDF, filePath);

      FormData formData =
          FormData.fromMap({'pdfs': await MultipartFile.fromFile(filePath)});

      Response summary = await dio.post(_pdfSummaryUrl, data: formData);
      return DataSuccess(summary.data["summary"]);
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }
}
