part of 'view_language_cubit.dart';

class ViewLanguageState extends Equatable {
  const ViewLanguageState({this.listLanguage, this.error});

  final List<LanguageEntity>? listLanguage;
  final String? error;

  ViewLanguageState copy({List<LanguageEntity>? listLanguage, String? error}) {
    return ViewLanguageState(
      listLanguage: listLanguage ?? this.listLanguage,
      error: error,
    );
  }

  @override
  List<Object?> get props => [listLanguage, error];
}
