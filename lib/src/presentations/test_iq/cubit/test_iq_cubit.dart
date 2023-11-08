import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_in/widgets/custom_button.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/add_result_test_iq_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/add_result_test_iq_use_case.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/get_list_question_use_case.dart';

part 'test_iq_state.dart';

@injectable
class TestIQCubit extends Cubit<TestIQState> {
  final PageController controller = PageController();
  late Timer _timer;

  final GetListQuestionUseCase _getListQuestionUseCase;
  final AddResultTestIQUseCase _addResultTestIQUseCase;

  String? _applyID;

  TestIQCubit(this._getListQuestionUseCase, this._addResultTestIQUseCase)
      : super(const TestIQState(answers: [], currentPage: 0, time: 300)) {
    getListQuestion();
  }

  void init(String id) => _applyID = id;

  Future getListQuestion() async {
    final response = await _getListQuestionUseCase.call();
    if (response is DataSuccess) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          if (state.time > 0) {
            emit(state.copyWith(time: state.time - 1));
          } else {
            finish();
          }
        },
      );
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

  void finish() {
    _timer.cancel();
    addResultTestIQ();
    emit(state.copyWith(currentPage: state.answers.length));
  }

  Future<bool> showAlertDialog(BuildContext context) async {
    final response = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(AppLocal.text.test_iq_page_cancel_test,
                  style: AppStyles.boldTextHaiti)),
          content: Text(AppLocal.text.test_iq_page_cancel_test_content,
              style: AppStyles.normalTextMulledWine),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          actions: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      title: AppLocal.text.test_iq_page_no,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: CustomButton(
                      isElevated: false,
                      onPressed: () => Navigator.of(context).pop(true),
                      title: AppLocal.text.test_iq_page_yes,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
    return response ?? false;
  }

  Future addResultTestIQ() async {
    final response = await _addResultTestIQUseCase.call(
        params: AddResultTestIQEntity(
      applyID: _applyID ?? "",
      answers: state.answers,
      score: state.score,
      time: 3600 - state.time,
    ));
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    controller.dispose();
    return super.close();
  }
}
