import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/core/repositories/memory_repository.dart';

class LearningRepositoryMemory extends MemoryRepository<LearningModel> implements LearningRepository {
  LearningRepositoryMemory()
      : super(
          getUid: (learning) => learning.uid,
          setUid: (learning, uid) => learning.copyWith(uid: uid),
          toJson: (learning) => learning.toJson(),
          fromJson: (json) => LearningModel.fromJson(json),
        );
}
