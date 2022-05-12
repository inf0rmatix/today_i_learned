import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_model.freezed.dart';
part 'goal_model.g.dart';

@freezed
class GoalModel with _$GoalModel {
  static const double noDifficultyRequirementValue = -1;

  factory GoalModel({
    required String uid,
    required String title,
    required DateTime created,
    DateTime? completed,
    required DateTime deadline,
    @Default(false) bool isAchieved,
    @Default(false) bool isFailed,
    // ignore: no-magic-number
    @Default(0) int learnings,
    // ignore: no-magic-number
    @Default(1) int requiredLearnings,
    @Default(GoalModel.noDifficultyRequirementValue) double requiredDifficulty,
    String? category,
  }) = _GoalModel;
  GoalModel._();

  factory GoalModel.fromJson(Map<String, dynamic> json) => _$GoalModelFromJson(json);
}
