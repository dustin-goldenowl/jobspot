part of 'view_test_iq_cubit.dart';

class ViewTestIQState extends Equatable {
  const ViewTestIQState({
    this.questions,
    this.error,
    required this.answers,
  });

  final List<QuestionEntity>? questions;
  final String? error;
  final List<int?> answers;

  ViewTestIQState copyWith({
    List<QuestionEntity>? questions,
    String? error,
    List<int?>? answers,
  }) {
    return ViewTestIQState(
      error: error,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
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
  List<Object?> get props => [questions, error, answers];
}
