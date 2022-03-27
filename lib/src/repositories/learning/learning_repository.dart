import 'package:today_i_learned/src/models/learning_model.dart';

abstract class LearningRepository {
  Future<LearningModel> create(LearningModel learningModel);

  Future<LearningModel?> findOne(String uid);

  Future<LearningModel> update(LearningModel learningModel);

  Future<bool> delete(LearningModel learningModel);
}
