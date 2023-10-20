import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';
import 'package:jobspot/src/presentations/search_language/screen/search_language_view.dart';

@RoutePage()
class SearchLanguagePage extends StatelessWidget {
  const SearchLanguagePage({super.key, required this.onBack});

  final Function(CountryEntity country) onBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchLanguageCubit>(),
      child: SearchLanguageView(onBack: onBack),
    );
  }
}
