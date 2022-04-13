import 'package:today_i_learned/src/core/core.dart';
import 'package:today_i_learned/src/core/repositories/crud_repository.dart';
import 'package:today_i_learned/src/goals/models/models.dart';

abstract class GoalRepository implements CrudRepository<GoalModel> {}
