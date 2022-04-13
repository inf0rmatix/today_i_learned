import 'package:today_i_learned/src/core/repositories/crud_repository.dart';
import 'package:today_i_learned/src/learnings/models/learning/learning_model.dart';

abstract class LearningRepository implements CrudRepository<LearningModel> {}
