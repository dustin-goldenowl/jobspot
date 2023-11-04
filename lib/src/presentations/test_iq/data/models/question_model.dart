import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/question_entity.dart';

class QuestionModel {
  String question;
  List<String> answer;
  int right;

  QuestionModel({
    required this.answer,
    required this.question,
    required this.right,
  });

  factory QuestionModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return QuestionModel(
      answer: List<String>.from(data["answer"].map((x) => x)),
      question: data["question"],
      right: data["right"],
    );
  }

  QuestionEntity toEntity() {
    return QuestionEntity(answer: answer, question: question, right: right);
  }
}
