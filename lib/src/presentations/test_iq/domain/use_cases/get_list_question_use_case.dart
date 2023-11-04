import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/repositories/test_iq_repository.dart';

@lazySingleton
class GetListQuestionUseCase
    extends UseCase<DataState<List<QuestionEntity>>, dynamic> {
  final TestIQRepository _repository;

  GetListQuestionUseCase(this._repository);

  @override
  Future<DataState<List<QuestionEntity>>> call({params}) {
    return _repository.getListQuestion();
  }
}
