import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart';

@lazySingleton
class GetCountriesUseCase
    extends UseCase<DataState<List<CountryEntity>>, dynamic> {
  final SearchLanguageRepository _repository;

  GetCountriesUseCase(this._repository);

  @override
  Future<DataState<List<CountryEntity>>> call({params}) {
    return _repository.getCountries();
  }
}
