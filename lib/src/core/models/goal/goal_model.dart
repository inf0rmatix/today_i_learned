import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
class GoalModel with _$GoalModel {
  static const double noDifficultyRequirementValue = -1;

  bool get isComplete => learnings >= requiredLearnings && requiredLearnings > 0;

  factory GoalModel({
    required String uid,
    required String title,
    required DateTime created,
    DateTime? completed,
    required DateTime deadline,
    // ignore: no-magic-number
    @Default(0) int learnings,
    required int requiredLearnings,
    @Default(GoalModel.noDifficultyRequirementValue) double requiredDifficulty,
  }) = _GoalModel;
  GoalModel._();

  factory GoalModel.fromJson(Map<String, dynamic> json) => _$GoalModelFromJson(json);
}
