import 'package:today_i_learned/src/core/models/category/category_model.dart';
import 'package:today_i_learned/src/core/repositories/category/category.dart';
import 'package:today_i_learned/src/core/repositories/memory_repository.dart';

class CategoryRepositoryMemory extends MemoryRepository<CategoryModel> implements CategoryRepository {
  CategoryRepositoryMemory()
      : super(
          getUid: (category) => category.uid,
          setUid: (category, uid) => category.copyWith(uid: uid),
          fromJson: (json) => CategoryModel.fromJson(json),
          toJson: (category) => category.toJson(),
        );
}
