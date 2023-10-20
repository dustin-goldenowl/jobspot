import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/screen/add_language_view.dart';

@RoutePage()
class AddLanguagePage extends StatelessWidget {
  const AddLanguagePage({super.key, this.language});

  final UpdateLanguageEntity? language;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddLanguageCubit>()..initLanguage(language),
      child: const AddLanguageView(),
    );
  }
}
