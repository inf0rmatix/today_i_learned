import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/core/repositories/memory_repository.dart';
import 'package:today_i_learned/src/goals/models/models.dart';
import 'package:today_i_learned/src/goals/repositories/repositories.dart';

class GoalRepositoryMemory extends MemoryRepository<GoalModel> implements GoalRepository {
  GoalRepositoryMemory()
      : super(
          getUid: (goal) => goal.uid,
          setUid: (goal, uid) => goal.copyWith(uid: uid),
          fromJson: (json) => GoalModel.fromJson(json),
          toJson: (goal) => goal.toJson(),
        );
}
