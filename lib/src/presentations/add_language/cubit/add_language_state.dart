part of 'add_language_cubit.dart';

class AddLanguageState extends Equatable {
  const AddLanguageState({
    this.country,
    this.error,
    required this.isLoading,
    required this.isFirst,
    required this.oralLevel,
    required this.writtenLevel,
  });

  final CountryEntity? country;
  final bool isFirst;
  final bool isLoading;
  final int oralLevel;
  final int writtenLevel;
  final String? error;

  factory AddLanguageState.ds() {
    return const AddLanguageState(
      isFirst: false,
      oralLevel: 0,
      writtenLevel: 0,
      isLoading: false,
    );
  }

  AddLanguageState copyWith({
    CountryEntity? country,
    String? error,
    bool? isFirst,
    int? oralLevel,
    int? writtenLevel,
    bool isLoading = false,
  }) {
    return AddLanguageState(
      isFirst: isFirst ?? this.isFirst,
      oralLevel: oralLevel ?? this.oralLevel,
      writtenLevel: writtenLevel ?? this.writtenLevel,
      country: country ?? this.country,
      error: error,
      isLoading: isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [country, isFirst, oralLevel, writtenLevel, error, isLoading];
}
