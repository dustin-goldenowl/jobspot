import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/function/loading_animation.dart';
import 'package:jobspot/src/presentations/view_pdf/cubit/view_pdf_cubit.dart';

class ViewPDFView extends StatelessWidget {
  const ViewPDFView({super.key, this.title, required this.url});

  final String? title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (url.isLink)
            IconButton(
              onPressed: () => context.read<ViewPDFCubit>().summaryPDF(url),
              icon: Icon(FontAwesomeIcons.fileLines, color: AppColors.haiti),
            )
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(title ?? ""),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
      ),
      body: BlocListener<ViewPDFCubit, ViewPDFState>(
        listenWhen: (previous, current) {
          if (previous.isLoading) Navigator.of(context).pop();

          return true;
        },
        listener: (context, state) {
          if (state.isLoading) {
            loadingAnimation(
              context,
              content: AppLocal.text.view_pdf_page_analyzing_data,
            );
          }
          if (state.error != null) {
            customToast(context, text: state.error ?? "");
          }
          if (state.summary != null) {
            context.read<ViewPDFCubit>().showSummaryDialog(context);
          }
        },
        child: SafeArea(
          child: url.isLink
              ? const PDF().cachedFromUrl(
                  url,
                  placeholder: (progress) => Center(child: Text('$progress %')),
                  errorWidget: (error) => Center(child: Text(error.toString())),
                )
              : const PDF().fromPath(url),
        ),
      ),
    );
  }
}
