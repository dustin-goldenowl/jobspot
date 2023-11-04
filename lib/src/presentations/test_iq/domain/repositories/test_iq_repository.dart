import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';

abstract class TestIQRepository {
  Future<DataState<List<QuestionEntity>>> getListQuestion();
}
