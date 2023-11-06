import 'package:jobspot/src/presentations/test_iq/domain/entities/add_result_test_iq_entity.dart';

class AddResultTestIQModel {
  final String applyID;
  final int score;
  final List<int?> answers;
  final int time;

  AddResultTestIQModel({
    required this.applyID,
    required this.score,
    required this.answers,
    required this.time,
  });

  factory AddResultTestIQModel.fromEntity(AddResultTestIQEntity entity) {
    return AddResultTestIQModel(
      applyID: entity.applyID,
      score: entity.score,
      answers: entity.answers,
      time: entity.time,
    );
  }

  Map<String, dynamic> toMap() =>
      {"resultIQ": answers, "score": score, "time": time};
}
