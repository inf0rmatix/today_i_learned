import 'package:today_i_learned/src/app/repositories/repositories.dart';
import 'package:today_i_learned/src/goals/goals.dart';

class GoalRepositoryHive extends HiveRepository<GoalModel> implements GoalRepository {
  GoalRepositoryHive()
      : super(
          boxName: 'goals',
          getUid: (goal) => goal.uid,
          setUid: (goal, uid) => goal.copyWith(uid: uid),
          toJson: (goal) => goal.toJson(),
          fromJson: (json) => GoalModel.fromJson(json),
        );
}
