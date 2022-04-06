import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_model.freezed.dart';
part 'learning_model.g.dart';

@freezed
class LearningModel with _$LearningModel {
  factory LearningModel({
    required String uid,
    required String title,
    required String description,
    required String difficulty,
    required String category,
    required DateTime created,
    DateTime? updated,
  }) = _LearningModel;

  factory LearningModel.fromJson(Map<String, dynamic> json) =>
      _$LearningModelFromJson(json);
}
