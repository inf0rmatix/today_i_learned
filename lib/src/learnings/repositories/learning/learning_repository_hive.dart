import 'package:today_i_learned/src/app/repositories/repositories.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

class LearningRepositoryHive extends HiveRepository<LearningModel> implements LearningRepository {
  LearningRepositoryHive()
      : super(
          boxName: 'learnings',
          getUid: (learning) => learning.uid,
          setUid: (learning, uid) => learning.copyWith(uid: uid),
          toJson: (learning) => learning.toJson(),
          fromJson: (json) => LearningModel.fromJson(json),
        );
}
