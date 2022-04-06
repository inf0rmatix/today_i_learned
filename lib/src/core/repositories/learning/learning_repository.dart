import 'package:today_i_learned/src/core/models/models.dart';

abstract class LearningRepository {
  Future<LearningModel> create(LearningModel learningModel);

  Future<LearningModel?> findOne(String uid);

  Future<LearningModel> update(LearningModel learningModel);

  Future<bool> delete(LearningModel learningModel);

  Future<List<LearningModel>> findAll();
}
