import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart';

@LazySingleton(as: JobPositionRepository)
class JobPositionRepositoryImpl extends JobPositionRepository {
  @override
  Future<DataState<List<String>>> searchJobPosition(String query) async {
    try {
      final data = await XCollection.jobPosition
          .where(
            "title",
            isGreaterThanOrEqualTo: query.toLowerCase(),
            isLessThan: '${query.toLowerCase()}z',
          )
          .get();
      Set<String> listJobPosition =
          query.isNotEmpty ? {query.capitalizedString} : {};
      for (var element in data.docs) {
        listJobPosition.add(element.data()["title"]);
      }
      return DataSuccess(listJobPosition.toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
