import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/screen/view_language_view.dart';

@RoutePage()
class ViewLanguagePage extends StatelessWidget {
  const ViewLanguagePage({super.key, required this.languages});

  final List<LanguageEntity> languages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewLanguageCubit>()..initLanguage(languages),
      child: const ViewLanguageView(),
    );
  }
}
