import 'package:today_i_learned/src/app/app.dart';
import 'package:today_i_learned/src/categories/models/models.dart';
import 'package:today_i_learned/src/categories/repositories/repositories.dart';

class CategoryRepositoryMemory extends MemoryRepository<CategoryModel> implements CategoryRepository {
  CategoryRepositoryMemory()
      : super(
          getUid: (category) => category.uid,
          setUid: (category, uid) => category.copyWith(uid: uid),
          fromJson: (json) => CategoryModel.fromJson(json),
          toJson: (category) => category.toJson(),
        );
}
