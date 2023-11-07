part of 'test_iq_cubit.dart';

class TestIQState extends Equatable {
  const TestIQState({
    this.questions,
    this.error,
    required this.answers,
    required this.currentPage,
    required this.time,
  });

  final List<QuestionEntity>? questions;
  final String? error;
  final List<int?> answers;
  final int currentPage;
  final int time;

  TestIQState copyWith({
    List<QuestionEntity>? questions,
    String? error,
    List<int?>? answers,
    int? currentPage,
    int? time,
  }) {
    return TestIQState(
      error: error,
      currentPage: currentPage ?? this.currentPage,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      time: time ?? this.time,
    );
  }

  int get score {
    int count = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == questions![i].right) {
        ++count;
      }
    }
    return count;
  }

  @override
  List<Object?> get props => [questions, error, answers, currentPage, time];
}
