import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/view_pdf/cubit/view_pdf_cubit.dart';
import 'package:jobspot/src/presentations/view_pdf/screen/view_pdf_view.dart';

@RoutePage()
class ViewPDFPage extends StatelessWidget {
  const ViewPDFPage({super.key, this.title, required this.url});

  final String? title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewPDFCubit(),
      child: ViewPDFView(url: url, title: title),
    );
  }
}
