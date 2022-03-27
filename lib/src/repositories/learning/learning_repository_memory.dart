import 'package:today_i_learned/src/models/learning_model.dart';
import 'package:today_i_learned/src/repositories/learning/learning_repository.dart';

class LearningRepositoryMemory implements LearningRepository {
  final List<LearningModel> data = [];
  var _idCounter = 0;

  @override
  Future<LearningModel> create(LearningModel learningModel) async {
    var createdLearning = learningModel.copyWith(uid: (_idCounter++).toString());

    data.add(createdLearning);

    return createdLearning;
  }

  @override
  Future<LearningModel?> findOne(String uid) async {
    var results = data.where((element) => element.uid == uid);

    return results.isEmpty ? null : results.first;
  }

  @override
  Future<LearningModel> update(LearningModel learningModel) async {
    data.removeWhere((element) => element.uid == learningModel.uid);

    data.add(learningModel);

    return learningModel;
  }

  @override
  Future<bool> delete(LearningModel learningModel) async {
    data.removeWhere((element) => element.uid == learningModel.uid);

    return true;
  }
}
