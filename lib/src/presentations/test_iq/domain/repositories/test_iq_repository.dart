import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/add_result_test_iq_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';

abstract class TestIQRepository {
  Future<DataState<List<QuestionEntity>>> getListQuestion();

  Future<DataState<bool>> addResultIQTest(AddResultTestIQEntity result);
}
