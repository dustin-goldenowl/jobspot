import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/test_iq/data/models/question_model.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/add_result_test_iq_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/repositories/test_iq_repository.dart';

@LazySingleton(as: TestIQRepository)
class TestIQRepositoryImpl extends TestIQRepository {
  @override
  Future<DataState<List<QuestionEntity>>> getListQuestion() async {
    try {
      final resposne = await XCollection.question.get();
      List<QuestionModel> listQuestion = resposne.docs
          .map((e) => QuestionModel.fromDocumentSnapshot(e))
          .toList();
      return DataSuccess(listQuestion.map((e) => e.toEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> addResultIQTest(AddResultTestIQEntity result) async {
    try {
      await XCollection.apply
          .doc(result.applyID)
          .update({"resultIQ": result.answers, "score": result.score});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
