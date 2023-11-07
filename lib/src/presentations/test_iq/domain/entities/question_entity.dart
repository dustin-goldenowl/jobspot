class QuestionEntity {
  final String question;
  final List<String> answer;
  final int right;

  QuestionEntity({
    required this.answer,
    required this.question,
    required this.right,
  });
}
