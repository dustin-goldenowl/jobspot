import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/get_list_question_use_case.dart';

part 'test_iq_state.dart';

@injectable
class TestIQCubit extends Cubit<TestIQState> {
  final PageController controller = PageController();

  final GetListQuestionUseCase _getListQuestionUseCase;

  TestIQCubit(this._getListQuestionUseCase)
      : super(const TestIQState(answers: [], currentPage: 0)) {
    getListQuestion();
  }

  Future getListQuestion() async {
    final response = await _getListQuestionUseCase.call();
    if (response is DataSuccess) {
      emit(state.copyWith(
        questions: response.data,
        answers: List.generate(response.data?.length ?? 0, (index) => null),
      ));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void chooseAnswer(int index, int answer) {
    final listAnswer = [...state.answers];
    listAnswer[index] = answer;
    emit(state.copyWith(answers: listAnswer));
  }

  void nextPage() => controller.nextPage(
      duration: const Duration(milliseconds: 300), curve: Curves.linear);

  void onChangePage(int index) => emit(state.copyWith(currentPage: index));

  void finish() => emit(state.copyWith(currentPage: state.answers.length));

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
