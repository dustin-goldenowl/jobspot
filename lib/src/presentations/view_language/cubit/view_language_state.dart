part of 'view_language_cubit.dart';

class ViewLanguageState extends Equatable {
  const ViewLanguageState({this.listLanguage});

  final List<LanguageEntity>? listLanguage;

  ViewLanguageState copy({List<LanguageEntity>? listLanguage}) {
    return ViewLanguageState(listLanguage: listLanguage ?? this.listLanguage);
  }

  @override
  List<Object?> get props => [listLanguage];
}
