import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/get_list_question_use_case.dart';

part 'view_test_iq_state.dart';

@injectable
class ViewTestIQCubit extends Cubit<ViewTestIQState> {
  final PageController controller = PageController();

  final GetListQuestionUseCase _getListQuestionUseCase;

  ViewTestIQCubit(this._getListQuestionUseCase)
      : super(const ViewTestIQState(answers: []));

  Future getListQuestion(List<int?> resultIQ) async {
    final response = await _getListQuestionUseCase.call();
    if (response is DataSuccess) {
      emit(
        state.copyWith(questions: response.data, answers: resultIQ),
      );
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void nextPage() => controller.nextPage(
      duration: const Duration(milliseconds: 300), curve: Curves.linear);

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
