import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/learnings/models/learning/learning_model.dart';
import 'package:today_i_learned/src/learnings/repositories/learning/learning_repository.dart';

class LearningRepositoryMemory extends MemoryRepository<LearningModel> implements LearningRepository {
  LearningRepositoryMemory()
      : super(
          getUid: (learning) => learning.uid,
          setUid: (learning, uid) => learning.copyWith(uid: uid),
          toJson: (learning) => learning.toJson(),
          fromJson: (json) => LearningModel.fromJson(json),
        );
}
